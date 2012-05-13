library(stringr)

latinate_sub <- read.delim("data/prefixes_first.txt")
latinate_sub$root <- gsub("\\(.*\\)", "", latinate_sub$root)
latinate_sub$root <- gsub(" ", "", latinate_sub$root)
latinate_sub$root <- gsub("-", "", latinate_sub$root)

prefix.s <- str_c(latinate_sub$root, collapse = ",")
prefix.s <- unlist(str_split(prefix.s, pattern=","))

prefix.s <- str_c("^", prefix.s, sep="")


