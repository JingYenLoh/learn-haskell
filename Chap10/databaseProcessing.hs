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
filterDbDate xs = foldr f [] xs
  where
    f (DbDate time) acc = time : acc
    f _             acc = acc

-- Write a function that filters for DbNumber values and returns a list of the
-- Integer values inside them
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber xs = foldr f [] xs
  where
    f (DbNumber i) acc = i : acc
    f _            acc = acc

-- TODO: Write a function that gets the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent db = foldr max (UTCTime (fromGregorian 0 1 1) 0) $ filterDbDate db

-- Write a function that sums all of the DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- TODO: Write a function that gets the average of the DbNumber values
avgDb :: [DatabaseItem] -> Double
avgDb = undefined
