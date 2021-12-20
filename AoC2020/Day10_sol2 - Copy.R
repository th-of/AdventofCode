library(stringi)
library(dplyr)
options(scipen = 999)
#dat <- readLines("Day10_1_data.txt")
dat <- readLines("Day10_testset.txt")
#dat <- readLines("Day10_testset_small.txt")

nums <- c()
nums <- sort(nums)


for (i in dat){
  nums <- append(nums, as.numeric(i))
}
nums <- sort(nums)
nums2 <- c()
nums2[1] <- 1
nums2 <- sort(nums)


nums2[length(nums2)+1] <- nums2[length(nums2)]+3

for (i in 1:(length(nums))){
  nums[i] <- nums[i+1]-nums[i]
}
nums[length(nums)] <- 1
nums[length(nums)+1] <- 3

nums_string <- paste(nums, collapse="")

a <- length(stri_locate_all(nums_string, fixed = "1111", overlap = TRUE)[[1]][,1])
b <- length(stri_locate_all(nums_string, fixed = "31113", overlap = TRUE)[[1]][,1])
c <- length(stri_locate_all(nums_string, fixed = "3113", overlap = TRUE)[[1]][,1])
  
# finally deduced the formula
#print(7**(a) * 4**b * 2**(c))
## Attempting a brute-force solution, result don't appear too high

# one path to get to 52, from 49 (in between = 1)
len <- length(nums2)

sum(between(nums2, nums2[len]-3, nums2[len]-1))

# paths to get to 49: 48, 47, 46 (in between = 3)
sum(between(nums2, nums2[len-1]-3, nums2[len-1]-1))

counter <- c()
for (i in len:1){
  counter <- counter*sum(between(nums2, nums2[i]-3, nums2[i]-1))
}













