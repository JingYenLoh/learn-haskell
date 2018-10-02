-- chapterExercises.hs

module Chap10.ChapterExercises where

import Data.Bool (bool)

-- Warm up and Review

stops = "pbtdkg"
vowels = "aeiou"

nouns = ["bottle", "can"]
verbs = ["clean", "shake"]

xYx :: [a] -> [a] -> [(a, a, a)]
xYx xs ys = [(x, y, z) | (x, y) <- xys, z <- xs]
  where xys = [(x', y') | x' <- xs, y' <- ys]

stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = xYx stops vowels

pStopVowelStop :: [(Char, Char, Char)]
pStopVowelStop = filter ((=='p') . myFirst) stopVowelStop

myFirst :: (a, b, c) -> a
myFirst (a, _, _) = a

nounVerbNoun :: [(String, String, String)]
nounVerbNoun = xYx nouns verbs

seekritFunc x = div (sum (map length (words x))) (length (words x))

sekritFn x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))

-- Rewriting functions using folds

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = myOr . map f

myElem :: Eq a => a -> [a] -> Bool
myElem = myAny . (==)

myReverse :: [a] -> [a]
-- myReverse = foldr (\a b -> b ++ [a]) []
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
-- myMap _ [] = []
-- myMap f (x:xs) = (f x) : myMap f xs
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b -> if f a then a:b else b) []

-- pointfree filter courtesy of @bumbleblym
-- nope, not gonna tryhard anymore
myFilter' ::  (a -> Bool) -> [a] -> [a]
myFilter' = flip foldr [] . (<*>) (bool id . (:))

squish :: [[a]] -> [a]
squish  = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMaximumBy f (x:xs) = foldl fn x xs
  where fn a b = case f a b of
          GT -> a
          _  -> b

myMinimumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMinimumBy f (x:xs) = foldl fn x xs
  where fn a b = case f a b of
          LT -> a
          _  -> b
