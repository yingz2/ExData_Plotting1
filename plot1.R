household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$datetime=strptime(paste(household_power_consumption$Date,
                                                    household_power_consumption$Time),format="%Y-%m-%d %H:%M:%S")
h_p_c=subset(household_power_consumption,household_power_consumption$Date %in% as.Date(c('2007-02-01','2007-02-02')))
#View(h_p_c)

for (j in 3:8){
  h_p_c[,j]=as.numeric(levels(h_p_c[,j]))[ h_p_c[,j]]
}

#plot1
png(filename="./plot1.png",width=480,height=480,units="px",pointsize=12,bg="white")
hist(h_p_c$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()