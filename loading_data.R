#LOADING LIBRARIES
library(dplyr)

#CREATING FOLDERS
if(!file.exists("./data")) {
        dir.create("./data")
}

#READING DATA FROM WEB
linkURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(linkURL, destfile = "./data/EPC.zip")
rm(linkURL)
unzip(zipfile = "./data/EPC.zip", exdir = "./data")
file.remove("./data/EPC.zip")
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
#file.remove("./data/household_power_consumption.txt") #or .gitignore! FIRSTLY.

#SUBSETING
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
df <- subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rm(hpc)

#MODIFING BASE
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Date_Time <- as.POSIXct(paste(df$Date, df$Time), 
                           format = "%Y-%m-%d %H:%M:%S")