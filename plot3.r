##read in data
setwd('R/4exp/ass1')
consumption<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings='?')

##limit dates to 2007-02-01 and 2007-02-02
consumption$Daten<-as.Date(consumption$Date,"%d/%m/%Y")
test.date<-as.Date(c('01Feb2007','02Feb2007'),"%d%b%Y")
analysis.set<-consumption[consumption$Daten  %in% test.date,]

##further processing: Global active power, datetime
analysis.set$Global_active_power_kw<-(as.numeric(analysis.set$Global_active_power))
analysis.set$datetime<-strptime(paste(analysis.set$Date,analysis.set$Time,sep=" "),"%d/%m/%Y %H:%M:%S" )


##plot 3
png(filename="plot3.png",width=480,height=480)
with(analysis.set,plot(datetime,Sub_metering_1,type="l", xlab='',
                       ylab="Energy sub metering"))
with(analysis.set,lines(datetime, Sub_metering_2, col='red'))
with(analysis.set,lines(datetime, Sub_metering_3, col='blue'))
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()