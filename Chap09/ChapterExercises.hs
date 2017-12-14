module ChapterExercises where

import Data.Char

-- 2.
onlyUpper :: String -> String
onlyUpper = filter isUpper

-- 3.
capitalizeFirst :: String -> String
capitalizeFirst ""     = ""
capitalizeFirst (x:xs) = toUpper x : xs

-- 4.
capitalizeAll :: String -> String
capitalizeAll "" = ""
capitalizeAll (x:xs) = toUpper x : capitalizeAll xs

-- 5.
capFirstLetter :: String -> Char
-- capFirstLetter str = toUpper $ head str
-- capFirstLetter str = toUpper . head $ str

-- 6. Actually wrote it in point free first lol
capFirstLetter = toUpper . head