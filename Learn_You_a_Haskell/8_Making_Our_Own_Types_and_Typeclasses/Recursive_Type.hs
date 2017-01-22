-- data List a = Empty | Cons a (List a) deriving (Show, Eq, Read, Ord)
infixr 5 :-: -- this can be defined in data constructor
data List a = Empty | a :-: ( List a ) deriving (Show, Read, Eq, Ord)

infixr 5 .++ -- or as a function
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)
-- pattern matching: It's basically matching `constructor`.
