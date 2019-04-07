module Chap17.Lookups where

f :: (Eq a, Num a) => a -> Maybe String
f x =
  lookup x [ (3, "hello")
           , (8, "julie")
           , (5, "kbai")]

g :: (Eq a, Num a) => a -> Maybe String
g x =
  lookup x [ (7, "sup?")
           , (8, "chris")
           , (9, "aloha")]

h :: (Eq a, Num a, Num b) => a -> Maybe b
h z =
  lookup z [(2, 3), (5, 6), (7, 8)]

m :: (Eq a, Num a, Num b) => a -> Maybe b
m z =
  lookup z [(4, 10), (8, 13), (1, 9001)]
