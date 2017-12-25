Quiz1 <- function() {
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile= "microdata.csv", method = "curl")
      MyData <- read.csv("microdata.csv")
      million <- ((MyData$VAL >=24) & (!is.na(MyData$VAL)))
      sum(million)

      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile= "Gas.xlsx", method = "curl")
      GasData <- read.xlsx("Gas.xlsx", sheetIndex = 1, header = TRUE)
      dat <- read.xlsx("Gas.xlsx", sheetIndex = 1, header = TRUE, startRow = 18, endRow = 23)
      sum(dat$Zip*dat$Ext,na.rm=T)

      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile= "restaurants.xml", method = "curl")
      doc <- xmlTreeParse("restaurants.xml", useInternal = TRUE)
      rootNode <- xmlRoot(doc)
      xpathSApply(rootNode, "//zipcode", xmlValue)
      zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
      wh <- (zips == "21231")
      sum(wh)      

      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile= "microdata2.xlsx", method = "curl")
}