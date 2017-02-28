data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust count x) = CJust (count+1) (f x)
-- this break the first law of `Functor`
-- `fmap id` on CMaybe is not identical to `id` 

instance Eq a => Eq (CMaybe a) where
    (==) CNothing CNothing = True
    (==) (CJust c1 v1) (CJust c2 v2) = c1 == c2 && v1 == v2
    (==) _ _ = False