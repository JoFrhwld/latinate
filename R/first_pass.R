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
names(prefix.s) <- prefix.s


## Data from English Lexicon Project
## http://elexicon.wustl.edu/
words <- read.csv("data/I81379.csv")
verbs <- subset(words, grepl("VB", POS) & !grepl(">", MorphSp) & Length >= 4)

## This is a resevoir of remaining verbs
assign(x = "verbs.foo", value=verbs, envir=.GlobalEnv)


lverbs.list <- vector(length = length(prefix.s), mode = "list")

do_lverb_sub <- function(x, df){
  sub <- df[grep(x, df$Word),]
  if(nrow(sub) > 0){
    new <- df[-grep(x, df$Word),]
  }else{
    new <- df
  }
  assign(x = "verbs.foo", 
         value=new, 
         envir=.GlobalEnv)
  return(sub)
}


for(i in 1:length(prefix.s)){
  x <- prefix.s[i]
  out <- do_lverb_sub(x, df = verbs.foo)
  if(nrow(out) > 0){
    out$prefix <- x
  }
  lverbs.list[[i]] <- out
}
names(lverbs.list) <- prefix.s

lverbs.df <- rbind.fill(lverbs.list)
lverbs.df <- ddply(lverbs.df, .(prefix), 
                   transform, 
                   nprefix = length(prefix),
                   root = gsub(prefix[1], "", Word),
                   .progress = "text")

lverbs.df <- ddply(lverbs.df, .(root), transform,
                   nroot = length(root), .progress = "text")

write.table(lverbs.df, file = "data/latinate.first.pass.txt", sep = "\t", row.names = F)
