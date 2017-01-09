##import consumption data into R
hpc<-read.table("household_power_consumption.txt",
                sep=";",
                header=TRUE,
                na.strings = "?",
                stringsAsFactors = F,
                colClasses = c(NA,NA,rep("numeric",7)))

##filter only the rows that are for 01/02/2007 & 02/02/2007,
hpc<-hpc[66637:69516,]

## convert first 2 columns into dates and times
hpc$Time<-strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,format = "%d/%m/%Y")

## open PNG device for writing
png(filename = "plot1.png")

##plot histogram
hist(as.numeric(hpc$Global_active_power), 
     col="red",
     main = "Global Active Power",
     xlim = c(0,6),
     ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)",)

##close device
dev.off()