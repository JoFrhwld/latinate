library(plyr)

lverbs.df <- read.delim("data/latinate.first.pass.txt")
root.tab <- sort(-table(lverbs.df$root))

good_root <- vector()
bad_root <- vector()

## begin hand checking the most common roots
names(root.tab)[1]
### e
subset(lverbs.df, root == names(root.tab)[1])
### conclusion, 'e' is no good
bad_root <- c(bad_root, "e")

## begin hand checking the most common roots
names(root.tab)[2]
### ""
subset(lverbs.df, root == names(root.tab)[2])
### conclusion, '' is no good
bad_root <- c(bad_root, "")

## begin hand checking the most common roots
names(root.tab)[3]
### "ate"
subset(lverbs.df, root == names(root.tab)[3])
### conclusion, 'ate' is a mixed bag
good_root <- c(good_root, "ate")





