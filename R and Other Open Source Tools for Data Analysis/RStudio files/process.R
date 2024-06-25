#### The very basics of R ####
# Add comments that the software will ignore with a # symbol
# Click the Run button, or press Ctrl + Enter to run a line of code


#### Use R as a calculator ####
1 + 1
2 - 2
2 * 3
10 / 5
11 ^ 6


#### Store Variables ####
num1 <- 42
num1
num1 * 2


#### Functions ####
# Functions in R have brackets after their name
round(5.5)



#### Adding More Packages and Functions to R ####

# install a package for the first time
# for example this is a package for visualisation
install.packages("ggplot2")


# when you need a package you then load it each time you open R
library(ggplot2)



#### Importing Data ####

# import the data
gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

# view the data
View(gapminder)



#### Processing Data ####

# we're going to install and load a package that is good for data transformation
install.packages("dplyr")
library(dplyr)

# filter to choose specific rows of data
australia <- filter(gapminder, country == "Australia")
View(australia)



#### Analysing Data ####

# basic statistics
summary(gapminder)

# statistics of our filtered dataset
summary(australia)



#### Visualising Data ####

# we already loaded visualation package ggplot2, so we don't need to load it again today

# create a scatterplot
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(aes(colour = continent)) 

# create a scatterplot of our filtered dataset
ggplot(data = australia,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point() 



#### Exporting Interactive Plots ####

# install and then a package for interative plots
install.packages("plotly")
library(plotly)

# insert our plot into a variable
p <- ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(aes(colour = continent)) 

# create an interactive plot
ggplotly(p)

# export the plot as a HTML file
htmlwidgets::saveWidget(ggplotly(p), "index.html")
