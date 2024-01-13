library(ggplot2)
library(plyr)
data("ChickWeight")

library(ggplot2)
ggplot(ChickWeight, aes(x=Time,y=weight, color=Diet)) + geom_point()
ggplot(ChickWeight, aes(x=Time,y=weight, color=Diet)) + geom_smooth()

ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + geom_point() + geom_smooth()

# At a glance, we can tell that Diet 3 is the best. Diet 1 is the worst. 

# Now, let's see which Diet is most efficient. To do this, we would need to introduce a new column to the dataframe

library(plyr)
Efficiency_chart<- ddply( ChickWeight, ~Chick + Diet, mutate, efficiency = ifelse(Time==0, 0, weight/Time))


Efficiency_chart

ggplot(Efficiency_chart, aes(x=Time, y=efficiency, color=Diet))  + geom_smooth()  

# Now we can see that in terms of efficiency, Diet 3 overtakes Diet 4 at a certain point somewhere between Day 13 and 14. . 

# From this, we gather that Diet 3 is the recommended choice as both the most effective diet and most efficient diet, with the most weight produced per time grown. 



