-- file: ch03/BookStore.hs
data BookInfo = Book Int String [String]
                deriving (Show)

type CustomerID = Int
type ReviewBody = String

data BookReview = BookReview BookInfo CustomerID ReviewBody
                  deriving (Show)

