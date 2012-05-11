library(plyr)

source("R/get_wikipedia_prefixes.R")
## Creates objects:
### latinate
### prefixes
### tables
### theurl

source("R/make_prefix_regex.R")
## Creates objects:
### prefix.s


## arrange the prefixes by their length
## longer prefixes are more restrictive searchers,
## so they should be ordered first
prefix.len <- nchar(prefix.s)
prefix.order <- order(-prefix.len)
prefix.s <- prefix.s[prefix.order]


## Data from English Lexicon Project
## http://elexicon.wustl.edu/
words <- read.csv("data/I81379.csv")
verbs <- subset(words, grepl("VB", POS) & !grepl(">", MorphSp) & Length >= 4)

## This is a resevoir of remaining verbs
verbs.foo <- verbs


lverb.list <- ldply(prefix.s, function(x, df){
                                  sub <- df[grep(x, df$Word),]
                                  verbs.foo <<- df[-grep(x, df$Word),]
                                  return(sub)
                                }, df = verbs.foo, .progress = "text")
