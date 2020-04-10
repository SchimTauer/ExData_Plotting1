#Peer_assignment week1 - Plot4

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


#transform Sub_metering columns to numeric values
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))


#Export
png("plot4.png", height=480, width=480, units="px", bg = "transparent")

#set plotting area
par(mfrow=c(2,2)) #plots per row (plots are filled row wise)

#plot 1
with(df, plot(Date_Time, Global_active_power, ylab = "Global Active Power", xlab = "", type = "n"))
lines(df$Date_Time, df$Global_active_power)

#plot 2
with(df, plot(Date_Time, Voltage, type = "n"))
lines(df$Date_Time, df$Voltage)

#plot 3
with(df, plot(Date_Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
lines(df$Date_Time, df$Sub_metering_1)
lines(df$Date_Time, df$Sub_metering_2, col = "red")
lines(df$Date_Time, df$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, box.lty=0)

#plot 4
with(df, plot(Date_Time, Global_reactive_power, type = "n"))
lines(df$Date_Time, df$Global_reactive_power)

dev.off()


