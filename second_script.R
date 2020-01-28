library(tidyverse)

data("iris")

glimpse(iris)
sepal legnthy as a function of pedal length x axis color by sepcies

plot(iris$Petal.Length, iris$Sepal.Length, col = iris$Species, pch = 20)

summary(iris)

plot(iris$Species, iris$Sepal.Length)

hist(iris$Sepal.Length, breaks=30)
density(iris$Sepal.Length)

plot(density(iris$Sepal.Length))
