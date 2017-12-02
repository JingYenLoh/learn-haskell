-- matchingTuples1.hs
module TupleFunctions where

-- These have to be the same type because
-- (+) is a -> a -> a
addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

-- addEmUp2 could also be written like so
addEmUp2' :: Num a => (a, a) -> a
addEmUp2' tup = (fst tup) + (snd tup)