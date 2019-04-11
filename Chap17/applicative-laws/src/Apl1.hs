module Apl1 where

import Control.Applicative
import Data.Monoid

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

-- TODO: Fix
instance Applicative List where
  pure a = Cons a Nil
  Nil <*> _ = Nil
  _ <*> Nil = Nil
  (Cons f fs) <*> xs = append (f <$> xs) (fs <*> xs)

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

take' :: Int -> List a -> List a
take' n xs = go n xs Nil where
  go _ Nil acc = acc
  go 0 _   acc = acc
  go n (Cons x' xs') acc = go (n-1) xs' (Cons x' acc)

newtype ZipList' a = ZipList' (List a)
                   deriving (Eq, Show)

toMyList :: [a] -> List a
toMyList [] = Nil
toMyList (x:xs) = Cons x $ toMyList xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _ = Nil
zipWith' _ _ Nil = Nil
zipWith' f (Cons a as) (Cons b bs) = Cons (f a b) (zipWith' f as bs)

instance Functor ZipList' where
  fmap f (ZipList' xs) =
    ZipList' $ f <$> xs

instance Applicative ZipList' where
  pure a = ZipList' (Cons a Nil)
  (ZipList' a) <*> (ZipList' Nil) = ZipList' Nil
  (ZipList' Nil) <*> (ZipList' _) = ZipList' Nil
  (ZipList' (Cons x xs)) <*> (ZipList' (Cons y ys)) =
    ZipList' $ Cons (x y) (zipWith' ($) xs ys)

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
