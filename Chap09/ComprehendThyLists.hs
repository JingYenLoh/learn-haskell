-- ComprehendThyLists.hs
module ComprehendThyLists where

mySqr :: [Integer]
mySqr = [x^2 | x <- [1..10]]
-- [1,4,9,16,25,36,49,64,81,100]

xsOne :: [Integer]
xsOne = [x | x <- mySqr, x `rem` 2 == 0]
-- [4,16,36,64,100]

xsTwo :: [(Integer, Integer)]
xsTwo = [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
-- [ (1,64), (1,81), (1,100)
-- , (4,64), (4,81), (4,100)
-- , (9,64), (9,81), (9,100)
-- , (16,64),(16,81),(16,100)
-- , (25,64),(25,81),(25,100)
-- , (36,64),(36,81),(36,100)
-- , (49,64),(49,81),(49,100)
-- ]

xsThree :: [(Integer, Integer)]
xsThree = take 5 xsTwo