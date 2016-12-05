zipWith = lambda f: lambda xs: lambda ys: [[[f(x, y) for x in xs for y in ys],[]][len(ys) > 0],[]][len(xs) > 0]
