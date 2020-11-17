####10/11/2020 Class Examples 
#al <- aov(iris$Sepal.Length ~ iris$Species)
#transformation: al <- aov()
#al$residuals
#shapiro.test(al$residuals)
#TukeyHSD(al)
#ir$
#install.packages("agricolae")
#hsd <- agricolae::HSD.test(al, "Species")

#kw <- agricolae::kruskal(iris$Sepal.Length, trt = iris$Species)

#kruskal.test(iris$Sepal.Length, iris$Species)

#plot(al)
#plot(iris$Sepal.Length ~ iris$Species)
##example of how to add letters to a box-plot 
##text(x = 1:3, y = 8.5, c("a", "b", "c"))




#Corellation coefficients(r): Comparing the correlation between x & y
X <- c(1,1,9,1,9,1,2,1,2,3)
Y <- c(0,1,4,2,6,0,1,1,3)

MX <- mean(X)
MY <- mean(Y)

mean(Mx)
mean(My)

# Finding the Sum of squares
SSx = sum(X - Mx)^2

SSy = sum(Y - My)