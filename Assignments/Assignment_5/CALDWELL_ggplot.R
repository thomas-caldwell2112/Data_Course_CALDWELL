library(tidyverse)

data("iris")

png(filename="iris_fig1.png", units="px", width=2000, height=1600, res=300)
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species))+
  geom_point()+
  geom_smooth(method=lm)+
  labs(title="Sepal length vs petal length", subtitle="for three iris species")+
  theme_minimal()
dev.off()

png(filename="iris_fig2.png", units="px", width=2000, height=1600, res=300)
ggplot(iris, aes(x=Petal.Width, fill=Species))+
  geom_density(alpha=.5)+
  labs(title="Distribution of Pedal Widths", subtitle="for three iris species")+
  theme_minimal()
dev.off()

png(filename="iris_fig3.png", units="px", width=2000, height=1600, res=300)
ggplot(iris, aes(x=Species, y=Petal.Width/Sepal.Width, fill=Species))+
  geom_boxplot()+
  labs(title="Sepal- to Petal-Width Ratio", subtitle="for three iris species")+
  ylab("Ratio of Sepal Width to Petal Width")+
  theme_minimal()
dev.off()

iris$Sepal.Deviation = iris$Sepal.Length-mean(iris$Sepal.Length)
png(filename="iris_fig4.png", units="px", width=2000, height=1600, res=300)
ggplot(iris[order(iris$Sepal.Deviation),], aes(x=1:150, y=Sepal.Deviation, fill=Species))+
  geom_bar(stat="identity")+
  coord_flip()+
  labs(subtitle="Sepal length deviance from the mean of all observations", caption="Note: Deviance = Sepal.Length - mean(Sepal.Length)")+
  xlab("")+
  ylab("Deviance from the Mean")+
  theme_minimal()+
  theme(axis.text.y=element_blank())
dev.off()
