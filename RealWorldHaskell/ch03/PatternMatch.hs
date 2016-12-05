data Book = Book String [String]
bookAuthors (Book title authors) = authors
bookTitle (Book title authors) = title
