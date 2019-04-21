-- | Scratch

module Chap19.Scratch where

import Data.Monoid
import qualified Data.Map as M

foo = const $ Sum 1

bar = const $ Sum 2

baz = foo <> bar

f = M.fromList [('a', 1)]
g = M.fromList [('b', 2)]
h = f <> g
