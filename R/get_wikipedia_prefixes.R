library(XML)
library(plyr)

theurl <- "http://en.wikipedia.org/wiki/List_of_Greek_and_Latin_roots_in_English"
tables <- readHTMLTable(theurl)
tables <- llply(tables, function(x){
                                colnames(x) <- gsub(" ", "_", tolower(colnames(x)))
                                return(x)
                              })


prefixes <- ldply(tables, function(x)if(ncol(x)==5)return(x))
latinate <- subset(prefixes, origin_language == "Latin")

write.table(latinate[,-1], file="data/prefixes_first.txt", sep="\t", row.names=F)
