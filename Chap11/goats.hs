{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

-- goats.hs

module Chap11.Goats where

import Foreign.Marshal.Utils

newtype Goats = Goats Int
  deriving (Eq, Show, TooMany)

newtype Cows = Cows Int
  deriving (Eq, Show)

data Foo a = Foo (a, a)

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where
  tooMany (n, _) = n > 42

instance TooMany (Int, Int) where
  tooMany (x, y) = x + y > 42

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany $ x + y
