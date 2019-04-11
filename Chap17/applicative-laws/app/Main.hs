module Main where

import Control.Applicative
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

import Lib
import Apl1
import ChapterExercises

instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [ Cons a (Cons b Nil)
             , Nil]

zipListGen :: Arbitrary a => Gen (ZipList' a)
zipListGen = do
  a <- arbitrary
  return (ZipList' a)

instance Arbitrary a => Arbitrary (ZipList' a) where
  arbitrary = zipListGen

instance Eq a => EqProp (ZipList' a) where
  xs =-= ys = xs' `eq` ys'
    where xs' = let (ZipList' l) = xs
                in take' 3000 l
          ys' = let (ZipList' l) = ys
                in take' 3000 l

instance (Arbitrary e, Arbitrary a) =>
  Arbitrary (Validation e a) where
  arbitrary = do
    e <- arbitrary
    a <- arbitrary
    elements [Apl1.Success a, Apl1.Failure e]

instance (Eq e, Eq a) => EqProp (Validation e a) where
  (=-=) = eq

instance (Arbitrary a, Arbitrary b)
  => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return $ Two a b

instance (Eq a, Eq b) => EqProp (Two a b) where
  (=-=) = eq

instance (Arbitrary a, Arbitrary b, Arbitrary c)
  => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return $ Three a b c

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
  (=-=) = eq

instance (Arbitrary a, Arbitrary b)
  => Arbitrary (Three' a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return $ Three' a b b

instance (Eq a, Eq b) => EqProp (Three' a b) where
  (=-=) = eq

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
  => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return $ Four a b c d

instance (Eq a, Eq b, Eq c, Eq d)
  => EqProp (Four a b c d) where
  (=-=) = eq

instance (Arbitrary a, Arbitrary b)
  => Arbitrary (Four' a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return $ Four' a a a b

instance (Eq a, Eq b) => EqProp (Four' a b) where
  (=-=) = eq

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)

main :: IO ()
main = do
  quickBatch (applicative $ ZipList' (Cons ([1 :: Int], "a", 'c') Nil))
  quickBatch (applicative $ (undefined :: Validation [String] (String, String, String)))

  print "Two: "
  quickBatch (applicative $ Two ("a", "b", "c") ("d", "e", "f"))
  print "Three: "
  quickBatch (applicative $ Three ("d", "e", [1 :: Int]) ("a", "b", "c") ("1", "2", "3"))
  print "Three': "
  quickBatch (applicative $ Three' ("d", "e", "f") ("a", "b", "c") ("1", "2", "3"))
  print "Four: "
  quickBatch (applicative $ Four ("d", "e", "f") ("a", "b", "c") ("1", "2", "3") ("1", "2", "3"))
  print "Four': "
  quickBatch (applicative $ Four' ("d", "e", "f") ("a", "b", "c") ("1", "2", "3") ("1", "2", "3"))
