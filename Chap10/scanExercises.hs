-- scanExercises.hs

module ScanExercises where

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

first20Fibs :: [Integer]
first20Fibs = take 20 fibs

lt100Fibs :: [Integer]
lt100Fibs = takeWhile (<100) fibs

scanFac :: [Integer]
scanFac = scanl (*) 1 [1..]
