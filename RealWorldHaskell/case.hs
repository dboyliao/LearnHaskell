head' xs = case xs of [] -> error "\ESC[31mInput array is empty\ESC[0m"
                      (x:_) -> x
