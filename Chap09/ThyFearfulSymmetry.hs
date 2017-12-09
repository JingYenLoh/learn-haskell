-- ThyFearfulSymmetry.hs
module Chap09.ThyFearfulSymmetry
( myWords
, myTokens
) where

myTokens :: Char -> String -> [String]
myTokens _ ""     = []
myTokens char str = [takeWhile (/= char) str]
                 ++ (myTokens char remaining)
                      where remaining = drop 1 $ dropWhile (/= char) str

myWords :: String -> [String]
myWords = myTokens ' '