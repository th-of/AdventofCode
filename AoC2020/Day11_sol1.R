dat <- readLines("Day11_1_data.txt")
nums <- c()
test <- matrix(nrow = 91, ncol = 90)
for (i in dat){
  nums <- append(nums, i)
}

nums <- strsplit(nums, "")

for (i in 1:91){
  for (j in 1:90){
    test[i,j] <- nums[[j]][i]
  }
}

# solving it with regex
# [.] = floor, always empty = 0
# [#] = occupied = 2
# [L] = empty seat = 1


dat <- gsub("\\.", "0", dat)
dat <- gsub("L", "1", dat)
dat <- gsub("\\#", "2", dat)
dat2 <- dat

# dat <- gsub("111", "121", dat)
# dat <- gsub("^11", "21", dat)
# dat <- gsub("11$", "12", dat)
# 
# dat <- gsub("22{4,}", "022221", dat)
# dat <- gsub("2{4,}2", "122220", dat)
# 
# while ((identical(unlist(dat2), unlist(dat))) == FALSE){
#   dat2 <- dat
#   print("Run")
#   dat <- gsub("111", "121", dat)
#   dat <- gsub("^11", "21", dat)
#   dat <- gsub("11$", "12", dat)
#   dat <- gsub("022222", "022221", dat)
#   dat <- gsub("222220", "122220", dat)
# }
# dat <- gsub("\\.", "0", dat)
# dat <- gsub("L", "1", dat)
# 
# # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
# dat <- gsub("111", "121", dat)
# #start of line
# dat <- gsub("^11", "21", dat)
# 
# #end of line
# dat <- gsub("11$", "12", dat)
# 
# # If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
# dat <- gsub("022222", "022221")
# dat <- gsub("222220", "122220")



