question2 <- function(){
    ibrary("sqldf")
    acs <- read.csv("getdata_data_ss06pid.csv")
    sqldf("select pwgtp1 from acs where AGEP < 50")
    length(unique(acs$AGEP))
    sqldf("select distinct AGEP from acs")
}

# question 4
question4 <- function() {
    library("XML")
    url <- "http://biostat.jhsph.edu/~jleek/contact.html"
    doc <- htmlTreeParse(url, useInternalNodes=TRUE)
    rootNode <- xmlRoot(doc)
}


question5 <- function() {
    file <- "getdata_wksst8110.for"
    x <- read.fwf(
        file,
        skip=4,
        widths=c(12, 7,4, 9,4, 9,4, 9,4))
    print(">head(data):")
    print(head(x))
    r <- sum(x[,4])
    print(sprintf("Sum of column #4: %f", r))
    r
}

