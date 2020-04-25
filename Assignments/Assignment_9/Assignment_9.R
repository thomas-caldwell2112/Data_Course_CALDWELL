library(tidyverse)

df = read.csv("./Data/GradSchool_Admissions.csv")
df$admit = as.logical(df$admit)

plot(df$gre, df$admit)
abline(lm(df$admit~df$gre))

ggplot(x=df$gre, y=df$admit)
ggplot(df, aes(x=gpa, y=admit))+
  geom_count()

fit <- lm(admit~gre*gpa*rank,data=df)
step <- stepAIC(fit, direction="both")
step$anova

step$call
