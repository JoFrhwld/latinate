library(stringr)

latinate <- read.delim("data/prefixes.txt")
latinate$root <- gsub("\\(.*\\)", "", latinate$root)
latinate$root <- gsub(" ", "", latinate$root)
latinate$root <- gsub("-", "", latinate$root)

prefix.s <- str_c(latinate$root, collapse = ",")
prefix.s <- unlist(str_split(prefix.s, pattern=","))

prefix.s <- str_c("^", prefix.s, sep="")


