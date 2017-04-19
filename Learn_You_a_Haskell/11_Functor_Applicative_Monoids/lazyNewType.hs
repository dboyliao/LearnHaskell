data CoolBool = CoolBool { getBool :: Bool }
--- using `newtype`
newtype CoolBool' = CoolBool' { getBool' :: Bool }

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello there!"

helloMe' :: CoolBool' -> String
helloMe' (CoolBool' _) = "hello there!"

--- helloMe undefined --- an exception in ghci
--- helloMe' undefined --- "hello there!"