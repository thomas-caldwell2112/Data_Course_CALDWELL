df = read.csv("./Data/ITS_mapping.csv", sep="\t")

summary(df)
summary(read.csv("./Data/ITS_mapping.csv", sep="\t", stringsAsFactors = FALSE)) #first one was more useful


png(filename = "silly_boxplot.png")

plot(df$Ecosystem, df$Lat)

dev.off()