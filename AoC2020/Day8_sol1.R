dat <- readLines("Day8_1_data.txt")

steps <- matrix(nrow = length(dat), ncol = 2)

for (i in 1:length(dat)){
  steps[i,1] <- strsplit(dat[i], " ")[[1]][1]
  steps[i,2] <- as.numeric(paste(tail(strsplit(dat[i], " ")[[1]], n = -1), collapse = '', sep = ''))
}

counter <- 1
acc <- 0
data <- c()
seek <- TRUE
while (seek){
  todo <- steps[counter]
  if (todo == "acc"){
    acc <- acc + as.numeric(steps[counter,2])
    counter <- counter+1
  }
  if (todo == "jmp"){
    counter <- counter + as.numeric(steps[counter,2])
  }
  if (todo == "nop"){
    counter <- counter+1
  }
  if (is.element(counter, data)){
    print(acc)
    seek <- FALSE
  }
  data <- append(data, counter)
}

