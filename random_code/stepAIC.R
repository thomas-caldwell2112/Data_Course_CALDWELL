library(MASS)
library(tidyverse)
library(modelr)

set.seed(123)

data("mtcars")
names(data)

fullmodel = lm(data=mtcars, mpg ~ factor(cyl) + disp + hp + drat + wt + qsec + factor(vs) +  factor(am) + factor(gear) + factor(carb))

step = stepAIC(fullmodel)

goodmodel = step$call
goodmodel = lm(mpg ~ factor(cyl) + hp + wt + factor(am), data=mtcars)

add_predictions(mtcars, goodmodel)

set = caret::createDataPartition(mtcars$mpg)
set = set$Resample1

train = mtcars[set,]
test = mtcars[-set,]

formula(goodmodel)
trainedmodel = lm(data=train, formula=formula(goodmodel))

add_predictions(test,trainedmodel) %>%  
  ggplot(aes(x=hp,color=factor(cyl)))+
  geom_point(aes(y=mpg))+
  geom_smooth(method="lm", aes(y=pred))

#add_predictions




