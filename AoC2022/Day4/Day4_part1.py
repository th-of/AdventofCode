def intersection(comp1, comp2):
    intersect = [value for value in comp1 if value in comp2]
    return intersect

n = 0
with open("input.txt") as f:
    for line in f:
        a = range(int(line.split(",")[0].split("-")[0]), int(line.split(",")[0].split("-")[1])+1)
        b = range(int(line.split(",")[1].split("-")[0]), int(line.split(",")[1].split("-")[1])+1)
        if len(intersection(a, b)) == len(a) or len(intersection(a, b)) == len(b):
            n += 1    
print(n)