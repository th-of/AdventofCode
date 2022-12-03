# -*- coding: utf-8 -*-
"""
Created on Fri Dec  2 11:51:41 2022

@author: thoma
"""

n = 0
elves = [0]

with open('Day1_input.txt') as f:
    for line in f:
        if line == "\n":
            n += 1
            elves.insert(n, 0)
        else:
            elves[n] += int(line)
print(max(elves))