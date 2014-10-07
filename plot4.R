# 1 Read data
## Since the original data "household_power_consumption.txt" is a huge dataset, it is first viewed in Notepad++ to find out the rows of interest (dates from 2007-02-01 to 2007-02-02), and only these rows are read with the read.table function and its skip and nrows arguments. 

data=read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880,na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 2 Paste Date and Time variables into one variable called DateTime, and convert it to Date/Time class
data$DateTime=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# 3 Use par() to set a layout with two rows and two columns, plot, and save to a PNG file
png("plot4.png",480,480)
par(mfrow=c(2,2))
with(data,{
	plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
	plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")
	plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(DateTime,Sub_metering_2,col="red")
	lines(DateTime,Sub_metering_3,col="blue")
	legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
	plot (DateTime,Global_reactive_power,type="l",xlab="datetime")
})
dev.off()
