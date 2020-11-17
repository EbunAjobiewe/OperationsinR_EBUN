# Exercise 3 - Basic graphics and data

###1. Plot a cheat-sheet with values of color and point type (col = , and pch = ) from 1 to 25, 
### and export it as a jpeg of 15 cm wide, 6 cm high and resolution 100 points per cm.

#Open the device "Plot1ex.jpeg" with 15cm wide, 6 cm high and resolution 100 points per cm.
jpeg(filename = "Plot1ex.jpeg", width = 15, height = 6, units = "cm", res = 100, bg="transparent" )
plot(0, 0, xlim = c(0, 26), ylim = c(0.5, 1.5),
     ylab = "color & shape", xlab= "color & shape numbers", yatx = "n")
for (i in 1:25) {
  points(i,1, pch = i, col = i, cex = 1.5)
}

#2. Plot into a graph ten Poisson distributions with lambda ranging from 1 to 10. 
#Put legend and title. Export it as a .tiff file with size of 15x15 cm.
x <- seq(-1, 20, 1)
y <- dpois(x,lambda = 1)
plot(x, y, type = "n")

for (i in 1:10) {
  y <- dpois(x, lambda = i)
  lines(x,y, col = i)
}

title(main= "poisson distribution, lamda = 1:10 ")
legend("topright", legend = paste("lamba =", 1:10 ),lty = 1, col = 1:10)

# export into tiff plot
tiff("Plot_1poisson_1to10.tiff", width = 15, height = 15, units = "cm", bg = "transparent", res = 150)
x <- seq(-1, 20, 1)
y <- dpois(x,lambda = 1)
plot(x, y, type = "n")

for (i in 1:10) {
  y <- dpois(x, lambda = i)
  lines(x,y, col = i)
}

title(main= "poisson distribution, lamda = 1:10 ")
legend("topright", legend = paste("lamba =", 1:10 ),lty = 1, col = 1:10)

dev.off()
getwd()

#3.Import data from this article: https://peerj.com/articles/328/
#With these data, using for(), plot graphs to represent 
#the effect of all the numerical variables, from “richness” to “mean_quality” 
#on “yield”. Choose the type of graph that 
#you think better represents this effect for the different species. 
#Create only one pdf with all the graphs inside.

Webcsv <-"https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
Data <- read.table(Webcsv, header = T, sep = ",", skip = 2)
Data[-1]
str(Data) 

Data <- Data [-1]
Data$crop <- as.factor(Data$crop)

for (i in names(Data[5:11])) {
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean yields", xlab = as.character(names(Data[i])), col = Data$crop)
  title(main= paste("Mean yield in function of", as.character(names(Data[i]))))
  
  
}

pdf("R3Ajobiewe.pdf")
for (i in names(Data[5:11])) {
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean Yields", xlab = as.character(names(Data[i])), col = Data$crop)
  title(main= paste("Mean Yield in function of", as.character(names(Data[i]))))
}
dev.off()
getwd()

