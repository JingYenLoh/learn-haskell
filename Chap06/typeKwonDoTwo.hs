-- typeKwonDoTwo.hs
module TypeKwonDoTwo where

import Prelude

-- 1.
chk :: Eq b
    => (a -> b)
    -> a
    -> b
    -> Bool
chk aToB a b = aToB a == b

-- 2.
arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith aToB x a = (fromInteger x) * (aToB a)
