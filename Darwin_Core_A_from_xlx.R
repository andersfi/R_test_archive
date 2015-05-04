#############################################
#
# testscript
#
#############################################

setwd("C:\\iSkya\\jottacload\\Jottacloud\\FISKETUR\\GAMLE PROSJEKTER\\bjornoya\\produksjons_2015\\Data\\DC")


library(xlsx) # see https://code.google.com/p/rexcel/ for documentation
occurence <- read.xlsx2("raw_testfishing_Bearisland.xls",sheetName="ocurence_and_measurments")
event <- read.xlsx2("raw_testfishing_Bearisland.xls",sheetName="event")
location <- read.xlsx2("raw_testfishing_Bearisland.xls",sheetName="location")
head(event)
head(occurence)
head(location)

occurence_to_match_event <- occurence[c("occurrenceID",
                                        # mandatory terms in occurence core##
                                        "institutionCode","collectionCode","catalogNumber",
                                        "basisOfRecord","scientificName",
                                        # taxa information##
                                        "scientificNameID","kingdom","phylum", 
                                        "class","order","family","genus",  
                                        # information to match with event##
                                        "locationID","waterBody","year","month",
                                        "day","samplingProtocol",
                                        # information about individuals for occurence core
                                        "sex","reproductiveCondition","lifeStage","age")]

event_match_to_occurence <- event[c("eventID",
                                      # terms to matched to occurence##
                                    "locationID","day","month","year","samplingProtocol",
                                      # event specific terms (sampling event information)
                                      "samplingEffort","sampleSizeValue")]
location_match_to_occurence <- location[c("locationID",
                                      # location specific terms (sampling event information)
                                      "decimalLatitude", "decimalLongitude","geodeticDatum",
                                      "georeferenceRemarks","locationRemarks")]

to_measurments_and_facts <- occurence[c("occurrenceID","totalLength","weigth")]

# merge to occurence and event  
occurence_core_temp <- merge(occurence_to_match_event,event_match_to_occurence)
occurence_core <- merge(occurence_core_temp,location_match_to_occurence)

# write occurence core file as csv
write.table(occurence_core,"occurence_core.txt",sep=";")

occurence_core[1234,]



dim(occurence_core)
occurence_to_match_event$occurrenceID %in% occurence_core_temp$occurrenceID













