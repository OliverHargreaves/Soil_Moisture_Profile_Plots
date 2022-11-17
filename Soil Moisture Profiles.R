# Soil moisture profiles over time

# Packages
library(readxl)

# Load soil moisture data
data=read_xlsx('Vernal Midnight Data 2020.xlsx')

# Prepare data
Depth=c(-3, -10, -25, -65, -105, -145, -215) # Sensor depth in cm

n=length(data$Date)

dir.create('Plots')

for (i in 1:n) {
  path=paste('Plots//', data$Date[i], '.jpg', sep='')
  jpeg(file=path)

  plot(x=c(data$VWC_0.03[i],data$VWC_0.10[i], data$VWC_0.25[i], data$VWC_0.65[i],
           data$VWC_1.05[i],data$VWC_1.45[i], data$VWC_2.15[i]), y=Depth,
       xlim=c(0,50), ylim=c(-215, -3), xlab='Volumetric water content (%)', ylab='Depth (cm)',
       type='l', main=data$Date[i], lwd=3, col='cyan3')
  
  dev.off()}
