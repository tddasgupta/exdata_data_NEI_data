## Libraries needed: no special libraries needed for this part
library(ggplot2)
library(plyr)

#Change working directory & ensure the file "summarySCC_PM25.rds" is there.
setwd("C:\\Users\\Tushar Dasgupta\\Desktop\\Coursera\\Explanatory Data Analy\\exdata_data_NEI_data")
#Read the rds data for PM2.5 Emissions Data
NEI <- readRDS("summarySCC_PM25.rds")
#Read the rds data for Source Classification Code Table
SCC <- readRDS("Source_Classification_Code.rds")
## Step 2: subset our data
baltimore <- subset (NEI, fips == "24510")
typePM25.year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

## Rename the col: Emissions
colnames(typePM25.year)[3] <- "Emissions"

##prepare to plot to png
png("plot3.png") 
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()
##prepare to plot to markdown
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))  