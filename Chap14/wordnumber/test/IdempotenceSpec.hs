module IdempotenceSpec (spec) where

import Test.Hspec
import Idempotence
import Test.QuickCheck
import Data.List (sort)

spec :: Spec
spec = do
  describe "twice" $ do
    it "is idempotent" $ property $ do
      \x -> (capitalizeWord x == twice capitalizeWord x)
            &&
            (capitalizeWord x == fourTimes capitalizeWord x)
      \x -> (sort x == twice sort x)
            &&
            (sort x == fourTimes sort x)
