
# Table of Contents

1.  [Chapter Exercises](#chapter-exercises)
    1.  [Multiple Choice](#multiple-choice)
    2.  [Let's write code](#orgda32bac)


<a id="chapter-exercises"></a>

# Chapter Exercises

<a id="multiple-choice"></a>

## Multiple Choice

1.  A polymorphic function

    a.  changes things into sheep when invoked  
    b.  has multiple arguments  
    c.  has a concrete type  
    d.  may resolve to values of different types, depending on inputs  
    My answer: d

2. Two functions named `f` and `g` have types `Char -> String` and `String ->
[String]` respectively. The composed function `g . f` has the type

    a.  `Char -> String`  
    b.  `Char -> [String]`  
    c.  `[[String]]`  
    d.  `Char -> String -> [String]`  
    My answer: d

3. A function `f` has the type `Ord a => a -> a -> Bool` and we apply it to
one numeric value. What is the type now?

    a. `Ord a => a -> Bool`  
    b. `Num -> Num -> Bool`  
    c. `Ord a => a -> a -> Integer`  
    d. `(Ord a, Num a) => a -> Bool`  
    My answer: d

4. A function with the type `(a -> b) -> c`

    a. requires values of three different types  
    b. is a higher-order function  
    c. must take a tuple as its first argument  
    d. has its parameters in alphabetical order  
    My answer: b

5. Given the following definition of `f`, what is the type of `f True`?
    ```haskell
    f :: a -> a
    f x = x
    ```
    a.  `f True :: Bool`  
    b.  `f True :: String`  
    c.  `f True :: Bool -> Bool`  
    d.  `f True :: a`  
    My answer: a


<a id="orgda32bac"></a>

## Let's write code

1.  The following function returns the tens digit of an integral argument.

```haskell
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10
```

a) First, rewrite it using `divMod`.

```haskell
tensDigit x = snd (fst (x `divMod` 10) `divMod` 10)

tensDigit' :: Integral a => a -> a
tensDigit' = snd . (`divMod` 10) . fst . (`divMod` 10)
```

b)  Yes

c)  Change to hundreds digit
```haskell
hunsD x = d2
  where d  = x `div` 100
        d2 = d `mod` 10

hunsD' :: Integral a => a -> a
hunsD' = snd . (`divMod` 10) . fst . (`divMod` 100)
```

2.  Implement the function of the type `a -> a -> Bool -> a` once each using a case expression and once with a guard.

```haskell
foldBool :: a -> a -> Bool -> a
foldBool = error "Error: Need to implement foldBool!"

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y bool =
  case bool of
    True  -> x
    False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y bool
  | bool == True  = x
  | bool == False = y

foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True  = y
```

3.  Fill in the definition.

```haskell
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, b) = (f a, b)
```

4.  Stuff

5.  
```haskell
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show
```
