-- databaseProcessing.hs
module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
  ]

-- Write a function that filters for DbDate values and returns a list of the
-- UTCTime values inside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr f []
  where
    f (DbDate time) acc = time : acc
    f _             acc = acc

-- Write a function that filters for DbNumber values and returns a list of the
-- Integer values inside them
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr f []
  where
    f (DbNumber i) acc = i : acc
    f _            acc = acc

-- Write a function that gets the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- Write a function that sums all of the DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

toDoubles :: [Integer] -> [Double]
toDoubles = map fromInteger

-- Write a function that gets the average of the DbNumber values
avgDb :: [DatabaseItem] -> Double
avgDb xs = total / count
    where
      total     = sum dbNumbers
      count     = fromIntegral $ length dbNumbers
      dbNumbers = toDoubles . filterDbNumber $ xs
