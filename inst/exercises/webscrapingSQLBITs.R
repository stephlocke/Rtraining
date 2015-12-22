library(magrittr)
library(rvest)
library(data.table)
library(stringr)
library(plyr)

# All (accepted) submitted sessions
allsubmissions <- html("https://sqlbits.com/information/PublicSessions.aspx") %>% 
  html_node(".session") %>% 
  html_table() %>% 
  extract2(1) %>% 
  data.table(raw = .)

dataclean <- function(x) {
  # Changes datatype, trims excess whitespace, and puts any carriage returns as spaces in the abstracts
  str_replace_all(str_trim(unlist(x)), "\r\n", " ")
}

allsubmissions[
  , `:=`(split = str_split(raw, pattern = "\r\n     "))][
    , `:=`(SessionLevel = dataclean(pluck(split, 1))
           , SessionTrack = dataclean(pluck(split,4))
           , SessionTitle = dataclean(pluck(split, 8))
           , SessionSpeaker = dataclean(pluck(split, 17))
           , SessionAbstract = dataclean(pluck(split, 20))
    )]

desiredcols <- c("SessionLevel", "SessionTrack", "SessionTitle", "SessionSpeaker", "SessionAbstract")

allsubmissions <- allsubmissions[, desiredcols, with = FALSE]

# All selected sessions
getsessions <- function(url) {
  html(url) %>% 
    html_nodes(".AgendaSession") %>% 
    html_table(fill = TRUE) %>% 
    rbind.fill %>% 
    data.table
}

days <- 20150304:20150307
urls <- paste0("https://sqlbits.com/information/event14/Agenda.aspx?", days)

selectedsessions <- lapply(urls, getsessions) %>% 
  rbind.fill %>% 
  data.table

nonsessiontitles <- "Registration|Keynote|DitBits|Lunch|Break|Prize-Giving|End of Day"

# http://txt2re.com/
timeregex <- "((?:(?:[0-1][0-9])|(?:[2][0-3])|(?:[0-9])):(?:[0-5][0-9])(?::[0-5][0-9])?(?:\\s?(?:am|AM|pm|PM))?)"
timerow <- paste0(timeregex, "(.)", timeregex)

selectedsessions <- selectedsessions[(str_detect(X1, nonsessiontitles) | str_detect(X1, timerow)) == FALSE][
  , `:=`(ID = .I
         , Pair = (.I -  1)%/%2)]

setkey(selectedsessions, Pair)

selectedsessions.titles <- selectedsessions[ID%%2 == 1]
selectedsessions.speakers <- selectedsessions[ID%%2 == 0]

selectedsessions <- selectedsessions.titles[selectedsessions.speakers,
                                            .(SessionTitle = X1,
                                              SessionSpeaker = i.X1, 
                                              SessionLevel = i.X2)]

# Joining the data
setkey(allsubmissions, SessionTitle, SessionSpeaker)
setkey(selectedsessions, SessionTitle, SessionSpeaker)
# removes multiple instances for pre-cons etc
selectedsessions <- unique(selectedsessions)

finaldataset <- selectedsessions[allsubmissions]

sessionswithoutsubmissions <- allsubmissions[selectedsessions][is.na(SessionTrack)] 