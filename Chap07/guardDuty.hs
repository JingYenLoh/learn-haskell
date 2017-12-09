-- guardDuty.hs
module GuardDuty where

-- 1.
-- It is probably clear to you why you wouldn’t put an otherwise in
-- your top-most guard, but try it with avgGrade anyway and see
-- what happens. It’ll be more clear if you rewrite it as an otherwise
-- match: | otherwise = 'F' . What happens now if you pass a 90
-- as an argument? 75? 60?

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | otherwise = 'F'
  where y = x / 100

-- 3.
-- The following function returns
pal xs
  | xs == reverse xs = True
  | otherwise        = False
-- b) True when xs is a palindrome

-- 4.
-- pal can take [a] as arguments where a has a typeclass of Eq

-- 5.
-- The return type of pal is Bool

-- 6
-- The following function returns
numbers x
  | x < 0  = -1
  | x == 0 = 0
  | x > 0  = 1
-- c) an indication of whether its argument
--    is a positive or negative number or zero

-- 7.
-- numbers can take arguments of (Ord a, Num a)

-- 8.
-- (Ord a, Num a, Num x) => a -> x