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

#Plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(df$Date_Time, df$Global_active_power, type="l",
     ylab="Global Active Power", 
     xlab="")

plot(df$Date_Time, df$Voltage, type="l",
     ylab="Global Active Power", 
     xlab="datetime")

plot(df$Date_Time, df$Sub_metering_1, type="l", col = "black",
     ylab="Energy Submetering", 
     xlab="")
lines(df$Date_Time, df$Sub_metering_2, type="l", col = "red")
lines(df$Date_Time, df$Sub_metering_3, type="l", col = "blue")
legend("topright", 
       legend = colnames(df[,7:9]), 
       lty=1,
       col = c("black", "red", "blue"),
       fill = "white",
       border = "transparent")

plot(df$Date_Time, df$Global_reactive_power, type="l",
     ylab="Global_reactive_power", 
     xlab="datetime")
dev.off()