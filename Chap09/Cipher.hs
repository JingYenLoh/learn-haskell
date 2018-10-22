module Cipher
( caesar
, unCaesar
) where

import Data.Char

main :: IO ()
main = do
  if msg == "MPPR AE OYWY"
  then putStrLn "vigenere passed"
  else putStrLn msg
  where msg = vigenere testKeyword testMessage


type Message = String
type Keyword = String

testKeyword :: Keyword
testKeyword = "ALLY"


testMessage :: Message
testMessage = "meet at dawn"


vigenere :: Keyword -> Message -> String
vigenere _ "" = ""
vigenere (k:ks) (c:cs)
  | isAlpha c = shifted:(vigenere (ks ++ [k]) cs)
  | otherwise = c:(vigenere (k:ks) cs)
  where
    shifted = head (caesar shift [c])
    shift =  (ord k) `mod` 65


caesar :: Int -> String -> String
caesar _ ""         = ""
caesar shift (x:xs)
  | isAlpha x = shifted : caesar shift xs
  | otherwise = x : caesar shift xs
  where shifted =
          if charToShift > 90
          then chr $ ((charToShift - 65) `mod` 26) + 65
          else chr charToShift
        c = toUpper x
        charToShift = shift + ord c


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
myElem' = myAny . (==)

myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' = go []
  where go acc []     = acc
        go acc (x:xs) = go (x:acc) xs

squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

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

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
