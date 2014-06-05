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

plot(datestring_final, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png")
dev.off()



