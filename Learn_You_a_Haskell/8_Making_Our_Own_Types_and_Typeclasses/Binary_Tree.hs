data BTree a = EmptyNode | Node a (BTree a) (BTree a) deriving (Show, Read, Eq, Ord)

leaf :: a -> BTree a
leaf a = Node a EmptyNode EmptyNode

treeInsert :: (Ord a) => a -> BTree a -> BTree a
treeInsert x EmptyNode = leaf x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x > a = Node a left (treeInsert x right)
    | x < a = Node a (treeInsert x left) right

elemTree :: (Ord a) => a -> BTree a -> Bool
elemTree _ EmptyNode = False
elemTree x (Node v left right)
    | x == v = True
    | x > v = elemTree x right
    | x < v = elemTree x left
