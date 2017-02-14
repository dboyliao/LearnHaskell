* Imperative languages you usually get things done by giving the computer a series of steps to execute, functional programming is more of defining what stuff is.
* The only thing a function can do in Haskell is give us back some result based on the parameters we gave it. If a function is called two times with the same parameters, it has to return the same result.
* If we're taking data out of an I/O action, we can only take it out when we're inside another I/O action
* '=' means assignment, '<-' means binding, they are quite different things.
* I/O actions are values much like any other value in Haskell. We can pass them as parameters to functions and functions can return I/O actions as results. What's special about them is that if they fall into the main function (or are the result in a GHCI line), they are performed.
* Terminal I/O:
  - `getChar` / `getLine`: read char/line from terminal.
  - `putChar` / `putStrLn`: print char/string to terminal.
  - `getContents :: IO String` 
    - `getContents` reads **all** contents from stdin (in a lazy manner).
    - It differents from `getLine` by the fact that `getLine` return a String from stdin line by line.
  - `interact`:: (String -> String) -> IO ()
    - take input and pass it to given function and transform the result into an I/O action
    - frankly speaking, `interact` will pass a String read from user input to your function and print out the returned String.
* File I/O:
  - `writeFile :: FilePath -> String -> IO ()`
    - write a given String to FilePath
    - flush out old content
  - `appendFile :: FilePath -> String -> IO ()`
    - append a given String to the end of FilePath
    - keep old content
  - `hSetBuffering :: Handle -> BufferMode -> IO ()`
    - `hSetBuffering` can be used to setup chunk size for reading from files.
    - For text files, the buffering mode is usually `LineBuffering`.
* Randomness
  - **Haskell is a pure functional language. What that means is that it has referential transparency.**
  - Giving a function in Haskell the same parameters twice, you will get the same result.
  - In Haskell, you need a random generator to get a random number. (`StdGen` from `System.Random`)
  - With a `RandomGen`, you can use `random` to generate one random number.
  - Note that if you pass the same random generator to `random`, you will get back the same result.
  - `randoms :: (RandomGen g, Random a) => g -> [a]`
  - `randomR :: (RandomGen g, Random a) => (a, a) -> g -> (a, g)`
    - It return a random value in a given range.
  - `randomRs :: (RandomGen g, Random a) => (a, a) -> g -> [a]`
    - Work like `randomR` except that it returns a list of random values.
  - `getStdGen` is an I/O action --> radomness out of your control.
    - It will return a global random generator
    - If you call it twice, it will give you the same generator
  - `newStdGen` is just like `genStdGen` except that it will return a new random generator instead of global random generator.
* Byte String
  - Defined in `Data.ByteString`
    - `Data.ByteString` has many strict functions for `ByteString`.
    - `Data.ByteString.Lazy` for functions with lazy evaluation.
    - There are many functions overlapped with the its counterpart in `Data.List`
      - ex: `head`, `tail`, `foldl`, `foldr`...etc
    - `ByteString` is conceptually (not **actually**) an array of of `Word8`.
  - run `:info GHC.Word.Word8` to see detailed info of `Word8`.
    - `Word8` is an instance of `Num`.
  - Can use `fromIntegral` to convert an `Int` to `Word8`.
  - `Data.ByteString.pack :: [GHC.Word.Word8] -> ByteString`
  - `Data.ByteString.chunk :: [ByteString] -> ByteString`
  - `Data.ByteString.readFile :: FilePath -> IO ByteString`
    - strict version: read all content at once.
  - `Data.ByteString.Lazy.readFile :: FilePath -> IO ByteString`
    - read file a chunk at a time.
    - Think of it as a stream of chunks from a file.
  - If you need to read/write a lot of data, you can first work with `String` and then convert your code to use `ByteString`.
* IO Exception
  - I can't find `catch` in `System.IO.Error`, though I do find `catchIOError` with signature `catchIOError :: IO a -> (IOError -> IO a) -> IO a`, which is the same as mentioned in the `Learn You a Haskell - Chap 9: Exceptions`.
    - `System.IO.Error.catchIOError :: IO a -> (IOError -> IO a) -> IO a`
  - use `userError` to construct a customized `IOError` and `ioError` to raise it
  - A more general one is `throw` from `Control.Exception`.
    - `Control.Exception.throw :: Control.Exception.Exception e => e -> a`
    - `Control.Exception.catch :: :: Control.Exception.Exception e => IO a -> (e -> IO a) -> IO a`