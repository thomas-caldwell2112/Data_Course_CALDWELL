library(tidyverse)
library(patchwork)
library(colorblindr)
library(RColorBrewer)
library(ggimage)

data("mtcars")

pal = brewer.pal(3,"Dark2")
palette_plot(pal)

ggplot(mtcars, aes(x=carb, y=mpg))+
  geom_area()
#ggsave("testplot.jpg")

p1 = ggplot(mtcars, aes(x=disp, y=mpg)) + geom_smooth()
p1
#ggsave("./test1.png", plot=p1) #only works if run p1 maybe

p2 = ggplot(mtcars, aes(x=disp, y=mpg, color=factor(cyl))) + geom_point()

p2/p1
p2/(p1+p1)
(p2/p1)+p1

p1 + theme_bw()
p1 + scale_x_reverse()
p3 = p2 + labs(title = "gross", x="Engine displacment", y="Miles per gallon", color="Number of\ncylinders")+
  scale_color_manual(values=pal)

p3 + theme(title=element_text(face="italic"), plot.background = element_rect(fill="red"),
           legend.background = element_rect(fill="purple"),
           panel.background = element_rect(fill="blue"),
           legend.text = element_text(size=20),
           axis.text.y = element_text(angle=180))


mod = lm(data=mtcars,formula=mpg ~ disp)
summary(mod)
mtcars$resids = residuals(mod)
ggplot(mtcars, aes(x=disp, y=mpg))+
  geom_point()+
  geom_smooth(method="lm", se=FALSE)+
  geom_segment(aes(yend=mpg-resids, xend=disp)) #mutate(mtcars, DIFF=mpg-resids)

ggplot(mtcars, aes(x=sqrt(disp), y=mpg))+
  geom_point()+
  geom_smooth(method="lm", se=FALSE)
  #scale_x_log10()


df = read.csv("./Data/mushroom_growth.csv")
glimpse(df)

ggplot(df, aes(x=Nitrogen, y=GrowthRate, color=Light))+
  geom_point()+
  geom_smooth(method="lm", formula=y~poly(x,2))+ #number is how ,any curves
  facet_wrap(~Species)+
  scale_color_gradient(low="Blue", high="Red")+
  theme(strip.text=element_text(face="italic")) #I(expression(italic)) you can iltalic one side doing this but making two plots and using patchwork is better
lm(data=df, GrowthRate ~ poly(Nitrogen,2)) # to get line equation


# mtcars$fn = "./clown.jpeg"
# ggplot(mtcars, aes(x=sqrt(disp), y=mpg))+
#   geom_pimage(aes(image=fn))





