responsePalindromes :: String -> String
responsePalindromes = let isPalindromes line = line == (reverse line)
                      in unlines . map (\line -> if isPalindromes line then 
                                                    "palindrome" 
                                                 else "not palindrome") . lines

main = interact responsePalindromes
