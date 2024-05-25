hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
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
#Plot1
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, 
     breaks = 15,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()