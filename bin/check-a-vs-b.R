afile <- "~/oeis/afiles/stripped"
afile <- readLines(afile)
afile <- afile[grep("^A",afile)]
