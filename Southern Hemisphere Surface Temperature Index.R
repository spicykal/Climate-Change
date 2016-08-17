Southern_Hemisphere <- read.csv(url("http://data.giss.nasa.gov/gistemp/graphs/graph_data/mixedSH.Ts.ERSSTV4.GHCN.CL.PA.csv"), skip = 1)
library(dplyr)
library(ggplot2)
library(plotly)
Southern_Hemisphere <- select(Southern_Hemisphere, Year:Dec)

Southern_Hemisphere$Aug <- as.numeric(levels(Southern_Hemisphere$Aug)[Southern_Hemisphere$Aug])
Southern_Hemisphere$Sep <- as.numeric(levels(Southern_Hemisphere$Sep)[Southern_Hemisphere$Sep])
Southern_Hemisphere$Oct <- as.numeric(levels(Southern_Hemisphere$Oct)[Southern_Hemisphere$Oct])
Southern_Hemisphere$Nov <- as.numeric(levels(Southern_Hemisphere$Nov)[Southern_Hemisphere$Nov])
Southern_Hemisphere$Dec <- as.numeric(levels(Southern_Hemisphere$Dec)[Southern_Hemisphere$Dec])

p_south <- ggplot(Southern_Hemisphere, aes(Year, y = value, color = Months)) + 
  geom_smooth(aes(y = Jan, col = "Jan"), se = FALSE, linetype = 1) + 
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
  geom_smooth(aes(y = Dec, col = "Dec"), se = FALSE, linetype = 6) + ggtitle("Southern Hemisphere Surface Temperature Difference (Base Period: 1951-1980)")+
  xlab("Years") +
  ylab("Land-Ocean Temperature Index in degrees Celsius")
ggplotly(p_south)

