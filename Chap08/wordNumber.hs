-- wordNumber.hs
module Chap08.WordNumber
( digitToWord
, digits
, wordNumber
)
where

import Data.List (intersperse)

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
          | x <  10 = x:xs 
          | otherwise = go a (b:xs)
              where (a, b) = x `divMod` 10

wordNumber :: Int -> String
-- wordNumber n = concat $ intersperse "-" (map digitToWord (digits n))
wordNumber = concat . intersperse "-" . (map digitToWord) . digits

main :: IO ()
main = do
  putStrLn $ wordNumber 123456