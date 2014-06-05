data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

subsetrow <- data[c(66637:69516), ] 

globalactivepower <- subsetrow[ ,3]  
globalactivepower <- as.character(globalactivepower)
globalactivepower <- as.numeric(globalactivepower)

hist(globalactivepower, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file = "plot1.png")
dev.off()



