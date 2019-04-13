module Apl1 where

import Control.Applicative
import Data.Monoid

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure a = Cons a Nil
  Nil <*> _ = Nil
  _ <*> Nil = Nil
  (Cons f fs) <*> xs = append (f <$> xs) (fs <*> xs)
newtype ZipList' a = ZipList' (List a)
                   deriving (Eq, Show)

instance Functor ZipList' where
  fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative (ZipList') where
  pure a = ZipList' $ pure a
  _ <*> ZipList' Nil = ZipList' Nil
  ZipList' Nil <*> _ = ZipList' Nil
  (ZipList' (Cons f Nil)) <*> (ZipList' (Cons x xs)) =
    ZipList' $ Cons (f x) (f <$> xs)
  (ZipList' (Cons f fs)) <*> (ZipList' (Cons x Nil)) =
    ZipList' $ Cons (f x) (f <$> pure x)
  (ZipList' (Cons f fs)) <*> (ZipList' (Cons x xs)) =
    ZipList' $ Cons (f x) (fs <*> xs)

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b)
        -> List a
        -> List b
flatMap f as = concat' $ fmap f as

toMyList :: [a] -> List a
toMyList [] = Nil
toMyList (x:xs) = Cons x $ toMyList xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _ = Nil
zipWith' _ _ Nil = Nil
zipWith' f (Cons a as) (Cons b bs) = Cons (f a b) (zipWith' f as bs)

data Validation e a = Failure e
                    | Success a
                    deriving (Eq, Show)

instance Functor (Validation e) where
  fmap _ (Failure e) = Failure e
  fmap f (Success a) = Success (f a)

instance (Monoid e) => Applicative (Validation e) where
  pure = Success
  (Success f) <*> (Success a) = Success $ f a
  (Failure e) <*> (Failure f) = Failure $ e <> f
  (Failure e) <*> (Success _) = Failure e
  (Success _) <*> (Failure e) = Failure e

