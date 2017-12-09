-- willTheyWork.hs
module WillTheyWork where

-- Should return 5
maxVal = max (length [1, 2, 3])
             (length [8, 9, 10, 11, 12])

-- Should return LT
compareInts = compare (3 * 4) (3 * 5)

-- Should throw error as compare can't match [Char] with Bool
misMatchedTypes = compare "Julie" True

-- Should return False
isGreaterThan = (5 + 3) > (3 + 6)