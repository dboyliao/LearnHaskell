data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    (==) Red Red = True
    (==) Yellow Yellow = True
    (==) Green Green = True
    (==) _ _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Green = "Green light"
    show Yellow = "Yellow light"

class (Eq a, Show a) => MyTypeClass a where
    magic :: a -> a -> String

data Hello = What | Fuck

instance Eq Hello where
    x == y = False

instance Show Hello where
    show What = "What the!?"
    show Fuck = "Fuck!"

instance MyTypeClass Hello where
    magic x y = (show x) ++ " " ++ (show y)
