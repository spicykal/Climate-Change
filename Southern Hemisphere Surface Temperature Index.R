data <- read.csv(url("http://data.giss.nasa.gov/gistemp/graphs/graph_data/mixedSH.Ts.ERSSTV4.GHCN.CL.PA.csv"), skip = 1)
library(dplyr)
data <- select(data, Year:Dec)

data$Aug <- as.numeric(levels(data$Aug)[data$Aug])
data$Sep <- as.numeric(levels(data$Sep)[data$Sep])
data$Oct <- as.numeric(levels(data$Oct)[data$Oct])
data$Nov <- as.numeric(levels(data$Nov)[data$Nov])
data$Dec <- as.numeric(levels(data$Dec)[data$Dec])

p <- ggplot(data, aes(Year, y = value, color = variable), ord) + 
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
ggplotly(p)

