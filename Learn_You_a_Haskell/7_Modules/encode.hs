import Data.Char

encode :: Int -> String -> String
encode shift msg = 
    let ords = map ord msg
        shifted = map (+shift) ords
    in map chr shifted

encode' :: Int -> String -> String
encode' shift msg = map (chr.(+shift).ord) msg

decode :: Int -> String -> String
decode shift cipher = map (chr.(\x -> x - shift).ord) cipher
