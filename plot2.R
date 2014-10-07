# 1 Read data
## Since the original data "household_power_consumption.txt" is a huge dataset, it is first viewed in Notepad++ to find out the rows of interest (dates from 2007-02-01 to 2007-02-02), and only these rows are read with the read.table function and its skip and nrows arguments. 

data=read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880,na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 2 Paste Date and Time variables into one variable called DateTime, and convert it to Date/Time class
data$DateTime=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# 3 Plot and save to a PNG file
png("plot2.png",480,480)
with(data,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
