library(carData)
library(tidyverse)
library(skimr)
library(plotly)
library(RColorBrewer)
options(scipen = 999)


df1 = MplsStops
df2 = MplsDemo

skim(df1) #similary to glimpse
skim(df2)

ggplot(df1, aes(x=race)) +
  geom_histogram(stat="count")

ggplot(df1, aes(x=lat, y=long, color=race)) +
  geom_point(alpha=.1) #transparency


df3 = full_join(df1, df2, by="neighborhood") #tidyverse command

plot1 = ggplot(df3, aes(x=lat, y=long, color=black, size=collegeGrad)) +
  geom_point(alpha=.1) #transparency

ggplotly(plot1) # dont run this will rek ur computer


ggplot(df3, aes(x=lat, y=long, color=race)) +
  #geom_density_2d(linemitre=20)
  geom_hex(alpha=.5)

ggplot(df2, aes(x=white, y=collegeGrad)) +
  geom_point(aes(size=hhIncome), color="purple") +
  geom_smooth(method="lm") +
  labs(title="Nice", x="White", y="College Grad", size="Household Income") +
  theme(panel.background = element_rect(fill = 'white', colour = 'red'))
  #theme_minimal()

df4 = carData::Friendly

ggplot(df4, aes(x=condition, y=correct, fill=condition)) +
  geom_violin() +
  geom_jitter(height=0) +
  geom_boxplot(alpha=.25)


df5 = carData::Chile

skim(df5)

ggplot(df5, aes(x=statusquo, y=income, color=vote))+
  geom_point()

df5 %>% filter(vote %in% c("N", "Y")) %>%
  ggplot(aes(x=statusquo, y=age, color=vote))+
  geom_point()+
  facet_wrap(~region)

ggplot(df5, aes(x=statusquo, fill=sex))+
  geom_density(alpha=.5)+
  facet_wrap(~region)+
  theme_minimal()+
  scale_fill_discrete(name="Gender",
                      breaks=c("F", "M"),
                      labels=c("Female", "Male"))

ggplot(df5, aes(x=income, y=statusquo))+
  geom_smooth(alpha=.5)+
  facet_wrap(~region)

