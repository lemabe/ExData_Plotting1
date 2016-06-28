# read the file into R with read.table()
pwr_cons <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# set the library to be use.
library(dplyr)
library(lubridate)

# make the variable date readable by r.
pwr_cons <- mutate(pwr_cons, Date = as.Date(Date))

# subset the rows containing the first date: "01-02-2007".
pwr_cons2 <- filter(pwr_cons, Date == as.Date("01-02-2007"))

# subset the rows containing the first date: "02-02-2007".
pwr_cons3 <- filter(pwr_cons, Date == as.Date("02-02-2007"))

# merge the two subsets.
pwr_cons4 <- merge(pwr_cons2, pwr_cons3, all = TRUE)

# mutate all variable to be more usable
pwr_cons4 <- mutate(pwr_cons4, Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))), 
                    Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                    Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

# creating plot
with(pwr_cons4, plot(Date,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(pwr_cons4, points(Date,Sub_metering_1, col="black", type="l"))
with(pwr_cons4, points(Date,Sub_metering_2, col="red", type="l"))
with(pwr_cons4, points(Date,Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))