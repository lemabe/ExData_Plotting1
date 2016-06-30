# read the file into R with read.table()
pwr_cons <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# set the library to be use.
library(dplyr)

# subset the rows containing the two dates.
pwr_cons2 <- pwr_cons[pwr_cons$Date %in% c("1/2/2007","2/2/2007"),]

# replace the variable Global_active_power with as.character.
pwr_cons2 <- mutate(pwr_cons2, Global_active_power = as.numeric(as.character(Global_active_power)))

# create the first plot an histogram.
hist(pwr_cons2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power", col = "red")

# put the graphic into a png file
dev.copy(png, file = "plot1.png")
dev.off()
