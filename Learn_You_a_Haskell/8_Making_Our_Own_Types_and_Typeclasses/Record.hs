data Person = Person {
                        firstName :: String,
                        lastName :: String,
                        age :: Int,
                        height :: Float,
                        phoneNumber :: String,
                        flavor :: String
                     } deriving (Show, Eq)

data Car = Car {
                company :: String,
                model :: String,
                year :: Integer -- seems like I can only use Integer here instead of Int but not Integral.
                                -- Maybe that is because Integer is a type but Integral is a typeclass(?).
               } deriving (Show)

data Haha a b = Left { name::a } | Right { what::b } deriving (Show)
-- # https://wiki.haskell.org/Default_values_in_records
