-- fun.hs

module Fun where

waxOn :: Integer
waxOn = x * 5 where
    x = y ^ 2
    y = z + 8
    z = 7

triple :: Int -> Int
triple = (* 3) -- infix style
-- triple x = x * 3

waxOff :: Int -> Int
waxOff = \x -> triple x

main :: IO ()
main = do
    putStrLn $ show waxOn
    putStrLn $ show . waxOff $ 3