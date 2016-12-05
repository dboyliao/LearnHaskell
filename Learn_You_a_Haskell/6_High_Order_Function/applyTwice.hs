applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x) 
-- applyTwice (++ " Hey!") "Dude"
-- applyTwice ("Hey! " ++) "Dude"
