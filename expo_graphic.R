old.wd <- getwd()
new.wd <- ("C:/Users/FabioDesk/Documents/GitHub/datasciencecoursera")
setwd(new.wd)


pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

summary(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
rug(pollution$pm25)

#Working with breaks
hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")

#Multiple Boxplots
boxplot(pm25 ~region, data = pollution, col = "red")

#Multiple Histograms
par(mfrow = c(2, 1), mar = c(4, 4,  2, 1))
hist(subset(pollution, region == "east") $pm25, col = "green")
hist(subset(pollution, region == "west") $pm25, col = "green")

#Scatterplot
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)

#Scatterplot - Using Color
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

#Multiple Scatterplots
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

#Base Plot
library(datasets)
data(cars)
with(cars, plot(speed, dist))


#Lattice Plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~Income | region, data = state, layout = c(4, 1))


#ggplot2 Plot

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)


#Simple Base Graphics: Histogram
library(datasets)
hist(airquality$Ozone) ##Draw a new plot

#Simple Base Graphics: Scatterplot
library(datasets)
with(airquality, plot(Wind, Ozone))

#Simple Base Graphics: Boxplot
library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

#How Does a Plot Get Created?
library(datasets)
with(faithful, plot(eruptions, waiting))  ##Make plot appear on screen device
title(main = "Old Faithful Gayser data") ## Annotate with a title

pdf(file = "myplot.pdf")                  ##Open PDF device; creat 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")  ## Annotate plot; still nothing on screen
dev.off() ## Close the PDF file device
# Now you can view the file 'myplot.pdf' on your computer

#Copying Plots
library(datasets)
with(faithful, plot(eruptions, waiting))   ## Create plot on screen device
title(main = "Old Faithful Geyser data")  ## Add a main title
dev.copy(png, file = "geyserplot.png")    ## Copy my plot to a PNG file
dev.off()                                 ## Don't forget to close the PNG device!
