scanr' :: Foldable t => (b -> a -> a) -> a -> t b -> [a]
scanr' f acc list = foldl (\l e -> (f e (head l)):l) [acc] list
scanl' f acc list = reverse $ scanr' f acc list
