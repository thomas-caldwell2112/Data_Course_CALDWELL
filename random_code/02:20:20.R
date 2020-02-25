library(tidyverse)
library(readxl)

dat <- read_xlsx("./Data/wide_data_example.xlsx")
dat$'Treatment 1'[dat$'Treatment 1' == "?" = NA]
dat$'Treatment 1' = as.numeric(dat$'Treatment 1')
names(dat) = c("SampleID","Treatment 1","Treatment 2")
#tidy long format
long <- gather(dat,key="Watering", value="Height",2:3)
long$Watering = str_replace(long$Watering,"Treatment","")
ggplot(long, aes(x=SampleID, y=Height, color=Watering))+
  geom_boxplot()
row.names(long) = letters
write.csv(long,"./Data/long_and_tidy.csv",row.names=FALSE)


#############pretent u have a new file
df1 = read.csv(file="./Data/long_and_tidy.csv")

#################new file
data("diamonds")

glimpse(diamonds)

ggplot(diamonds, aes(x=carat, y=price))+
  geom_hex()+
  geom_smooth(method="lm", aes(color=cut))+
  coord_cartesian(ylim=1:20000) #c(0,20000)
  #facet_wrap(~cut)

mod1 = lm(data=diamonds, price ~ carat)
mod2 = lm(data=diamonds, price ~ carat + clarity)

summary(mod1)
summary(mod2)

newdata = data.frame(carat=c(2, 2.1, 2.2, 2.3), clarity="I1")
predict(mod1, newdata=newdata)
predict(mod2, newdata=newdata)


