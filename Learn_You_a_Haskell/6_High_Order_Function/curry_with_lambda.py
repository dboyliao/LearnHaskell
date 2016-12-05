#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

mulThree = lambda x: lambda y: lambda z: (x*y)*z

if __name__ == "__main__":
    print("mulThree(2)(3)(4):", mulThree(2)(3)(4))
