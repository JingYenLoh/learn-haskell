-- |

module Addition where

import Test.Hspec
import Test.QuickCheck

sayHello :: IO ()
sayHello = putStrLn "hello!"

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "15 divided by 3 is 5" $ do
      15 `dividedBy` 3 `shouldBe` (5, 0)
    it "22 divided by 5 is 4 remainder 2" $ do
      22 `dividedBy` 5 `shouldBe` (4, 2)
    it "3 multipled by 5 is 15" $ do
      myMult 3 5 `shouldBe` 15
    it "6 multiplied by 7 is 42" $ do
      myMult 6 7 `shouldBe` 42
    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)

myMult :: (Integral a) => a -> a -> a
myMult x y = go x y x
  where go x' y' result
          | y' == 1   = result
          | otherwise =
              go x' (y' - 1) (result + x')

