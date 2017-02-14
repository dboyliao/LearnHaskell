import qualified Data.ByteString.Lazy as BString -- lazy byte string
import Data.Char
-- import qualified Data.ByteString as BString -- strict byte string

main :: IO ()
main = do
    let bs = BString.pack (map (fromIntegral . ord) "Hello Haskell")
    putStrLn $  show bs
    let codePoints = [72, 101, 108, 108, 111, 32, 72, 97, 115, 107, 101, 108, 108, 32, 117, 115, 101, 114]
        bsLazy = foldr BString.cons BString.empty codePoints
        bsStrict = foldr BString.cons' BString.empty codePoints
    putStrLn $ show bsLazy
    putStrLn $ show bsStrict