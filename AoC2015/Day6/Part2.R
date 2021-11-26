# Day 6, part 2
data <- readLines("input.txt")

# 1: turn on lights
# 2: turn off lights
# 3: toggle lights

# all lights off
lights <- data.frame(matrix(ncol = 1000, nrow = 1000))
lights[,] <- 0
counter <- 0
for (rule in data){
  counter <- counter + 1
  num1 <- as.numeric(tail(strsplit(strsplit(rule, ",")[[1]][1], " ")[[1]], 1)) + 1
  num3 <- as.numeric(strsplit(strsplit(rule, ",")[[1]], " ")[[2]][1]) + 1
  num2 <- as.numeric(strsplit(strsplit(rule, ",")[[1]], " ")[[2]][3]) + 1
  num4 <- as.numeric(strsplit(strsplit(rule, ",")[[1]], " ")[[3]][1]) + 1
  if (grepl("on", rule)){
    lights[num1:num2, num3:num4] <- lights[num1:num2, num3:num4] + 1
  }
  if (grepl("off", rule)){
    if (sum(lights[num1:num2, num3:num4]) > 0){
      templights <- lights[num1:num2, num3:num4]
      templights[which(templights > 0, arr.ind = TRUE)] <- templights[which(templights > 0, arr.ind = TRUE)] - 1
      lights[num1:num2, num3:num4] <- templights
    }
  }
  if (grepl("toggle", rule)){
    lights[num1:num2, num3:num4] <- lights[num1:num2, num3:num4] + 2
  }
}

lights[which(lights < 0, arr.ind = TRUE)] <- 0
answer <- sum(lights)
print(answer)

# Answer: 17836115