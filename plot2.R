#Peer_assignment week1 - Plot2

#unzip downloaded file
zipF <- paste("./exdata_data_household_power_consumption.zip")
unzip(zipF)

#load data and format date column
d <- read.table("household_power_consumption.txt", header = TRUE, sep =";")

#format Date column
library(lubridate)
d$Date <- dmy(d$Date)

#subset rows of interest
library(dplyr)
df <- filter(d, Date == "2007-02-01" | Date == "2007-02-02")

#combine date and time columns for x-axis
df$Date_Time <- ymd_hms(paste(df$Date, df$Time))


#transform global_active_power to numeric values
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))


#Export
png("plot2.png", height=480, width=480, units="px", bg = "transparent")

with(df, plot(Date_Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type = "n"))
lines(df$Date_Time, df$Global_active_power)

dev.off()


