## Opponent:
# A = Rock
# B = Paper
# C = Scissors
## Me:
# X = Rock
# Y = Paper
# Z = Scissors

## Possibilities:
# A X => draw => 3 + 1
# A Y => win  => 6 + 2
# A Z => loss => 0 + 3
# -----
# B X => loss => 0 + 1
# B Y => draw => 3 + 2
# B Z => win  => 6 + 3
# -----
# C X => win  => 6 + 1
# C Y => loss => 0 + 2
# C Z => draw => 3 + 3

score = 0

with open("input.txt") as f:
    for line in f:
        if line[0] == 'A' and line[2] == 'X':
            score += 4
        if line[0] == 'A' and line[2] == 'Y':
            score += 8
        if line[0] == 'A' and line[2] == 'Z':
            score += 3
        if line[0] == 'B' and line[2] == 'X':
            score += 1
        if line[0] == 'B' and line[2] == 'Y':
            score += 5
        if line[0] == 'B' and line[2] == 'Z':
            score += 9
        if line[0] == 'C' and line[2] == 'X':
            score += 7
        if line[0] == 'C' and line[2] == 'Y':
            score += 2
        if line[0] == 'C' and line[2] == 'Z':
            score += 6
print(score)