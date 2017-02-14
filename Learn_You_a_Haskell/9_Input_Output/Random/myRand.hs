module MyRand
(
  rand,
  rand',
  randoms',
  finiteRandoms
) where 

import System.Random

rand :: (Random a, RandomGen g) => Int -> [a] -> g -> [a]
rand 0 ret _ = ret
rand n ret g = let (newElem, newG) = random g
                   newRet = ret ++ [newElem] in 
                rand (n-1) newRet newG

rand' :: (RandomGen g, Random a) => Int -> g -> [a]
rand' n g = take n $ randoms g

randoms' :: (Random a, RandomGen g) => g -> [a]
randoms' gen = let (newElem, newGen) = random gen in newElem:randoms' newGen
-- this will produse an infinite list

finiteRandoms :: (RandomGen g, Random a, Num n, Eq n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n g =
    let (newElem, newGen) = random g
        (result, finalGen) = finiteRandoms (n-1) newGen
    in (newElem:result, finalGen)
