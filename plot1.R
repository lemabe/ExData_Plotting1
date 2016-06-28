# read the file into R with read.table()
pwr_cons <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# set the library to be use.
library(dplyr)

# make the variable date readable by r.
pwr_cons <- mutate(pwr_cons, Date = as.Date(Date))

# subset the rows containing the first date: "01-02-2007".
pwr_cons2 <- filter(pwr_cons, Date == as.Date("01-02-2007"))

# subset the rows containing the first date: "02-02-2007".
pwr_cons3 <- filter(pwr_cons, Date == as.Date("02-02-2007"))

# merge the two subsets.
pwr_cons4 <- merge(pwr_cons2, pwr_cons3, all = TRUE)

# replace the variable Global_active_power with as.character.
pwr_cons4 <- mutate(pwr_cons4, Global_active_power = as.numeric(as.character(Global_active_power)))

# create the first plot an histogram.
hist(pwr_cons4$Global_active_power, main = "Global Active Power", xlab = "Global Active Power", col = "red")


