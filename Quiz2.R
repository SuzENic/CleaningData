Quiz2 <- function() {
#    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile= "acs.csv", method = "curl")
    acs <- read.csv("acs.csv")

#> options(gsubfn.engine = "R")
#> library(sqldf)

#doc.html = htmlTreeParse("http://biostat.jhsph.edu/~jleek/contact.html",useInternal = TRUE)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode = readLines(con)
nchar(htmlcode[10])
close(con)

con = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
fixed <- read.fwf(con, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4), skip = 4)
close(con)
}