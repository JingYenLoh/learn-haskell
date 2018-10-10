-- Vehicles.hs

module Chap11.Vehicles where

data Price = Price Integer
  deriving (Eq, Show)

data Size = Size Integer
  deriving (Eq, Show)

data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving (Eq, Show)

data Airline = PapuAir
             | CatapultsR'Us
             | TakeYourChancesUnited
             deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Size
             deriving (Eq, Show)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False


isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- Goes baboom if you use this on Plane data
getManu :: Vehicle -> Manufacturer
getManu (Car manufacturer _)  = manufacturer
getManu _ = error "No manufacturer"

myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir
