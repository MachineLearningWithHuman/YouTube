#We will do sentiment analysis in R (sample work can't show as project)
#just to get you idea how it is done

#dataset R package 'janeaustenR'

##you need sentiment lexicons package in R tidytext
library(tidytext)
tidytext::sentiments   #sentiment lexicons good positive . Bad negative

get_sentiments("bing")

#bing 
#AFINE
#loughran
#general purpose lexicon 
#they use unigrams 
#unigrams are type of n-gram n=1
#AFINN -5 TO 5
#loughran shareholder report analysis
get_sentiments("afinn")
get_sentiments("loughran")


#Theory covered with Errors
library(janeaustenr)
library(stringr)
library(tidytext)
library(dplyr)


tidy_data <- austen_books() %>%                      #dplyr piping function 
                  group_by(book) %>%
                mutate(linenumber=row_number(),
             chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",ignore_case = TRUE)))) %>%
             ungroup() %>% 
             unnest_tokens(word, text)


head(tidy_data,10)

#NLP WORK
positive_sent <- get_sentiments("bing") %>%
  filter(sentiment == "positive")

tidy_data %>%
  filter(book == "Emma") %>%
  semi_join(positive_sent) %>%
  count(word, sort=TRUE)

library(tidyr)
bing <- get_sentiments("bing")
Emma_sentiment <- tidy_data %>%
  inner_join(bing) %>% 
  count(book = "Emma", index=linenumber %/% 80, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) #total sentiment of the book


#words and their +ve / -ve score
library(ggplot2)

ggplot(Emma_sentiment, aes(index, sentiment, fill=book)) +
  geom_bar(stat= "identity" , show.legend = TRUE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")


#common positive and negative words
counting_words <- tidy_data %>%
  inner_join(bing) %>% count(word, sentiment, sort =TRUE)

head(counting_words)





#plotting of sentiment score

counting_words %>%
  filter(n >120) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n))  %>%
  ggplot(aes(word,n, fill = sentiment)) +
  geom_col() +
  coord_flip()  +
  labs(y = "Sentiment Score")



#WordCloud

library(reshape2)
library(wordcloud)

tidy_data %>%
  inner_join(bing) %>% 
  count(word, sentiment, sort = TRUE) %>% 
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("red", "blue"), max.words = 120)


#now its your turn build for Sense & Sensibility book same visual and analytical solution
#bye
















































