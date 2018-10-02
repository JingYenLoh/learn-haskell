module Filtering where

multiplesOfThree :: [Int]
multiplesOfThree = filter (\x -> x `mod` 3 == 0) [1..30]

multiplesCount :: Int
multiplesCount = length $ multiplesOfThree

myFilter :: String -> [String]
-- myFilter str = filter f tokens
--   where f        = (\w -> not $ w `elem` articles)
--         tokens   = words str
--         articles = ["the", "a", "an"]
myFilter = filter (not . (`elem` articles)) . words
  where articles = ["the", "a", "an"]
