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

## begin hand checking the most common roots
names(root.tab)[4]
### "ify"
subset(lverbs.df, root == names(root.tab)[4])
### conclusion, 'ify' is a mixed bag
good_root <- c(good_root, "ify")

## begin hand checking the most common roots
names(root.tab)[5]
### "t"
subset(lverbs.df, root == names(root.tab)[5])
### conclusion, 't' is no good
bad_root <- c(bad_root, "t")


## begin hand checking the most common roots
names(root.tab)[6]
### "k"
subset(lverbs.df, root == names(root.tab)[6])
### conclusion, 'k' is no good
bad_root <- c(bad_root, "k")


## begin hand checking the most common roots
names(root.tab)[7]
### "d"
subset(lverbs.df, root == names(root.tab)[7])
### conclusion, 'd' is no good
bad_root <- c(bad_root, "d")


## begin hand checking the most common roots
names(root.tab)[8]
### "ure"
subset(lverbs.df, root == names(root.tab)[8])
### conclusion, 'ure' is pretty good
good_root <- c(good_root, "ure")

## begin hand checking the most common roots
names(root.tab)[9]
### "ch"
subset(lverbs.df, root == names(root.tab)[9])
### conclusion, 'ch' is no good
bad_root <- c(bad_root, "ch")

## begin hand checking the most common roots
names(root.tab)[10]
### "it"
subset(lverbs.df, root == names(root.tab)[10])
### conclusion, 'it' is mostly no good
### e-mit, vo-mit??
good_root <- c(good_root, "it")

## begin hand checking the most common roots
names(root.tab)[11]
### "ter"
subset(lverbs.df, root == names(root.tab)[11])
### conclusion, 'ter' is mostly no good
### de-ter, al-ter
good_root <- c(good_root, "ter")

## begin hand checking the most common roots
names(root.tab)[12]
### "p"
subset(lverbs.df, root == names(root.tab)[12])
### conclusion, 'p' is no good
bad_root <- c(bad_root, "p")

## begin hand checking the most common roots
names(root.tab)[13]
### "y"
subset(lverbs.df, root == names(root.tab)[13])
### conclusion, 'y' is mostly no good
### de-ny
good_root <- c(good_root, "y")

## begin hand checking the most common roots
names(root.tab)[14]
### "er"
subset(lverbs.df, root == names(root.tab)[14])
### conclusion, 'er' is no good
bad_root <- c(bad_root, "er")

## begin hand checking the most common roots
names(root.tab)[15]
### "pose"
subset(lverbs.df, root == names(root.tab)[15])
### conclusion, 'pose' is good
good_root <- c(good_root, "pose")

## begin hand checking the most common roots
names(root.tab)[16]
### "ion"
subset(lverbs.df, root == names(root.tab)[16])
### conclusion, 'ion' is good
good_root <- c(good_root, "ion")

## begin hand checking the most common roots
names(root.tab)[17]
### "le"
subset(lverbs.df, root == names(root.tab)[17])
### conclusion, 'le' is no good
bad_root <- c(bad_root, "le")

## begin hand checking the most common roots
names(root.tab)[18]
### "or"
subset(lverbs.df, root == names(root.tab)[18])
### conclusion, 'le' is no good
bad_root <- c(bad_root, "le")


