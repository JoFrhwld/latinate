# Latinate Prefixes
I'm trying to get data on latiante prefixes on English verbs.

## The Data
### Lexion
`I81379.csv` is data from the [English Lexicon Project](http://elexicon.wustl.edu/) with the filter that the word should have between 1 and 3 morphemes. I wanted to exclude inflected and derived forms as much as possible.

### Prefixes
`prefixes.txt` is Latin and Greek prefixes scraped from [Wikipedia](http://en.wikipedia.org/wiki/List_of_Greek_and_Latin_roots_in_English).

### Current Status
At some point, there is going to be no way around coding something or another by hand, but I'd like to reduce the number of decisions I need to make as much as possible, and to make the process as reproducible as possible.

Right now, there are a lot of prefixes in the data scraped from wikipedia that are irrelevant, like `vulp`. It would be nice to pare these down in some principled way. 


