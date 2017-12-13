-- intermission.hs
module Intermission where

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n

applyTimes :: (Eq a, Num a) =>
              a -> (b -> b) -> b -> b
applyTimes 0 _ b = b
applyTimes n f b = f . applyTimes (n-1) f $ b
