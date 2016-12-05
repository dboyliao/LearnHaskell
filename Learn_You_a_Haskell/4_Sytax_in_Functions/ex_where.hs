bmiTell :: (RealFloat a) => a -> a -> String
bmiTell w h
  | bmi >= fat = "you FATTY!"
  | bmi >= normal = "normal"
  | bmi >= skinny = "skinny"
  | otherwise = "What!!??"
  where bmi = w / h^2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

initials :: String -> String -> String
initials firstname lastname = f:'.':l:'.':[]
    where (f:_) = firstname
          (l:_) = lastname
