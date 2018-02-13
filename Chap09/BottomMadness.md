# Will it blow up?

1.  Yes
```haskell
[x^y | x <- [1..5], y <- [2, undefined]]
```
2.  No, lazy magics
```haskell
take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
```
3.  Yes, it'll mess up when it tries to sum the `undefined`
```haskell
sum [1, undefined, 3]
```
4.  No
```haskell
length [1, 2, undefined]
```
5.  Yes, it'll mess up when it tries to concat to `undefined`
```haskell
length $ [1, 2, 3] ++ undefined
```
6.  No, you're just taking 1 so just the first result from `filter even`
```haskell
take 1 $ filter even [1, 2, 3, undefined]
```
7.  Yes, it'll look for an even number, hit `undefined`, and blow up
```haskell
take 1 $ filter even [1, 3, undefined]
```
8.  No
```haskell
take 1 $ filter odd [1, 3, undefined]
```
9.  No
```haskell
take 2 $ filter odd [1, 3, undefined]
```
10.  Yes
```haskell
take 3 $ filter odd [1, 3, undefined]
```

## Intermission

1.  This is definitely NF.
```haskell
[1, 2, 3, 4, 5]
```
2. WHNF, last `:` is a data constructor that hasn't been fully evaluated
```haskell
1 : 2 : 3 : 4 : _
```
3. Neither, outermost part of expression (`enumFromTo`) isn't a data constructor
```haskell
enumFromTo 1 10
```
4. Neither, outermost part of expression (`length`) isn't a data constructor
```haskell
length [1, 2, 3, 4, 5]
```
5. Neither, outermost part of expression (`sum`) isn't a data constructor
```haskell
sum (enumFromTo 1 10)
```
6. Neither, outermost part of expression (`++`) isn't a data constructor
```haskell
['a'..'n'] ++ ['n'..'z']
```
7. WHNF
```haskell
(_, 'b')
```
