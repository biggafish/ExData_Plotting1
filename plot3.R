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
png(filename = "plot3.png")


##plot 
with(hpc,plot(Time,Global_active_power,
              type="n",
              xlab="",
              ylab="Energy sub metering",
              ylim=c(0,50)
              )
     )

with(hpc,lines(Time,Sub_metering_1))
with(hpc,lines(Time,Sub_metering_2,col="red"))
with(hpc,lines(Time,Sub_metering_3,col="blue"))
legend("topright", legend= c("sub_metering_1","sub_metering_2","sub_metering_3"))
##close device
dev.off()
