library(reshape2)
library(stringr)

latinate <- read.delim("data/prefixes_first.txt")
meaning_col <- colsplit(latinate$meaning_in_english, 
                        pattern=",", 
                        names = c("a","b","c","d","e"))

english_prep <- c("a", "abaft", "aboard", "about", "above", "absent", "across", "afore", "after", "against", "along", "alongside", "amid", "amidst", "among", "amongst", "an", "apropos", "around", "as", "aside", "astride", "at", "athwart", "atop", "barring", "before", "behind", "below", "beneath", "beside", "besides", "between", "betwixt", "beyond", "but", "by", "circa", "concerning", "despite", "down", "during", "except", "excluding", "failing", "following", "for", "from", "given", "in", "including", "inside", "into", "lest", "like", "mid", "midst", "minus", "modulo", "near", "next", "notwithstanding", "of", "off", "on", "onto", "opposite", "out", "outside", "over", "pace", "past", "per", "plus", "pro", "qua", "regarding", "round", "sans", "save", "since", "than", "through", "thru", "throughout", "till", "times", "to", "toward", "towards", "under", "underneath", "unlike", "until", "unto", "up", "upon", "versus", "via", "vice", "with", "within", "without", "worth", "ago", "apart", "aside", "away", "hence", "notwithstanding", "on", "through")

prep_tf_1 <- with(meaning_col, a %in% english_prep | 
  b %in% english_prep | 
  c %in% english_prep | 
  d %in% english_prep | 
  e %in% english_prep )


english_grep <- str_c(english_grep, collapse="|")
grepl(english_grep, "sharp")

prep_tf_2 <- with(meaning_col, grepl(english_grep, a)|
                  grepl(english_grep, b)|
                  grepl(english_grep, c)|
                  grepl(english_grep, d)|
                  grepl(english_grep, e))

prep_tf_both <- prep_tf_1 | prep_tf_2


latinate_sub <- latinate[prep_tf_both,]

latinate_sub$N <- 1:nrow(latinate_sub)
latinate_sub[,c("meaning_in_english","N")]
bad_row <- c(5,6,7,12,14,20, 21,22, 24, 29,31, 32, 33, 34, 35, 36, 44)

latinate_sub <- latinate_sub[-bad_row, ]
write.table(latinate_sub[,-1], file="data/prefixes.txt", sep="\t", row.names=F)