-- | Chapter Exercises (Monad)

module ChapterExercises where

import Prelude hiding (Left, Right)
import Control.Monad

data Nope a = NopeDotJpg
            deriving (Eq, Show)

instance Functor Nope where
  fmap _ _ = NopeDotJpg

instance Applicative Nope where
  pure _ = NopeDotJpg
  _ <*> _ = NopeDotJpg

instance Monad Nope where
  _ >>= _ = NopeDotJpg


data PhhhbbtttEither b a = Left a
                         | Right b
                         deriving (Eq, Show)

instance Functor (PhhhbbtttEither b) where
  fmap f (Left a) = Left (f a)
  fmap _ (Right a) = Right a

instance Monoid b => Applicative (PhhhbbtttEither b) where
  pure = Left
  Left f <*> Left a = Left $ f a
  Right a <*> Right b = Right (a <> b)
  Left _ <*> Right b = Right b
  Right b <*> Left _ = Right b

instance Monoid b => Monad (PhhhbbtttEither b) where
  Left a >>= f = f a
  Right b >>= _ = Right b


newtype Identity a = Identity a
                   deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity a = Identity $ f a

instance Monad Identity where
  Identity a >>= f = f a


data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (f <$> xs)

instance Applicative List where
  pure a = Cons a Nil
  Nil <*> _ = Nil
  _ <*> Nil  = Nil
  Cons f fs <*> as = (f <$> as) `append` (fs <*> as)

instance Monad List where
  Nil >>= _ = Nil
  Cons x xs >>= f = Cons x' xs'
    where x' = undefined
          xs' = undefined
 
