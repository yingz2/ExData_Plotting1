household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$datetime=strptime(paste(household_power_consumption$Date,
                                                    household_power_consumption$Time),format="%Y-%m-%d %H:%M:%S")
h_p_c=subset(household_power_consumption,household_power_consumption$Date %in% as.Date(c('2007-02-01','2007-02-02')))
#View(h_p_c)

for (j in 3:8){
  h_p_c[,j]=as.numeric(levels(h_p_c[,j]))[ h_p_c[,j]]
}

#plot4
png(filename="./plot4.png",width=480,height=480,units="px",pointsize=12,bg="white")
par(mfrow=c(2,2))
par(mar=c(4.2,4.2,1.5,1.5))
plot(x=h_p_c$datetime,y=h_p_c$Global_active_power,ylab="Global Active Power",xlab="",type="l")
plot(x=h_p_c$datetime,y=h_p_c$Voltage,ylab="Voltage",xlab="datetime",type="l")
plot(x=h_p_c$datetime,y=h_p_c$Sub_metering_1,ylab="Energy sub meering", xlab="",type="l",col="black")
lines(x=h_p_c$datetime,y=h_p_c$Sub_metering_2,ylab="Energy sub meering", xlab="",type="l",col="red")
lines(x=h_p_c$datetime,y=h_p_c$Sub_metering_3,ylab="Energy sub meering", xlab="",type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),
       col=c("black","red","blue"),cex=1.0,bty="n")
plot(x=h_p_c$datetime,y=h_p_c$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off()

