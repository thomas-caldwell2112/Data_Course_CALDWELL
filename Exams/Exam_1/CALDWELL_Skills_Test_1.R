library(tidyverse)

df = read.csv("DNA_Conc_by_Extraction_Date.csv")

summary(df) #Katy's is a lot lower

?hist
hist(df$DNA_Concentration_Katy, main="Katy Data", xlab="DNA Concentration")
hist(df$DNA_Concentration_Ben, main="Ben Data", xlab="DNA Concentration")

class(df$Year_Collected)
class(df$DNA_Concentration_Katy)

?plot
jpeg(filename="CALDWELL_Plot1.jpeg")
plot(as.factor(df$Year_Collected), df$DNA_Concentration_Katy, main="Katy's Extractions", xlab="YEAR", ylab="DNA Concentration")
dev.off()

jpeg(filename="CALDWELL_Plot2.jpeg")
plot(as.factor(df$Year_Collected), df$DNA_Concentration_Katy, main="Ben's Extractions", xlab="YEAR", ylab="DNA Concentration")
dev.off()

###################################################


concDiff = c()
for(i in 1:nrow(df)) #I regret typing as.factor everytime
{
  concDiff[i] = (df$DNA_Concentration_Ben[i] - df$DNA_Concentration_Katy[i])/df$DNA_Concentration_Katy[i]
}
df2 = data.frame(c(df$Year_Collected), concDiff)
df3 = df2 %>% arrange(concDiff)
head(df3)

#################################################

dfDown = df[df$Lab == "Downstairs",]

class(dfDown$Date_Collected)

jpeg(filename="Ben_DNA_over_time.jpg")
plot(as.POSIXct(dfDown$Date_Collected), dfDown$DNA_Concentration_Ben)
dev.off()


#new df with year and ben conc avg
#Not finished
concMean = c()
for(i in levels(as.factor(df$Year_Collected)))
{
  print(df[as.character(df$Year_Collected) == i,])
}

mean(df$DNA_Concentration_Ben)


