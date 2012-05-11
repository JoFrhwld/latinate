library(plyr)

source("R/get_wikipedia_prefixes.R")
source("R/make_prefix_regex.R")

## Data from English Lexicon Project
## http://elexicon.wustl.edu/
words <- read.csv("data/I81379.csv")
verbs <- subset(words, grepl("VB", POS) & !grepl(">", MorphSp) & Length >= 4)


table(with(verbs, grepl(pattern=prefix.s, Word)))

lverb.list <- llply(prefix.s, function(x, df){
                                  sub <- subset(df, grepl(pattern=x, Word))
                                  return(sub)
                                }, df = verbs, .progress = "text")
