head' :: [a] -> a
head' xs = _head xs
    where _head [] = error "\ESC[0;31mEmpty array\ESC[0m"
          _head (x:_) = x
