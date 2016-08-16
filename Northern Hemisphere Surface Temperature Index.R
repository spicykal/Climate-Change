data <- read.csv(url("http://data.giss.nasa.gov/gistemp/graphs/graph_data/mixedNH.Ts.ERSSTV4.GHCN.CL.PA.csv"), skip = 1)
library(dplyr)
data <- select(data, Year:Dec)

data$Aug <- as.numeric(levels(data$Aug)[data$Aug])
data$Sep <- as.numeric(levels(data$Sep)[data$Sep])
data$Oct <- as.numeric(levels(data$Oct)[data$Oct])
data$Nov <- as.numeric(levels(data$Nov)[data$Nov])
data$Dec <- as.numeric(levels(data$Dec)[data$Dec])

ggplot(data, aes(Year, y = value, color = variable)) + 
  geom_line(aes(y = Jan, col = "Jan")) + 
  geom_line(aes(y = Feb, col = "Feb")) +
  geom_line(aes(y = Mar, col = "Mar")) +
  geom_line(aes(y = Apr, col = "Apr")) +
  geom_line(aes(y = May, col = "May")) +
  geom_line(aes(y = Jun, col = "Jun")) +
  geom_line(aes(y = Jul, col = "Jul")) +
  geom_line(aes(y = Aug, col = "Aug")) +
  geom_line(aes(y = Sep, col = "Sep")) +
  geom_line(aes(y = Oct, col = "Oct")) +
  geom_line(aes(y = Nov, col = "Nov")) +
  geom_line(aes(y = Dec, col = "Dec")) + ggtitle("Northern Hemisphere Surface Temperature Difference (Base Period: 1951-1980)")+
  xlab("Years") +
  ylab("Land-Ocean Temperature Index in degrees Celsius")

  
