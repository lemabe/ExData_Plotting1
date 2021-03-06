# read the file into R with read.table()
pwr_cons <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# set the library to be use.
library(dplyr)
library(lubridate)

# subset the rows containing the two dates.
pwr_cons2 <- pwr_cons[pwr_cons$Date %in% c("1/2/2007","2/2/2007"),]

# mutate all variable to be more usable
pwr_cons2 <- mutate(pwr_cons2, Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))), 
                    Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                    Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

# creating plot
with(pwr_cons2, plot(Date,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(pwr_cons2, points(Date,Sub_metering_1, col="black", type="l"))
with(pwr_cons2, points(Date,Sub_metering_2, col="red", type="l"))
with(pwr_cons2, points(Date,Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

# put the graphic into a png file
dev.copy(png, file = "plot3.png")
dev.off()