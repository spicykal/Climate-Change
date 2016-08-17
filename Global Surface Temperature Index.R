Global_Temp <- read.csv(url("http://data.giss.nasa.gov/gistemp/graphs/graph_data/mixedGLB.Ts.ERSSTV4.GHCN.CL.PA.csv"), skip = 1)
library(dplyr)
library(ggplot2)
library(plotly)
Global_Temp <- select(Global_Temp, Year:Dec)

Global_Temp$Aug <- as.numeric(levels(Global_Temp$Aug)[Global_Temp$Aug])
Global_Temp$Sep <- as.numeric(levels(Global_Temp$Sep)[Global_Temp$Sep])
Global_Temp$Oct <- as.numeric(levels(Global_Temp$Oct)[Global_Temp$Oct])
Global_Temp$Nov <- as.numeric(levels(Global_Temp$Nov)[Global_Temp$Nov])
Global_Temp$Dec <- as.numeric(levels(Global_Temp$Dec)[Global_Temp$Dec])

p_global <- ggplot(Global_Temp, aes(Year, y = value, color = Months)) + 
  geom_smooth(aes(y = Jan, col = "Jan"),se = FALSE, linetype = 1) + 
  geom_line(aes(y = Feb, col = "Feb"), linetype = 2) +
  geom_line(aes(y = Mar, col = "Mar"), linetype = 3) +
  geom_line(aes(y = Apr, col = "Apr"), linetype = 4) +
  geom_line(aes(y = May, col = "May"), linetype = 5) +
  geom_smooth(aes(y = Jun, col = "Jun"), se = FALSE, linetype = 6) +
  geom_line(aes(y = Jul, col = "Jul"), linetype = 1) +
  geom_line(aes(y = Aug, col = "Aug"), linetype = 2) +
  geom_line(aes(y = Sep, col = "Sep"), linetype = 3) +
  geom_line(aes(y = Oct, col = "Oct"), linetype = 4) +
  geom_line(aes(y = Nov, col = "Nov"), linetype = 5) +
  geom_smooth(aes(y = Dec, col = "Dec"), se = FALSE, linetype = 6) + ggtitle("Global Surface Temperature Difference (Base Period: 1951-1980)")+
  xlab("Years") +
  ylab("Land-Ocean Temperature Index in degrees Celsius") 
ggplotly(p_global)
  
