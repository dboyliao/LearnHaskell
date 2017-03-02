# Functor

- `Control.Monad.Instances` is deprecated

![deprecated](img/deprecated.png)
- `fmap` can be used to *lift* a function </br>
  - In this example, `count` has been lifted to a function which takes a `Functor` and return another `Functor`
  - It works like original `count` but on `Functor`.
```haskell
count :: String -> Int
count = length

fcount = fmap count
-- fcount ::Functor f => f String -> f Int
```
- As a result, we can actually rewrite the signature of `fmap` as </br>
`fmap :: (Functor f) => (a -> b) -> (f a -> f b)`
  - That is, it takes a `function` and return another `function` which works only on `Functor` types.
- `fmap` a function on `Nothing` will get `Nothing`
- `fmap` a function on `Left a` will get `Left a`. </br>ex:
```haskell
fmap (*2) (Left 3)
-- Left 3
fmap (*2) (Right 3)
-- Right 6
```
- `(->) a` is an instance of `Functor`
  - ex: `fmap (*3) (+3)`
  - equivalent to `(*3) . (+3)`

## Fuctor Law
1. `fmap id = id`
  - however, the new `id` is lifted
  - `fmap id :: Functor f => f b -> f b`
2. `fmap (f . g) = fmap f . fmap g`

- bad implementation of `Functor` type may fail to meet above laws.
```haskell
data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust count x) = CJust (count+1) (f x)

instance Eq a => Eq (CMaybe a) where
    (==) CNothing CNothing = True
    (==) (CJust c1 v1) (CJust c2 v2) = c1 == c2 && v1 == v2
    (==) _ _ = False

fmap id (CJust 0 "what") == id (CJust 0 "what")
-- False
``` 
- Of course, you can modify the implementation of `(==)` on `CMaybe` 
  to make the first law holds on `CMaybe` type. However, I think 
  it is conceptually inconsistent with what we expect.

## More Example on `Functor`
- Let's see some examples
  - `fmap :: (a -> b) -> f a -> f b`
  - `(++) :: [a] -> ([a] -> [a])`
  - `Just "Haha" :: Maybe [Char]`
  - `ghc` deduces:
    - `a == b`
    - `a == [Char]`
  - so `app` has type `Maybe ([Char] -> [Char])`
```haskell
app :: Maybe ([Char] -> [Char])
app = fmap (++) (Just "Haha")
```
- The reason why we can do this is that functions in **Haskell**
  are curried by default
- Intuition: `fmap` a function over a `Functor` is like wrapping a
  curried function into an execution context.

# Applicative
