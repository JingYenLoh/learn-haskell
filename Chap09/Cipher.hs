module Cipher
( caesar
, unCaesar
) where

import Data.Char

caesar :: Int -> String -> String
caesar _ ""         = ""
caesar shift (x:xs) =
  case shift + ord x > 122 of
    False -> chr (shift + ord x) : caesar shift xs
    True  -> chr (shift - 74 + ord x) : caesar shift xs

unCaesar :: Int -> String -> String
unCaesar _ ""         = ""
unCaesar shift (x:xs) =
  case shifted < 49 of
    False -> chr shifted : unCaesar shift xs
    True  -> chr (74 + shifted) : unCaesar shift xs
    where shifted = ord x - shift

myAnd :: [Bool] -> Bool
myAnd []     = True
myAnd (x:xs) = case x of
  False -> False
  True  -> myAnd xs

myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = case x of
  True  -> True
  False -> myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = if f x == True
                 then True
                 else myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem x (y:ys) = if x == y
                  then True
                  else x `myElem` ys

myElem' :: Eq a => a -> [a] -> Bool
myElem' x xs = myAny (==x) xs

myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap (id)

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:x':xs) =
  case f x x' of
    LT -> myMaximumBy f (x':xs)
    _  -> myMaximumBy f (x:xs)
myMaximumBy _ (x:_) = x

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:x':xs) =
  case f x x' of
    LT -> myMinimumBy f (x:xs)
    _  -> myMinimumBy f (x':xs)
myMinimumBy _ (x:_) = x