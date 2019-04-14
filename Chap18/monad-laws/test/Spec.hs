import Prelude hiding (Left, Right)
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

import Lib
import BadMonad
import ChapterExercises

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [ First a, Second b ]

instance (Eq a, Eq b) => EqProp (Sum a b) where
  (=-=) = eq

instance Arbitrary a => Arbitrary (CountMe a) where
  arbitrary =
    CountMe <$> arbitrary <*> arbitrary

instance Eq a => EqProp (CountMe a) where
  (=-=) = eq


instance Arbitrary (Nope a) where
  arbitrary = return NopeDotJpg

instance (Eq a) => EqProp (Nope a) where
  (=-=) = eq


instance (Arbitrary a, Arbitrary b) => Arbitrary (PhhhbbtttEither b a) where
  arbitrary = do
    b <- arbitrary
    a <- arbitrary
    elements [ Left a, Right b ]

instance (Eq a, Eq b) => EqProp (PhhhbbtttEither b a) where
  (=-=) = eq


instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = Identity <$> arbitrary

instance Eq a => EqProp (Identity a) where
  (=-=) = eq


instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [ Nil, Cons a b ]

instance Eq a => EqProp (List a) where
  (=-=) = eq


main :: IO ()
main = do
  quickBatch $ monad (undefined :: Sum String (String, String, Char))

  let trigger :: CountMe (Int, String, Int)
      trigger = undefined
  quickBatch $ functor trigger
  quickBatch $ applicative trigger
  quickBatch $ monad trigger

  putStrLn "\nNope test:"
  let nopeTrigger :: Nope (Int, Int, String)
      nopeTrigger = undefined
  quickBatch $ functor nopeTrigger
  quickBatch $ applicative nopeTrigger
  quickBatch $ monad nopeTrigger
  putStrLn ""

  putStrLn "\nPhhhbbtttEither test:"
  let eitherTrigger :: PhhhbbtttEither (String, String, String) (String, String, String)
      eitherTrigger = undefined
  quickBatch $ functor eitherTrigger
  quickBatch $ applicative eitherTrigger
  quickBatch $ monad eitherTrigger

  putStrLn "\nIdentity test:"
  let identityTrigger :: Identity (String, String, String)
      identityTrigger = undefined
  quickBatch $ functor identityTrigger
  quickBatch $ applicative identityTrigger
  quickBatch $ monad identityTrigger

  putStrLn "\nList test:"
  let listTrigger :: List (String, String, String)
      listTrigger = undefined
  quickBatch $ functor listTrigger
  quickBatch $ applicative listTrigger
  quickBatch $ monad listTrigger
