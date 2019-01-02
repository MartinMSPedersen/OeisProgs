library(readr)
library(tidyverse)
library(magrittr)
library(reshape2)

# synthesized <- function(f) {
#   grepl("(b-file synthesized from sequence entry)",readLines(f,1),fixed = TRUE)
# }
#
# A <- read.table("~/oeis/afiles/stripped", quote="\"", stringsAsFactors=FALSE)
# names(A) <- c("id","avalues")
#
# A %<>%
#   mutate(acount = str_count(.$avalues,",") - 1) %>%
#   mutate(id = substring(.$id,2,7)) %>%
#   glimpse
#
# save(A,file = "anumbers.Rda")
#
# load("anumbers.Rda")
#
setwd("~/oeis/bfiles/")
#
# B <- data.frame(id = character(0),
#                 bvalues = character(0),
#                 synthesized = logical(0),
#                 stringsAsFactors = FALSE)
# for (bfile in list.files(pattern = "b[0-9]{6}\\.txt")) {
#   bnum <- substring(bfile,2,7)
#   if (synthesized(bfile)) {
#     B <- rbind(B,data.frame(id = bnum, bvalues = NA, synthesized = TRUE,
#                             stringsAsFactors = FALSE))
#   } else {
#     B <- rbind(B,data.frame(id = bnum, bvalues = NA, synthesized = FALSE,
#                             stringsAsFactors = FALSE))
#   }
# }
#
# B$id <- as.character(B$id)
# save(B,file = "bnumbers.Rda")
# C <- left_join(A,B,"id")
#save(A,B,C,file = "numbers.Rda")

getBvalues <- function(id, howmany) {
  fname <- paste0("b",id,".txt")
  message(fname)
  paste0(",",paste0(sub(".* ","",readLines(fname,howmany)),",", collapse=""))
}

#load("numbers.Rda")
#save(C, file = "cnumbers.Rda")
load("cnumbers.Rda")
for (aid in C[C$synthesized == FALSE & is.na(C$bvalues),]$id) {
#for (aid in head(C[C$synthesized == FALSE & is.na(C$bvalues),]$id,50000)) {
  b <- getBvalues(aid,C[C$id == aid,]$acount)
  #print(b)
  C[which(C$id == aid),]$bvalues <- b

}
save(C,file = "cnumbers.Rda")
