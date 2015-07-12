
### Load the data
household_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE, as.is = TRUE)
filtered_data <- household_data[ (household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007"),]

### Convert characters to numeric values

filtered_data [,3:9] <- sapply(filtered_data[,3:9],as.numeric)



### Convert date and time fields to date/Time classes in R

filtered_data$Date_Time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
filtered_data[,c("Date")] <- as.Date(filtered_data[,c("Date")],format="%d/%m/%Y")

#### Construct the plot - Global Active Power

### Select dataset for plotting

plot_data <- filtered_data[,7:10]

### Initialize the graphic device

png(file = "plot3.png")

### Initialize and annotate the plot

plot(plot_data$Date_Time,plot_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(plot_data$Date_Time, plot_data$Sub_metering_2, type = "l", col = "red")
lines(plot_data$Date_Time, plot_data$Sub_metering_3, type = "l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(plot_data[1:3]))

### Close png device

dev.off()
