-- sequence :: (Monad m, Traversable t) => t (m a) -> m (t a)
main = do 
    rs <- sequence [getLine, getLine, getLine]
    print rs
