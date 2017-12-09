-- grabBag.hs
module GrabBag where

-- 1)
-- mTh x y z = x * y * z
-- mTh x y = \z -> x * y * z
-- mTh x = \y -> \z -> x * y * z

-- This is Integer -> Integer -> Integer -> Integer
-- o.o
mTh = \x -> \y -> \z -> x * y * z

-- 2)
-- Num a => a -> a -> a

-- 3a)
addOneIfOdd n = case odd n of
  True  -> f n
  False -> n
  where f = \n -> n + 1

-- 3b)
addFive = \x y -> (if x > y then y else x) + 5

-- 3c)
mflip f x y = f y x
