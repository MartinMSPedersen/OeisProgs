raw_path <- "."

filenames <- dir(path = raw_path, pattern = "b[0-9]+.txt", full.names = T)
for (aFile in filenames) {
	f <- file(aFile, "rb")
	seek(f,file.size(aFile)-1)
	if (readBin(f,"raw",1) != "0a") {
		cat(aFile,"\n")
	}
	close(f)
}

