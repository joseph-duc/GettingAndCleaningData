# install.packages("data.table")
library("data.table")

quiz3.read.urlcsv <- function(url) {
    f <- file.path(getwd(), "download.csv")
    download.file(url, f)
    data <- data.table(read.csv(f))
    file.remove(f)
    data
}
quiz3.q1 <- function() {
    # 
    # Question 1
    # The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
    #     
    #     https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
    # 
    # and load the data into R. The code book, describing the variable names is here:
    #     
    #     https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    # 
    # Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?
    # 59, 460, 474
    # 153 ,236, 388
    # 236, 238, 262
    # 125, 238,262
    
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    #     f <- file.path(getwd(), "quiz3_ss06hid.csv")
    #     download.file(url, f)
    #     data <- data.table(read.csv(f))
    data <- quiz3.read.urlcsv(url)
    agricultureLogical <- which(data$ACR == 3 & data$AGS == 6)
    agricultureLogical[c(1,2,3)]

}

# install.packages("jpeg")
library("jpeg")
quiz3.q2 <- function() {
    
    #     Question 2
    #     Using the jpeg package read in the following picture of your instructor into R
    #     
    #     https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
    #     
    #     Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)
    #     -15259150 -10575416
    #     10904118 -594524
    #     -15259150 -594524
    #     -10904118 -10575416
    #   
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    z <- tempfile()
    download.file(url,z,mode="wb")
    pic <- readJPEG(z, native=TRUE)
    file.remove(z) # cleanup
    quantile(pic, c(0.3, 0.8))

}

quiz3.q3 <- function() {
    
    #     Question 3
    #     Load the Gross Domestic Product data for the 190 ranked countries in this data set:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
    #     
    #     Load the educational data from this data set:
    #         
    #         https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
    #     
    #     Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
    #     
    #     Original data sources:
    #         http://data.worldbank.org/data-catalog/GDP-ranking-table
    #     http://data.worldbank.org/data-catalog/ed-stats
    #     234, St. Kitts and Nevis
    #     190, St. Kitts and Nevis
    #     189, Spain
    #     189, St. Kitts and Nevis
    #     190, Spain
    #     234, Spain
    urlGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    f <- file.path(getwd(), "download.csv")
    download.file(urlGDP, f)
    data <- data.table(read.csv(f, skire))
    file.remove(f)
    dataGDP <- read.table("getdata-data-GDP.csv", sep = ",", nrows = 190, skip = 5)
    
    urlEdu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    dataEdu <- quiz3.read.urlcsv(urlEdu)
    
}

quiz3.q4 <- function() {
    
    #     Question 4
    #     What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
    #     23, 45
    #     133.72973, 32.96667
    #     23.966667, 30.91304
    #     23, 30
    #     30, 37
    #     32.96667, 91.91304
    
}

quiz3.q5 <- function() {
    
    #     Question 5
    #     Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?
    #     18
    #     5
    #     0
    #     13
    
}