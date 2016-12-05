#!/usr/bin/env runhaskell
a_list = [ x*y | x <- [1..10], y <- [2..5] ]
combination xs xs' = [(x, x') | x <- xs, x' <- xs']

main = do
       print a_list
       print (length a_list)
       print (combination [1..3] [2..5])
