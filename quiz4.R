library("data.table")

quiz4.q1 <- function() {
    
    #     Question 1
    #     The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
    #     
    #     and load the data into R. The code book, describing the variable names is here:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    #     
    #     Apply strsplit() to split all the names of the data frame on the characters "wgtp". What is the value of the 123 element of the resulting list?
    #     "wgt" "15"
    #     "w" "15"
    #     "wgtp"
    #     "" "15"
    #     
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    f <- file.path(getwd(), "download.csv")
    download.file(url, f)
    data <- data.table(read.csv(f))
    file.remove(f)
    x <- strsplit(names(data), "wgtp")
    x[123]

}

quiz4.q2 <- function() {
    
    #     Question 2
    #     Load the Gross Domestic Product data for the 190 ranked countries in this data set:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
    #     
    #     Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
    #     
    #     Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
    #     387854.4
    #     381668.9
    #     377652.4
    #     293700.3
    #     
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    f <- file.path(getwd(), "GDP.csv")
    download.file(url, f)
    data <- data.table(read.csv(f, skip=4, nrows=190, stringsAsFactors=FALSE))
    file.remove(f)
    setnames(data, colnames(data), c("abr", "rank", "X", "Country", "GDP", paste("C",6:10,sep='')))
    # Extract GDP column and remove comma characters off. Assign output to GDP vector
    GDP <- as.numeric(gsub(",", "", data$GDP))
    mean(GDP)

}

quiz4.q4 <- function() {
    
    #     Question 4
    #     Load the Gross Domestic Product data for the 190 ranked countries in this data set:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
    #     
    #     Load the educational data from this data set:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
    #     
    #     Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June?
    #     
    #     Original data sources:
    #         http://data.worldbank.org/data-catalog/GDP-ranking-table
    #     http://data.worldbank.org/data-catalog/ed-stats
    #     7
    #     15
    #     8
    #     13
    #     
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    f <- file.path(getwd(), "GDP.csv")
    download.file(url, f)
    data <- data.table(read.csv(f, skip=4, nrows=190, stringsAsFactors=FALSE))
    file.remove(f)
    setnames(data, colnames(data), c("CountryCode", "rank", "X", "Country", "GDP", paste("C",6:10,sep='')))
    
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    f <- file.path(getwd(), "edu.csv")
    download.file(url, f)
    eduData <- data.table(read.csv(f))
    file.remove(f)
    # merge base on the same column name: Country code
    dt <- merge(data, eduData, all=TRUE, by=c("CountryCode"))
    endFY <- grepl("Fiscal year end: June", dt$Special.Notes)
    dt[endFY]
}

# install.packages("quantmod")
library(quantmod)
quiz4.q5 <- function() {
    #     You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price and get the times the data was sampled.
    # 
    # library(quantmod)
    # amzn = getSymbols("AMZN",auto.assign=FALSE)
    # sampleTimes = index(amzn) 
    # 
    # How many values were collected in 2012? How many values were collected on Mondays in 2012?
    # 252, 47
    # 251, 47
    # 252, 50
    # 250, 47
    amzn = getSymbols("AMZN",auto.assign=FALSE)
    sampleTimes = index(amzn)
    nobs <- length(sampleTimes[grepl("2012",sampleTimes)])
    x <- weekdays(sampleTimes[grepl("2012",sampleTimes)])
    nobsMon <- length(x[grepl("Monday", x)])
    c(nobs, nobsMon)
}