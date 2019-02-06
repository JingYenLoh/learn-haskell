module Lib where

import Test.QuickCheck

-- Trivial
data Trivial = Trivial
             deriving (Eq, Show)

instance Semigroup Trivial where
  Trivial <> Trivial = Trivial

instance Monoid Trivial where
  mempty = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

-- Identity
newtype Identity a = Identity a
                   deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
  (Identity x) <> (Identity y) = Identity (x <> y)

instance (Monoid a) => Monoid (Identity a) where
  mempty = Identity mempty

instance (Arbitrary a) => Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return (Identity a)

-- Two
data Two a b = Two a b
             deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two a b <> Two a' b' = Two (a <> a') (b <> b')

instance (Monoid a, Monoid b) => Monoid (Two a b) where
  mempty = Two mempty mempty

instance (Semigroup a, Arbitrary a, Semigroup b, Arbitrary b)
       => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return (Two a b)

-- Three
data Three a b c = Three a b c
                 deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
       => Semigroup (Three a b c) where
  Three a b c <> Three a' b' c' =
    Three (a <> a') (b <> b') (c <> c')

instance (Semigroup a, Arbitrary a,
          Semigroup b, Arbitrary b,
          Semigroup c, Arbitrary c)
       => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (Three a b c)

-- Four
data Four a b c d = Four a b c d
                  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d)
       => Semigroup (Four a b c d) where
  Four a b c d <> Four a' b' c' d' =
    Four (a <> a') (b <> b') (c <> c') (d <> d')

instance (Semigroup a, Arbitrary a,
          Semigroup b, Arbitrary b,
          Semigroup c, Arbitrary c,
          Semigroup d, Arbitrary d)
       => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return (Four a b c d)

-- BoolConj
newtype BoolConj = BoolConj Bool
                 deriving (Eq, Show)

instance Semigroup BoolConj where
  BoolConj True <> BoolConj True = BoolConj True
  _             <> _             = BoolConj False

instance Monoid BoolConj where
  mempty = BoolConj True

instance Arbitrary BoolConj where
  arbitrary = oneof [ return $ BoolConj True
                    , return $ BoolConj False
                    ]

-- BoolDisj
newtype BoolDisj = BoolDisj Bool
                 deriving (Eq, Show)

instance Semigroup BoolDisj where
  BoolDisj False <> BoolDisj False = BoolDisj False
  _              <> _              = BoolDisj True

instance Monoid BoolDisj where
  mempty = BoolDisj False

instance Arbitrary BoolDisj where
  arbitrary = oneof [ return $ BoolDisj True
                    , return $ BoolDisj False
                    ]

-- Or
data Or a b = Fst a
            | Snd b
            deriving (Eq, Show)

instance Semigroup (Or a b) where
  Snd x <> _     = Snd x
  _     <> Snd x = Snd x
  Fst _ <> Fst y = Fst y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    oneof [ return $ Fst a
          , return $ Snd b
          ]

-- Combine
newtype Combine a b =
  Combine { unCombine :: a -> b }

instance (Semigroup b) => Semigroup (Combine a b) where
  Combine f <> Combine g =
    Combine (f <> g)

instance (Semigroup b, Monoid b) => Monoid (Combine a b) where
  mempty = Combine mempty

-- Comp
newtype Comp a =
  Comp { unComp :: a -> a }

instance Semigroup a => Semigroup (Comp a) where
  Comp f <> Comp g =
    Comp (f <> g)

instance Monoid a => Monoid (Comp a) where
  mempty = Comp mempty

-- Validation
data Validation a b = Failure' a
                    | Success' b
                    deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
  Success' a  <> _           = Success' a
  _           <> Success' a  = Success' a
  Failure' a  <> Failure' b  = Failure' (a <> b)

-- Mem
newtype Mem s a =
  Mem { runMem :: s -> (a, s)
      }

instance Semigroup a => Semigroup (Mem s a) where
  Mem f <> Mem g = undefined

instance Monoid a => Monoid (Mem s a) where
  mempty = undefined
