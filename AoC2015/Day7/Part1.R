# Day 6, part 1
input <- readLines("input.txt")

for (instruction in input){
    try(eval(parse(text=instruction)))
}

#alp <- paste(letters, sep="")
#identifiers <- c(alp, paste0("a", alp))


input_new <- gsub("RSHIFT", "bitwShiftR(", input)
input_new <- gsub("LSHIFT", "bitwShiftL(", input_new)
input_new <- gsub("NOT", "bitwNot(", input_new)
input_new <- gsub("AND", "bitwAnd(", input_new)
input_new <- gsub("OR", "bitwOr(", input_new)


mod_input <- c()

for (n in 1:length(input_new)){
  if (grepl("bitwShiftR\\(", input_new[n])){
    first <- paste0(strsplit(input_new[n], " bitwShiftR\\( ")[[1]][1], sep = "")
    first <- paste(strsplit(first, "")[[1]], collapse = "_")
    latter <- strsplit(strsplit(input_new[n], " bitwShiftR\\( ")[[1]][2], " ")[[1]][1]
    latter <- paste(strsplit(latter, "")[[1]], collapse = "_")
    last_ <- tail(strsplit(input_new[n], " ")[[1]], 1)
    last_ <- paste(strsplit(last_, "")[[1]], collapse = "_")
    mod_input[n] <- paste0("bitwShiftR(", first, ", ", latter, ")", " -> ", last_)
  }
  if (grepl("bitwShiftL\\(", input_new[n])){
    first <- paste0(strsplit(input_new[n], " bitwShiftL\\( ")[[1]][1], sep = "")
    first <- paste(strsplit(first, "")[[1]], collapse = "_")
    latter <- strsplit(strsplit(input_new[n], " bitwShiftL\\( ")[[1]][2], " ")[[1]][1]
    latter <- paste(strsplit(latter, "")[[1]], collapse = "_")
    last_ <- tail(strsplit(input_new[n], " ")[[1]], 1)
    last_ <- paste(strsplit(last_, "")[[1]], collapse = "_")
    mod_input[n] <- paste0("bitwShiftL(", first, ", ", latter, ")", " -> ", last_)
  }
  if (grepl("bitwNot\\(", input_new[n])){
    first <- strsplit(input_new[n], " ")[[1]][2]
    first <- paste(strsplit(first, "")[[1]], collapse = "_")
    last_ <- strsplit(input_new[n], " ")[[1]][4]
    last_ <- paste(strsplit(last_, "")[[1]], collapse = "_")
    mod_input[n] <- paste0("bitwNot(", first, ")", " -> ", last_)
  }
  if (grepl("bitwAnd\\(", input_new[n])){
    first <- paste0(strsplit(input_new[n], " bitwAnd\\( ")[[1]][1], sep = "")
    first <- paste(strsplit(first, "")[[1]], collapse = "_")
    latter <- strsplit(strsplit(input_new[n], " bitwAnd\\( ")[[1]][2], " ")[[1]][1]
    latter <- paste(strsplit(latter, "")[[1]], collapse = "_")
    last_ <- tail(strsplit(input_new[n], " ")[[1]], 1)
    last_ <- paste(strsplit(last_, "")[[1]], collapse = "_")
    mod_input[n] <- paste0("bitwAnd(", first, ", ", latter, ")", " -> ", last_)
  }
  if (grepl("bitwOr\\(", input_new[n])){
    first <- paste0(strsplit(input_new[n], " bitwOr\\( ")[[1]][1], sep = "")
    first <- paste(strsplit(first, "")[[1]], collapse = "_")
    latter <- strsplit(strsplit(input_new[n], " bitwOr\\( ")[[1]][2], " ")[[1]][1]
    latter <- paste(strsplit(latter, "")[[1]], collapse = "_")
    last_ <- tail(strsplit(input_new[n], " ")[[1]], 1)
    last_ <- paste(strsplit(last_, "")[[1]], collapse = "_")
    mod_input[n] <- paste0("bitwOr(", first, ", ", latter, ")", " -> ", last_)
  }
}

mod_input[which(is.na(mod_input))] <- input_new[which(is.na(mod_input))]

mod_input[7] <- "l_x -> a"
mod_input <- gsub("([0-9]{1})_([0-9]{1})", '\\1\\2', mod_input)

#(.)([0-9]{1})_([0-9]{1})(.)

for (instruction in mod_input){
  try(eval(parse(text=instruction)))
}

while (exists("a") == FALSE){
  for (instruction in mod_input){
    try(eval(parse(text=instruction)))
  }
}
print(a)

# Answer: 46065