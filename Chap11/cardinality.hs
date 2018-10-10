-- cardinality.hs

module Chap11.Cardinality where

-- Cardinality 1
data Pug = PugData

-- Cardinality 3
data Airline = PapuAir
             | CatapultsR'Us
             | TakeYourChancesUnited
             deriving (Eq, Show)

-- 3. Cardinality of Int16 is 65536

-- 4. Cardinality of Int is yuuuuuuuuuuge

-- 5. Int8 is 8 bits -> 2 ^ 8 -> Cardinality of 256
