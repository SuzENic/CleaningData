
### 1
acs <- read.csv("ACS_Idaho.csv")
splitNmanes = strsplit(names(acs), "wgtp")
splitNmanes[123]
# space 15


### 2
gdp <- read.csv("GDP_A.csv")
values <- as.numeric(gsub(",","",gdp[, 5]))
mean(values[1:197], na.rm = TRUE)
#377652.4

### 3
#grep("^United",countryNames), 3

###4
gdp <- read.csv("GDP_B.csv")
fed <- read.csv("FED_STATS.csv")

#just to try# 7, 13

### 5 
#250, 47