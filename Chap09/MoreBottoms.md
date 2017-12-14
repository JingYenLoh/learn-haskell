1.  Will the following expression return a value or be ⊥? ⊥
```haskell
take 1 $ map (+1) [undefined, 2, 3]
```
2.  Will the following expression return a value? Yes
```haskell
take 1 $ map (+1) [1, undefined, 3]
```
3.  Will the following expression return a value? No
```haskell
take 2 $ map (+1) [1, undefined, 3]
```
4.  Describe the type of the mystery function and what it does. 
```haskell
itIsMystery xs = map (\x -> x `elem` "aeiou") xs
```
It returns a new list of whether each element in the list `xs` is a vowel.
5.  What will be the result of the following functions:

a)
```haskell
map (^2) [1..10] -- [1,4,9,16,25,36,49,64,81,100]
```
b)
```haskell
map minimum [[1..10], [10..20], [20..30]] -- [1,10,20]
```
c)
```haskell
map sum [[1..5], [1..5], [1..5]] -- [15,15,15]
```
6.  
```haskell
import Data.Bool

myIfThenElse = map (\x -> bool x (-x) (x == 3)) [1..10]
```