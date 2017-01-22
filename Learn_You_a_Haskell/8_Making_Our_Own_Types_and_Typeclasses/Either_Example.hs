import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String -- equivilent to typedef in C
type LockerMap = Map.Map Int (LockerState, Code) -- concrete type from a generic type

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber lockerMap = 
    case Map.lookup lockerNumber lockerMap of
        Nothing -> Left $ "locker number " ++ show lockerNumber ++ " not found"
        Just (state, code) -> if state /= Taken
                              then Right code
                              else Left $ "Locker number " ++ show lockerNumber ++ " is taken"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))]
