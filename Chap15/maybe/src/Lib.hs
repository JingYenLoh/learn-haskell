module Lib where

import Data.Monoid
import Test.QuickCheck

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  (<>) (Only x) (Only y) = Only $ x <> y
  (<>) (Only x) _        = Only x
  (<>) _        (Only y) = Only y
  (<>) Nada     Nada     = Nada

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

monoidAssoc :: (Eq m, Monoid m)
            => m -> m -> m -> Bool
monoidAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                    => m
                    -> Bool
monoidRightIdentity a = (a <> mempty) == a

newtype First' a = First' { getFirst' :: Optional a }
                 deriving (Eq, Show)

onlyGen :: Arbitrary a => Gen (First' a)
onlyGen = do
  a <- arbitrary
  return (First' $ Only a)

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary =
    frequency [ (2, onlyGen)
              , (1, return $ First' $ Nada)
              ]

instance Semigroup a => Semigroup (First' a) where
  (First' x) <> (First' y) = First' $ x <> y

instance (Semigroup a) => Monoid (First' a) where
  mempty = First' Nada

firstMappend :: (Semigroup a)
             => First' a
             -> First' a
             -> First' a
firstMappend = mappend

type FirstMappend =
     First' String
  -> First' String
  -> First' String
  -> Bool

type FstId = First' String -> Bool
