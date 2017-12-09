-- matchTheTypes.hs

module MatchTheTypes where

import Data.List (sort)

-- 1a)
i :: Num a => a
-- 1b)
-- i :: a -- can't substitute, no instance of Num
i = 1

-- 2a)
-- f :: Float
-- 2b)
-- f :: Num a => a -- could not deduce (Fractional a)
-- 3a)
-- f :: Fractional a => a -- should be able to substitute
-- 4a)
f :: RealFrac a => a -- should be able to substitute
f = 1.0

-- 5a)
-- freud :: a -> a
-- 5b)
freud :: Ord a => a -> a -- should be able to substitute
freud x = x

-- 6a)
-- freud' :: a -> a
-- 6b)
freud' :: Int -> Int -- should be able to substitute
freud' x = x

-- 7a)
myX = 1 :: Int

-- sigmund :: Int -> Int
-- 7b)
-- sigmund :: a -> a -- shouldn't be able to substitute
-- sigmund :: a -> Int -- This should work
sigmund x = myX

-- 8a)
-- sigmund' :: Int -> Int
-- 8b)
-- sigmund' :: Num a => a -> a -- still shouldn't work, need Int
-- sigmund' :: Num a => a -> Int -- This should work
sigmund' x = myX

-- 9a)
-- jung :: Ord a => [a] -> a
-- 9b)
jung :: [Int] -> Int -- should still work, although above works fine?
jung xs = head (sort xs)

-- 10a)
-- young :: [Char] -> Char
-- 10b)
young :: Ord a => [a] -> a -- should work fine
young xs = head (sort xs)

-- 11a)
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
-- 11b)
-- signifier :: Ord a => [a] -> a -- hmm, I think this still works
-- oh wait mySort's signature is [Char] -> [Char], oops
signifier xs = head (mySort xs)