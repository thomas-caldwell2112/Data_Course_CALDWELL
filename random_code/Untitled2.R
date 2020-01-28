v1 = c(1:10)
v2 = c(2:11)
v1 + v2

mushrooms = read.csv("./Data/mushroom_growth.csv")

df2 = mushrooms[mushrooms$Species == "P.ostreotus" & mushrooms$Light > 10 & mushrooms$GrowthRate >= 110 & mushrooms$GrowthRate <= 150,]
