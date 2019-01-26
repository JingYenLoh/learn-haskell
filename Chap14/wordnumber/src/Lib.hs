module Lib where

import Data.List (intersperse, sort)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = "undefined"

digits :: Int -> [Int]
digits n = go n []
  where go x xs
          | x < 10    = x:xs
          | otherwise = go a (b:xs)
              where (a, b) = x `divMod` 10

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . (map digitToWord) . digits

half x = x / 2

halfIdentity = (*2) . half

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t)  = (Just y, x >= y)

plusAssociative x y z = x + (y + z) == (x + y) + z

plusCommutative x y = x + y == y + x
