library(tidyverse)

data("Loblolly")

summary(Loblolly)

table(Loblolly$Seed)
levels(Loblolly$Seed)

as.numeric(Loblolly$Seed)
as.numeric(as.character(Loblolly$Seed))
nums1 = as.numeric(as.character(Loblolly$Seed))

nums1[1]

glimpse(Loblolly)

hist(Loblolly$height, breaks = 84)
hist(Loblolly$age)

plot(x <- Loblolly$age, y=Loblolly$height)
x
y

plot(Loblolly$Seed, Loblolly$height)

table(Loblolly$Seed, Loblolly$age)
plot(y=Loblolly$height, x=Loblolly$age, col=Loblolly$Seed, pch=20, main = "Trees Grow over time!", xlab = "Tree Age", ylab = "Tree Height")

