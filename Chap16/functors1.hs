-- functors1.hs
module Functors1 where

data FixMePls a = FixMe
              | Pls a
              deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)
