module InstancesOfFunc where

newtype Identity a = Identity a
instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

data Pair a = Pair a a
instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

data Two a b = Two a b
instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

data Three a b c = Three a b c
instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

data Four a b c d = Four a b c d
instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

data Four' a b = Four' a a a b

instance Functor (Four' a) where
  fmap f (Four' a0 a1 a2 b) = Four' a0 a1 a2 $ f b
