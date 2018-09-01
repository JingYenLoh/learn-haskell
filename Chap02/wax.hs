-- wax.hs

module Wax
  (
    triple
  , waxOff
  , waxOn
  ) where

triple = (*3)

waxOff = (^2) . triple

waxOn = x * 5
  where x = y ^ 2
        y = z + 8
        z = 7
