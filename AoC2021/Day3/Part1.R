# Day 3, part 1

input <- strsplit(readLines("input.txt"), "")

test <- as.data.frame(input)
test <- t(test)

gamma_rate <- c()

for (i in 1:length(test[1,])){
  for (n in 1:length(test[1,])){
    if (sum(as.numeric(test[,i])) > (length(test[,i])/2)){
      gamma_rate[i] <- 1
    } else {
      gamma_rate[i] <- 0
    }
  }
}

epsilon_rate <- c()

for (k in 1:length(test[1,])){
  for (n in 1:length(test[1,])){
    if (sum(as.numeric(test[,k])) < (length(test[,k])/2)){
      epsilon_rate[k] <- 1
    } else {
      epsilon_rate[k] <- 0
    }
  }
}

power <- strtoi(paste(gamma_rate, collapse = ""), base = 2)*strtoi(paste(epsilon_rate, collapse = ""), base = 2)
print(power)
#Answer: 3309596