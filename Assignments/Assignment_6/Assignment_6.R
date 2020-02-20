library(tidyverse)

#1. Load data set
data("mtcars")

#2. subsets the mtcars dataframe to include only automatic transmissions
df_auto = mtcars[mtcars$am == 0,]

#3. saves this new subset as a new file called “automatic_mtcars.csv” in your Assignment_5 directory
write.csv(df_auto, file="automatic_mtcars.csv")

#4. plots the effect of horsepower on miles-per-gallon (update plot to have meaningful labels and title)
p1 = ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_smooth(method="lm")+
  geom_point()+
  labs(title="Horsepower vs Miles Per Gallon")+
  xlab(label="Horsepower")+
  ylab(label="Miles per gallon")
p1

#5. saves this plot as a png image called “mpg_vs_hp_auto.png” in your Assignment_5 directory
png(filename="mpg_vs_hp_auto.png")
p1
dev.off()

#6. plots the effect of weight on miles-per-gallon (with improved labels, again)
p2 = ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_smooth(method="lm")+
  geom_point()+
  labs(title="Weight vs Miles Per Gallon")+
  xlab(label="Weight")+
  ylab(label="Miles per gallon")
p2

#7. saves this second plot as a tiff image called “mpg_vs_wt_auto.tiff” in your Assignment_5 directory
tiff(filename="mpg_vs_wt_auto.tiff")
p2
dev.off()

#8. subsets the original mtcars dataframe to include only cars with displacements less than or equal to 200 cu.in.
df_200 = mtcars[mtcars$disp <= 200,]

#9. saves that new subset as a csv file called mtcars_max200_displ.csv
write.csv(df_200, file="mtcars_max200_displ.csv")

#10. includes code to calculate the maximum horsepower for each of the three dataframes (original, automatic, max200)
df_maxhp = rbind(head(mtcars[order(mtcars$hp, decreasing=TRUE),], 1), 
                head(df_auto[order(df_auto$hp, decreasing=TRUE),], 1),
                head(df_200[order(df_200$hp, decreasing=TRUE),], 1))

#11. prints these calculations (from task 10) in a readable format to a new plaintext file called hp_maximums.txt
write.table(df_maxhp, file = "hp_maximums.txt", sep = "\t")
