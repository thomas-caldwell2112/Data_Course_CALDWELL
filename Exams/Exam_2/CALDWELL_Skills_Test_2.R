library(tidyverse)

options(scipen = 999)
theme_set(theme_minimal())

#PART 1
states = read.csv(file="./landdata-states.csv")

jpeg(filename="CALDWELL_Fig_1.jpg", width=1631, height=1440, res=300)
ggplot(states, aes(x=Year, y=Land.Value, color=region))+
  geom_smooth()+
  scale_color_discrete(name="Region")+
  ylab(label="Land Value (USD)")
dev.off()

#PART 2
summary(states[is.na(states$region),]$State) #looks like only DC


#PART 3
sad = read.csv(file="./unicef-u5mr.csv") #:,( i just figured out what u5mr stood for
sad = gather(sad, Year, MortalityRate, -CountryName, -Continent, -Region)
sad = mutate(sad, Year = sub(".*R.", "", Year)) #substring(Year, 6))
sad = arrange(sad, CountryName) #BEAUTIFUL - took me way too long
sad$Year = as.numeric(sad$Year)

#PART 4
jpeg(filename="CALDWELL_Fig_2.jpg", width=1631, height=1440, res=300)
ggplot(sad, aes(x=Year, y=MortalityRate, color=Continent))+
  geom_point()+
  scale_x_continuous(breaks=c(1960, 1980, 2000))
dev.off()

#PART 5 - do not question the for loop
sad2 = data.frame(Continent=character(), Year=character(), Mean=character(), stringsAsFactors=FALSE) 

i = 0
for(cont in levels(sad$Continent)){
  for(year in levels(as.factor(sad$Year))){
    i=i+1
    sad2[i,] = c(cont, year, mean(sad[sad$Continent == cont & sad$Year == year,]$MortalityRate, na.rm = TRUE))
  }
}

sad2$Year = as.numeric(sad2$Year)
sad2$Mean = as.numeric(sad2$Mean)

jpeg(filename="CALDWELL_Fig_3.jpg", width=1631, height=1440, res=300)
ggplot(sad2, aes(x=Year, y=Mean, color=Continent, group=Continent))+
  geom_line(size=2)+
  ylab(label="Mean Mortality Rate (deaths per 1000 live births)")+
  scale_x_continuous(breaks=c(1960, 1980, 2000))
dev.off()

rm(cont, year, i)

#PART 6
jpeg(filename="CALDWELL_Fig_4.jpg", width=2400, height=2400, res=300)
ggplot(sad, aes(x=Year, y=MortalityRate/1000))+
  geom_point(color='blue', shape=1, size=.25)+ 
  facet_wrap(~Region)+ #scales = "free"
  theme(strip.background = element_rect())+
  ylab(label="Mortality Rate")+
  scale_x_continuous(breaks=c(1960, 1980, 2000))
dev.off()





