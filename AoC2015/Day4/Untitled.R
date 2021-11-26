# Day 4, part 1
input <- "ckczppom"

library("digest")
library("openssl")

tab <- as.data.frame(1:999999)
tab$New <- paste0(input, tab[,1])
tab$Hashes <- md5(tab$New)
grep("^00000", tab$Hashes)

# Answer: 117946

