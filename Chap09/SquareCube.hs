-- SquareCube.hs

module Chap09.SquareCube where

mySqr :: [Int]
mySqr = [x^2 | x <- [1..5]]

myCube :: [Int]
myCube = [y^3 | y <- [1..5]]

myTuples :: [(Int, Int)]
myTuples = [(x, y) | x <- mySqr, y <- myCube]

mySub50Tuples :: [(Int, Int)]
mySub50Tuples = [(x, y) | (x, y) <- myTuples, x < 50, y < 50]

tupleLength = length mySub50Tuples

main :: IO ()
main = do
  putStrLn . show $ tupleLength
