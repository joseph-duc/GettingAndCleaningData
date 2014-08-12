question2 <- function(){
    library("sqldf")
    acs <- read.csv("getdata_data_ss06pid.csv")
    sqldf("select pwgtp1 from acs where AGEP < 50")
    length(unique(acs$AGEP))
    sqldf("select distinct AGEP from acs")
}

question3 <- function(){
    library("sqldf")
    acs <- read.csv("getdata_data_ss06pid.csv")
    sqldf("select pwgtp1 from acs where AGEP < 50")
    #length(unique(acs$AGEP))
    #length(sqldf("select distinct AGEP from acs"))
    expectation <- unique(acs$AGEP)
    try1 <- sqldf("select distinct AGEP from acs")
    # compare
    identical(expectation, try1)
    
}

# question 4
question4 <- function() {
    library("XML")
    urlFile <- "http://biostat.jhsph.edu/~jleek/contact.html"
    r.page <- readLines(urlFile)
    c(nchar(r.page[10]), nchar(r.page[20]), nchar(r.page[30]), nchar(r.page[100]))
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

