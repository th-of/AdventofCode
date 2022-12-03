# -*- coding: utf-8 -*-
"""
Created on Sat Dec  3 15:18:59 2022

@author: thoma
"""
import string
Alphabet = list(string.ascii_lowercase) + list(string.ascii_uppercase)
priority = {Alphabet[k-1]:k for k in range(1, 53)}

def intersection(comp1, comp2):
    intersect = [value for value in comp1 if value in comp2]
    return intersect

n = 0
k = 0
sack = [0, 0, 0, 0]

with open("input.txt") as f:
    for line in f:
        sack[n] = list(line.strip("\n"))
        n += 1
        if n >= 3:
            a = intersection(sack[0], sack[1])
            b = intersection(a, sack[2])
            k += priority[b[0]]
            n = 0
print(k)