fibo :: (Num n, Eq n) => n -> n
fibo n = case n of 0 -> 1
                   1 -> 1
                   n -> (fibo (n-1)) + (fibo (n-2))

tailFibo :: (Num a, Num n, Eq n) => n -> a -> a -> a
tailFibo n a acc = case n of 0 -> acc
                             1 -> acc
                             n -> tailFibo (n-1) acc (a+acc)
