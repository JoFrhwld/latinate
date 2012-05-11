library(plyr)

source("R/make_prefix_regex.R")

words <- read.csv("I81379.csv")
verbs <- subset(words, grepl("VB", POS) & !grepl(">", MorphSp) & Length >= 4)

