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

# we can now use functions that come with / live inside the package

# This creates a blank plot
ggplot()



#### Importing Data ####

# import the data
gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

# view the data
View(gapminder)

# Get a summary
summary(gapminder)


#### Processing Data ####

# we're going to install and load a package that is good for data transformation
install.packages("dplyr")
library(dplyr)

# filter to choose specific rows of data
australia <- filter(gapminder, country == "Australia")
View(australia)


#### Visualising Data ####

# we already loaded visualation package ggplot2, so we don't need to load it again today

# Plot the population of Australia over time
ggplot(data = australia,
       mapping = aes(x = year, y = pop)) +
  geom_point()

# create a scatterplot of gdpPercap vs lifeExp for all countries in 2007

# Filter by 2007
gapminder07 <- filter(gapminder, year == 2007)

# Create plot
ggplot(data = gapminder07,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent)) +
  geom_point() +
  xlab("GDP per capita (USD)") +
  ylab("Life expectancy (years)")
