def quick_sort(l):

    if len(l) == 0:
        return []

    b = l[0]
    smaller = filter(lambda s: s <= b, l[1:])
    larger = filter(lambda s: s > b, l[1:])

    return quick_sort(smaller) + [b] + quick_sort(larger)

def tail_quick_sort(l, p = 0, r = None):

    if len(l) == 0:
        return []

    if r is None:
        r = len(l)

    while p < r:
        # partition
        q, l = partition(l, p, r)
        tail_quick_sort(l, p, q)
        p = q+1

    return l

def partition(l, s, e):

    if len(l) == 0:
        return e, l

    pivot = l[-1]
    sm = filter(lambda a: a <= pivot, l[s:e])
    lg = filter(lambda a: a > pivot, l[s:e])
    l = sm + lg

    return len(sm) - 1, l
