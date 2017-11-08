-- fun.hs

module Fun where

-- waxOn :: Int -> Int
waxOn = x * 5 where
    x = y ^ 2
    y = z + 8
    z = 7

-- triple :: Int -> Int
triple x = x * 3

-- waxOff :: Int -> Int
waxOff x = triple x
