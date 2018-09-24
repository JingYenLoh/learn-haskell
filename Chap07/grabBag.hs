-- grabBag.hs
module GrabBag where

-- 1)
-- It's all the same. Idk how the last one got to
-- Integer -> Integer -> Integer the last time
-- I went through this book.

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
