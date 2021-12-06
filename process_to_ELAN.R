
# Dependencies ------------------------------------------------------------

library(udpipe)
library(jsonlite)

# Your path ---------------------

files <- list.files(path="~YOURPATH/", pattern="*.json", full.names=TRUE, recursive=FALSE)

# The code ------------

# First part: it will get a file with time aligned words and speaker attribution

for (i in 1:length(files)) {
  result <- jsonlite::fromJSON(txt=files[i],flatten = TRUE)
  words<- result$results$items
  words <- words%>% unnest_wider(alternatives)
  wordsexport <- result$results$speaker_labels$segments$items
  wordsexport <- bind_rows(wordsexport)
  wordsexport <- words %>% left_join(wordsexport, by=c("start_time","end_time")) # load file
 
  # You can uncomment these lines below if you have
  # load Udpipe library in order to get POS tags. You will need a specific udmodel file to your language.
  
  # UNCOMMENT
  
  # wordsexport <- wordsexport%>%mutate(w_id = row_number())
  # wordsexport_tag <- 
  #   udpipe_annotate(
  #     udmodel_spanish,
  #     x = wordsexport$content,
  #     tokenizer = "vertical",
  #     tagger = "default",
  #     parser = "none",
  #     doc_id = wordsexport$w_id
  #   )
  # wordsexport_tag <- as.data.frame(wordsexport_tag) %>% select(doc_id,lemma,upos)
  # wordsexport_tag$w_id <- as.integer(wordsexport_tag$doc_id)
  # wordsexport <- wordsexport%>% left_join(wordsexport_tag,by = "w_id")
  # wordsexport <- wordsexport%>% left_join(tag_treetagger%>%select(w_id,pos,lemma),by = "w_id")

    write.csv2(wordsexport, file=paste(result$jobName,"_words.txt",sep = ""),quote = FALSE)
}

# Second part: it will get a file with time aligned segments (intonational phrases) and speaker attribution

for(i in 1:length(files)){
  result <- jsonlite::fromJSON(txt=files[i],flatten = TRUE)
  words<- result$results$items
  words <- words%>% unnest_wider(alternatives)
  wordsexport <- result$results$speaker_labels$segments$items
  wordsexport <- bind_rows(wordsexport)
  wordsexport <- words %>% left_join(wordsexport, by=c("start_time","end_time")) # load file
  segments <- result$results$speaker_labels$segments
segments <- segments%>% mutate(id = paste(speaker_label,"_",row_number(), sep = ""))
segments <- segments%>% rename(
  
  begin = start_time,
  end = end_time,
  sp = speaker_label
  
)
segments <- segments%>%unnest(items)
segments <- segments %>% left_join(wordsexport, by=c("speaker_label","start_time"))
segments2 <- segments %>%
  group_by(id) %>%
  summarise(tier = max(speaker_label),begin = max(begin), end = max(end), text=paste(content,collapse=' '))
write.csv2(segments2, file=paste(result$jobName,"_segments.txt",sep = ""),quote = FALSE)}
