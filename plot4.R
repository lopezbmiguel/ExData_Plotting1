
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

plot_data <- filtered_data[,c(3:5, 7:10)]

### Initialize the graphic device

png(file = "plot4.png")

#### Setup grid
par(mfrow = c(2,2))

### Initialize and annotate the plot 1

plot(plot_data$Date_Time,plot_data$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")


### Initialize and annotate the plot 2

plot(plot_data$Date_Time,plot_data$Voltage, type="l", ylab = "Voltage", xlab = "datetime")


### Initialize and annotate the plot 3

plot(plot_data$Date_Time,plot_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(plot_data$Date_Time, plot_data$Sub_metering_2, type = "l", col = "red")
lines(plot_data$Date_Time, plot_data$Sub_metering_3, type = "l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(plot_data[4:6]), cex = 0.7)

### Initialize and annotate the plot 4

plot(plot_data$Date_Time,plot_data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")


### Close png device

dev.off()
