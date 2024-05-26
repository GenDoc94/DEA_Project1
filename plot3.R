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
Sys.setlocale("LC_TIME", "en_US.UTF-8")
df$Date_Time <- as.POSIXct(paste(df$Date, df$Time), 
                           format = "%Y-%m-%d %H:%M:%S")

#Plot3
png("plot3.png", width=480, height=480)
plot(df$Date_Time, df$Sub_metering_1, type="l", col = "black",
     ylab="Energy Submetering", 
     xlab="")
lines(df$Date_Time, df$Sub_metering_2, type="l", col = "red")
lines(df$Date_Time, df$Sub_metering_3, type="l", col = "blue")
legend("topright", 
       legend = colnames(df[,7:9]), 
       lty=1,
       col = c("black", "red", "blue"))
dev.off()