library(tidyverse)
library(ggimage)
library(png)
library(ggpubr)
library(RColorBrewer)

RColorBrewer::display.brewer.all()
brewer.pal(9, "Pastel1")
pal

data("swiss")
pal = c("#ffed5d","#95ef23","#375915","#ff30db","#332448",
        "#e1306f","#9f2b60","#603631","#7a490b","#db600e",
        "#ffed5d","#95ef23","#375915","#ff30db","#332448",
        "#e1306f","#9f2b60","#603631","#7a490b","#db600e",
        "#ffed5d","#95ef23","#375915","#ff30db","#332448",
        "#e1306f","#9f2b60","#603631","#7a490b","#db600e")

png(filename="ugly_plot.png", res=100, unit="in", width=5, height=5)

ggplot(swiss, aes(x=Agriculture, y=Fertility, color=as.factor(Examination)))+
  background_image(readPNG("./background-image.png"))+
  geom_point(alpha=.5, size=11)+
  geom_violin(fill="#332448")+
  coord_cartesian(xlim=-50:100, ylim=-200:100)+
  labs(title="graf")+
  ylab(label="Fertilety")+
  scale_color_manual(values = pal)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        axis.text.y = element_text(angle = 132, hjust = 1),
        axis.title.x = element_text(angle=2, size=6, color="Red"),
        axis.title.y = element_text(angle=0, size=15, vjust = .2),
        plot.background = element_rect(fill = "darkblue"),
        legend.position = "top")

dev.off()
        