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
with open("input.txt") as f:
    for line in f:
        size = len(line.strip('\n'))//2
        comp1 = list(line[:size])
        comp2 = list(line[size:])
        n += priority[intersection(comp1, comp2)[0]]
        
print(n)