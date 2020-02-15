library(tidyverse)
library(plotly)

data("iris")
data("mitcars")

names(iris)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()
  
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species)) + geom_bar(stat = "identity") #geom_col()

iris %>% group_by(Species) %>% summarize(Mean = mean(Sepal.Length)) %>%

ggplot(aes(x=Species, y=Mean, fill=Species)) + geom_col()

iris[iris$Species == "setosa" | iris$Species == "versicolor",] %>%
ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

filter(iris, Species != "virginica") %>% # filter(Species %in% c("csetosa", "versiocolor"))
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point() + geom_smooth(method="lm")

names(mtcars)
ggplot(mtcars, aes(x=hp, y=mpg, color=factor(cyl))) + 
  geom_point() + 
  geom_smooth(inherit.aes = FALSE, method="lm", aes(x=hp, y=mpg)) +
  labs(x="HORSEPOWERS")

plot_ly(x=mtcars$hp, y=mtcars$mpg, z=mtcars$wt, type="scatter3d", mode="markers")




