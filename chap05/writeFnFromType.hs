module WriteFnFromType where

myFunc :: (x -> y)
       -> (y -> z)
       -> c
       -> (a, x)
       -> (a, z)
myFunc xToY yToZ _ (a, x) =
  (a, yToZ $ xToY $ x)

-- 1)
i :: a -> a
i a = a

-- 2)
c :: a -> b -> a
c a b = a

-- 3)
-- I think this is the same as cos alpha equivalence
c'' :: b -> a -> b
c'' b a = b

-- 4)
c' :: a -> b -> b
c' a b = b

-- 5)
r :: [a] -> [a]
r xs = xs

-- 6)
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC $ aToB $ a

-- 7)
a :: (a -> c) -> a -> a
a aToC x = x

-- 8)
a' :: (a -> b) -> a -> b
a' aToB a = aToB a
