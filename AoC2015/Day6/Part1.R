# Day 6, part 1
data <- readLines("input.txt")

num1 <- strsplit(strsplit(data[1], ",")[[1]], " ")[[1]][3]
num2 <- strsplit(strsplit(data[1], ",")[[1]], " ")[[2]][1]
num3 <- strsplit(strsplit(data[1], ",")[[1]], " ")[[2]][3]
num4 <- strsplit(strsplit(data[1], ",")[[1]], " ")[[3]][1]

# 1: turn on lights
# 2: turn off lights
# 3: toggle lights

# all lights off
lights <- data.frame(matrix(ncol = 1000, nrow = 1000))
lights[,] <- 0

for (rule in data){
  num1 <- tail(strsplit(strsplit(rule, ",")[[1]][1], " ")[[1]], 1)
  num3 <- strsplit(strsplit(rule, ",")[[1]], " ")[[2]][1]
  num2 <- strsplit(strsplit(rule, ",")[[1]], " ")[[2]][3]
  num4 <- strsplit(strsplit(rule, ",")[[1]], " ")[[3]][1]
  if (grepl("on", rule)){
    lights[num1:num2, num3:num4] <- 1
  }
  if (grepl("off", rule)){
    lights[num1:num2, num3:num4] <- 0
  }
  if (grepl("toggle", rule)){
    lights[num1:num2, num3:num4] <- 1 - (lights[num1:num2, num3:num4])
  }
}

answer <- sum(lights)
print(answer)

# Answer: 569999