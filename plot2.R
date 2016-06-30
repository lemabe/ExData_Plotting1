# read the file into R with read.table()
pwr_cons <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# set the library to be use.
library(dplyr)
library(lubridate)

# subset the rows containing the two date: "01-02-2007".
pwr_cons2 <- pwr_cons[pwr_cons$Date %in% c("1/2/2007","2/2/2007"),]

# replace the variable Global_active_power with as.character.

pwr_cons2 <- mutate(pwr_cons2, Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))), Global_active_power = as.numeric(as.character(Global_active_power))) 

# plot the two variables
with(pwr_cons2, plot(Date,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# put the graphic into a png file
dev.copy(png, file = "plot2.png")
dev.off()