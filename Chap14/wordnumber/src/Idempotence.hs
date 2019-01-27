module Idempotence where

import Data.Char (toUpper)

twice :: (a -> a) -> a -> a
twice f = f . f

fourTimes :: (a -> a) -> a -> a
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord ""  = ""
capitalizeWord (x:xs) = toUpper x : xs
