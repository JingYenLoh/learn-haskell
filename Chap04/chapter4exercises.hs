-- chapter4exercises.hs
module ChapterFour where

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x = if x >= 0 then x else (-x)

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
-- f x y = (,) ((,) (snd x) (snd y)) ((,) (fst x) (fst y))
f (a, b) (c, d) = ((b, d), (a, c))

-- Correcting syntax 1
x = (+)

addOneToLength :: [Char] -> Int
addOneToLength xs = w `x` 1
  where w = length xs

-- Correcting syntax 2
secondFunction :: a -> a
secondFunction x = x

-- Correcting syntax 2
thirdFunction :: (a, b) -> a
thirdFunction x = fst x

-- Match function to type (show)
-- Show a => a -> String

-- Match function to type (==)
-- Eq a => a -> a -> Bool

-- Match function to type (fst)
-- (a, b) -> a

-- Match function to type (+)
-- (+) :: Num a => a -> a -> a
