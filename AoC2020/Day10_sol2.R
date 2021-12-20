library(stringi)
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
nums2 <- sort(nums)

for (i in 1:(length(nums))){
  nums[i] <- nums[i+1]-nums[i]
}
nums[length(nums)] <- 1
nums[length(nums)+1] <- 3

nums2[length(nums2)] <- 1
nums2[length(nums2)+1] <- 3

nums_string <- paste(nums, collapse="")

a <- length(stri_locate_all(nums_string, fixed = "1111", overlap = TRUE)[[1]][,1])
b <- length(stri_locate_all(nums_string, fixed = "31113", overlap = TRUE)[[1]][,1])
c <- length(stri_locate_all(nums_string, fixed = "3113", overlap = TRUE)[[1]][,1])
  
# finally deduced the formula
#print(7**(a) * 4**b * 2**(c))
## Attempting a brute-force solution, result don't appear too high

dp <- c()
dp[1] <- 1

for (i in 1:length(nums2)) {
  dp <- append(dp, 0)
  for (j in i:1) {
    print(j)
    if (nums2[i] < nums2[j]) {
      break
      if ((nums2[i] - nums2[j]) > 3) {
        break
      }
    }
    dp[i] <- dp[i] + dp[j]
  }
}











