module Spec where

import Lib
import Test.QuickCheck

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                    => m
                    -> Bool
monoidRightIdentity a = (a <> mempty) == a

type TrivAssoc =
     Trivial
  -> Trivial
  -> Trivial
  -> Bool

type IdenAssoc =
     Identity String
  -> Identity String
  -> Identity String
  -> Bool

type TwoAssoc =
     Two String Trivial
  -> Two String Trivial
  -> Two String Trivial
  -> Bool

type ThreeAssoc =
     Three String String Trivial
  -> Three String String Trivial
  -> Three String String Trivial
  -> Bool

type FourAssoc =
     Four String String String Trivial
  -> Four String String String Trivial
  -> Four String String String Trivial
  -> Bool

type BoolConjAssoc =
     BoolConj
  -> BoolConj
  -> BoolConj
  -> Bool

type BoolDisjAssoc =
     BoolDisj
  -> BoolDisj
  -> BoolDisj
  -> Bool

f' :: Mem Integer [Char]
f' = Mem $ \s -> ("hi", s + 1)

main :: IO ()
main = do
  let rmzero  = runMem mempty 0
      rmleft  = runMem (f' <> mempty) 0
      rmright = runMem (mempty <> f') 0
  -- Trivial
  quickCheck (semigroupAssoc :: TrivAssoc)
  quickCheck (monoidLeftIdentity :: Trivial -> Bool)
  quickCheck (monoidRightIdentity :: Trivial -> Bool)
  -- Identity
  quickCheck (semigroupAssoc :: IdenAssoc)
  quickCheck (monoidLeftIdentity :: Identity String -> Bool)
  quickCheck (monoidRightIdentity :: Identity String -> Bool)
  -- Two
  quickCheck (semigroupAssoc :: TwoAssoc)
  quickCheck (monoidLeftIdentity :: Two String Trivial -> Bool)
  quickCheck (monoidRightIdentity :: Two String Trivial -> Bool)
  -- Three
  quickCheck (semigroupAssoc :: ThreeAssoc)
  -- Four
  quickCheck (semigroupAssoc :: FourAssoc)
  -- BoolConj
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  quickCheck (monoidLeftIdentity :: BoolConj -> Bool)
  quickCheck (monoidRightIdentity :: BoolConj -> Bool)
  -- BoolDisj
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
  quickCheck (monoidLeftIdentity :: BoolDisj -> Bool)
  quickCheck (monoidRightIdentity :: BoolDisj -> Bool)
  -- TODO: Combine
  -- TODO: Comp
  -- Validation
  let failure :: String -> Validation String Int
      failure = Failure'
      success :: Int -> Validation String Int
      success = Success'
  print $ success 1      <> failure "blah"
  print $ failure "woot" <> failure "blah"
  print $ success 1      <> success 2
  print $ failure "woot" <> success 2
  print $ rmleft
  print $ rmright
  print $ (rmzero :: (String, Int))
  print $ rmleft == runMem f' 0
  print $ rmright == runMem f' 0
