library(modelr)

df = read.csv(file="Data/mushroom_growth.csv")

plot(df$Light, df$GrowthRate) #this one looks like it has the best correlation
plot(df$Nitrogen, df$GrowthRate)
plot(as.numeric(df$Humidity), df$GrowthRate) #this and temp look close
plot(df$Temperature, df$GrowthRate)


mod1 = lm(formula= GrowthRate ~ Light ,df)
mod2 = lm(formula= GrowthRate ~ Humidity * Temperature ,df)
mod3 = aov(formula= GrowthRate ~ Humidity * Temperature ,df)


mean(mod1$residuals^2)
mean(mod2$residuals^2)
mean(mod3$residuals^2)


preds = predict(mod1, dfp <- data.frame(Light = 
                c(-15, -5, 5, 15, 25, 35, 45))) #i know its ugly


plot(df$GrowthRate ~ df$Light, xlim=c(-20,50), ylim=c(-100,700))
points(x=dfp$Light, y=preds, col="Red")




