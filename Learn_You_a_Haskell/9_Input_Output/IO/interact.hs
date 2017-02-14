main = interact $ unlines . filter ((<=10) . length) . lines
-- $ can't be replaced with .
-- Since :t interact = (String -> String) -> IO () <- do not match the signature of '.'
