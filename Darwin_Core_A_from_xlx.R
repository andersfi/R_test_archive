#############################################
#
# testscript
#
#############################################

setwd("C:\\iSkya\\jottacload\\Jottacloud\\FISKETUR\\GAMLE PROSJEKTER\\BJØRNØYA\\produksjons_2015\\Data\\DC")


library(xlsx) # see https://code.google.com/p/rexcel/ for documentation
occurence <- read.xlsx2("raw_testfishing_Bearisland.xls",sheetName="ocurence_and_measurments")
event <- read.xlsx2("raw_testfishing_Bearisland.xls",sheetName="event")
head(event)
head(occurence)

occurence_to_match_event <- occurence[c("occurrenceID","locationID","waterBody","recordNumber","",
                                        "date","day","month","year","sex","reproductiveCondition",
                                        "lifeStage","samplingProtocol")]
eventID_match_to_occurence <- event[c("eventID","waterBody","day","month","year","samplingProtocol")]
head(eventID_match_to_occurence)



occurence_core <- merge(occurence,eventID_match_to_occurence,all=T)
head(occurence_core)