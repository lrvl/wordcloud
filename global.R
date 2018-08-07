library(tm)
library(wordcloud)
#library(memoise)

# Using "memoise" to automatically cache the results
getTermMatrix <- function(f) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  
  text <- readLines(f$datapath,encoding = "UTF-8")
  
  woorden = Corpus(VectorSource(text))
  
  woorden = tm_map(woorden, content_transformer(tolower))
  woorden = tm_map(woorden, removePunctuation)
  woorden = tm_map(woorden, removeNumbers)
  woorden = tm_map(woorden, removeWords,
                    #c(stopwords("dutch")))
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(woorden,
                             control = list(minWordLength = 1,wordLengths=c(0,Inf)))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
}