module Tests where

import Lib
import Data.List (sort)
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "digitToWord" $ do
    it "returns zero for 0" $ do
      digitToWord 0 `shouldBe` "zero"
    it "returns one for 1" $ do
      digitToWord 1 `shouldBe` "one"

  describe "digits" $ do
    it "returns [1] for 1" $ do
      digits 1 `shouldBe` [1]
    it "returns [1, 0, 0] for 100" $ do
      digits 100 `shouldBe` [1, 0, 0]

  describe "wordNumber" $ do
    it "one-zero-zero given 100" $ do
      wordNumber 100 `shouldBe` "one-zero-zero"
    it "nine-zero-zero-one for 9001" $ do
      wordNumber 9001 `shouldBe` "nine-zero-zero-one"

  describe "listOrdered" $ do
    it "returns an ordered list of Int" $ property $
      \xs -> listOrdered (sort xs :: [Int]) == True
    it "returns an ordered list of Char" $ property $
      \xs -> listOrdered (sort xs :: [Char]) == True

  describe "half" $ do
    it "x divided by 2 multiplied by 2 equals x" $ property $
      \x -> x == halfIdentity x

  describe "Addition" $ do
    it "is associative" $ property $
      \x y z -> (x :: Int) + (y + z) == (x + y) + z
    it "is commutative" $ property $
      \x y -> (x :: Int) + y == y + x

  describe "Multiplication" $ do
    it "is associative" $ property $
      \x y z -> (x :: Int) * (y * z) == (x * y) * z
    it "is commutative" $ property $
      \x y -> (x :: Int) * y == y * x

  describe "Division" $ do
    it "quot * divisor + rem equals dividend" $ property $
      \(NonZero x) (NonZero y) -> (quot (x :: Int) y) * y + (rem x y) == x
    it "div * divisor + mod equals dividend" $ property $
      \(NonZero x) (NonZero y) -> (div (x :: Int) y) * y + (mod x y) == x

  -- describe "Exponentiation" $ do
  --   it "is not associative" $ property $ do
  --     \(NonZero x) (NonZero y) (NonZero z) ->
  --       ((x :: Int) ^(y :: Int)) ^ (z :: Int) /= (x ^ y) ^ z

  -- describe "length" $ do
  --   it "hmm" $ property $
  --     \(Positive n) xs -> length (take n (xs :: [Char])) == n

  describe "reverse" $ do
    it "reversing [Int] twice returns original list" $ property $
      \xs -> reverse (reverse xs :: [Int]) == id xs
    it "reversing [Char] twice returns original list" $ property $
      \xs -> reverse (reverse xs :: [Char]) == id xs

  describe "show" $ do
    it "composing read and show is a round trip" $ do
      \x -> (read (show x)) == x

foolGenEqual :: Gen Fool
foolGenEqual = do
  oneof [ return $ Frue
        , return $ Fulse
        ]

foolGenUnequal :: Gen Fool
foolGenUnequal = do
  frequency [ (2, return $ Fulse)
            , (1, return $ Frue)
            ]
