if (!file.exists("./household_power_consumption.zip")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, "./household_power_consumption.zip", method = "curl")   
}

df <- read.table(unz("./household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=';')

newData1 <- as.character(df$Date)
df$newdate <- strptime(newData1, "%d/%m/%Y")
df$Date <- df$newdate
dat4 <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]

hist(as.numeric(as.character(dat4$Global_active_power)), col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "./plot1.png", width = 480, height = 480)
dev.off()