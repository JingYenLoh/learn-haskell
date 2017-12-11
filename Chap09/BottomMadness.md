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