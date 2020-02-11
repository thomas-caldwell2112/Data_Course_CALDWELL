library(tidyverse)

data("iris")
data("mitcars")

names(iris)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()
  
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species)) + geom_bar(stat = "identity") #geom_col()

iris %>% group_by(Species) %>% summarize(Mean = mean(Sepal.Length)) %>%

ggplot(aes(x=Species, y=Mean, fill=Species)) + geom_col()

iris[iris$Species == "setosa" | iris$Species == "versicolor",] %>%
ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

filter(iris, Species != "virginica") %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()
