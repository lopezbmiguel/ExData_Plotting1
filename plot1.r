
### Load the data
household_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE, as.is = TRUE)
filtered_data <- household_data[ (household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007"),]

### Convert characters to numeric values

filtered_data [,3:9] <- sapply(filtered_data[,3:9],as.numeric)



### Convert date and time fields to date/Time classes in R

filtered_data$Date_Time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
filtered_data[,c("Date")] <- as.Date(filtered_data[,c("Date")],format="%d/%m/%Y")

#### Construct the plot - Global Active Power

### Filter out NAs and select dataset for plotting

plot_data <- filtered_data[!filtered_data$Global_active_power=="?",c("Global_active_power")]


### Initialize the graphic device

png(file = "plot1.png")

### Initialize and annotate the plot

hist(plot_data, col="red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")

### Close png device

dev.off()

