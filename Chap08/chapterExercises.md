# Recursion

## Review of types

1.  What is the type of `[[True, False], [True, True], [False, True]]`? (`[[Bool]]`)
2.  Which of the following has the same type as `[[True, False], [True, True], [False, True]]`? (`[[3 == 3], [6 > 5], [3 < 4]]`)
3.  For the following function
```haskell
func :: [a] -> [a] -> [a]
func x y = x ++ y
```
which of the following is true? (all of the above)
4.  For the `func` code above, which is a valid application of `func` to both of its arguments? (`func "Hello" "World"`)

## Reviewing currying

1.  What is the value of `apedCatty "woohoo!"`? Try to determine the answer for yourself, then test in the REPL. (`"woops mrow woohoo!"`)
2.  `frappe "1"` (`"1 mrow haha"`)
3.  `frappe (appedCatty "2")` (`"woops mrow 2 mrow haha"`)
4.  `appedCatty (frappe "blue")` (`"woops mrow blue mrow haha"`)
5.  `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))` (`"pink mrow haha mrow green mrow woops mrow blue"`)
6.  `cattyConny (flippy "Plugs" "are") "awesome"` (`"are mrow Pugs mrow awesome"`)

## Recursion

```haskell
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
    | n < d     = (count, n)
    | otherwise =
      go (n - d) d (count + 1)
```

1.  I'm going to get it for terrible working but
```haskell
dividedBy 15 2 =
go 15 2 0
  | otherwise =
    go (15 - 2) 2 (0 + 1)
      | otherwise =
        go (13 - 2) 2 (1 + 1)
          | otherwise =
            go (11 - 2) 2 (2 + 1)
              | otherwise =
                go (9 - 2) 2 (3 + 1)
                  | otherwise =
                    go (7 - 2) 2 (4 + 1)
                      | otherwise =
                        go (5 - 2) 2 (5 + 1)
                          | otherwise =
                            go (3 - 2) 2 (6 + 1)
                              | n < d = (7, 1)
```
2.  Hmm
```haskell
mySum :: (Eq a, Num a) => a -> a
mySum n
  | n <= 0    = 0
  | otherwise = n + mySum (n - 1)
```

3.  Hmm
```haskell
myMult :: (Integral a) => a -> a -> a
myMult x y = go x y x
  where go x' y' result
          | y' == 1   = result
          | otherwise =
              go x' (y' - 1) (result + x')
```

## McCarthy 91 function

```hs
mc91 n
  | n > 100   = n - 10
  | otherwise = mc91 . mc91 $ n + 11
```
