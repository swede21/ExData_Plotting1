data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

subsetrow <- data[c(66637:69516), ]  

globalactivepower <- subsetrow[ ,3]  

globalactivepower <- as.character(globalactivepower)
globalactivepower <- as.numeric(globalactivepower)

date <- subsetrow[ ,1]
time <- subsetrow[ ,2]

date <- as.character(date)
time <- as.character(time)

datestring <- paste(date,time)
datestring_final <- strptime(datestring, "%e/%m/%Y %T")

submet1 <- subsetrow[ ,7]
submet1 <- as.character(submet1)
submet1 <- as.numeric(submet1)

submet2 <- subsetrow[ ,8]
submet2 <- as.character(submet2)
submet2 <- as.numeric(submet2)

submet3 <- subsetrow[ ,9]
submet3 <- as.character(submet3)
submet3 <- as.numeric(submet3)

voltage <- subsetrow[ ,5]
voltage <- as.character(voltage)
voltage <- as.numeric(voltage)

globalreactivepower <- subsetrow[ ,4]
globalreactivepower <- as.character(globalreactivepower)
globalreactivepower <- as.numeric(globalreactivepower)

par(mfcol = c(2,2))

plot(datestring_final, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power")

plot(datestring_final, submet1, type = "l", ylab = "Energy sub metering", xlab = "") 
points(datestring_final, submet2, col = "red", type = "l")
points(datestring_final, submet3, col = "blue", type = "l")


legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(datestring_final, voltage, type = "l", ylab = "Voltage" ,xlab = "datetime")

plot(datestring_final, globalreactivepower, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png")
dev.off()



