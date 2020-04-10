#Peer_assignment week1 - Plot1

#unzip downloaded file
zipF <- paste("./exdata_data_household_power_consumption.zip")
unzip(zipF)

#load data and format date column
d <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
d$Date <- as.Date(d$Date, "%d/%m/%Y")

#subset rows of interest
library(dplyr)
df <- filter(d, Date == "2007-02-02" | Date == "2007-02-01")

#transform global_active_power to numeric values
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

#Export
png("plot1.png", height=480, width=480, units="px", bg = "transparent")
with(df, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
              col = "red", ylim = c(0,1200)))
dev.off()


