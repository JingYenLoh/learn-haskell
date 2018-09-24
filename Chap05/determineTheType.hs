{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

-- simple example
example = 1

-- x = 5
-- y = x + 5
-- w = y * 10
-- w :: Num a => a

-- x = 5
-- y = x + 5
-- z y = y * 10
-- z :: (Num a) => a -> a

-- x = 5
-- y = x + 5
-- f = 4 / y
-- f :: Fractional a => a

-- x = "Julie"
-- y = " <3 "
-- z = "Haskell"
-- f = x ++ y ++ z
-- f :: [Char]

bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10 -- This shouldn't work
-- Idk how to fix this. What is it even supposed to achieve?
-- bigNum = (^ 5); wahoo = bigNum $ 10
-- Is that it?

x = print
y = print "woohoo!"
z = x "hello world"
-- Yep, all working as expected

-- a = (+)
-- b = 5
-- c = b 10 -- This should fail
-- d = c 200

-- a = 12 + b
-- b = 10000 * c -- This should fail, variable not in scope

myFunc :: (x -> y)
       -> (y -> z)
       -> c
       -> (a, x)
       -> (a, z)
myFunc xToY yToZ _ (a, x) = (a, xToZ x)
  where xToZ = yToZ . xToY
