# Day 4, part 2
input <- "ckczppom"

library("digest")
library("openssl")

tab <- as.data.frame(1:9999999)
tab$New <- paste0(input, tab[,1])
tab$Hashes <- md5(tab$New)
grep("^000000", tab$Hashes)

# Answer: 3938038

