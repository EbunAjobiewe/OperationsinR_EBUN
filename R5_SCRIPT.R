###Exercises
###Create a rmarkdown document with the answer to the following questions. Change knitr options to save all the graphics in the folder “results” in png format with a resolution of 100 dpi.

###Note: to change the knitr options use the command knitr::opts_chunk$set().

#1. For the data InsectSpray, make a table for the number of insects for each spray with the mean, median and standard error.
#Note: Remember to use knitr::kable(), or a similar function to print the table with its caption.


InsectSprays <- data.frame(InsectSprays)
str(InsectSprays)
#create empty vectors then make them into a "for" loop
Spray <- character()                            
Mean <- Median <- Number_of_insect <- Standard_error <- numeric()         
 
for (i in levels(InsectSprays$spray)) {
  Spray <- c(Spray, paste("Spray", i))
  x <- InsectSprays$count[InsectSprays$spray == i ]
  Number_of_insect <- c(Number_of_insect, sum(x))
  Mean <- c(Mean, mean(x)) 
  Median <- c(Median, median(x)) 
  Standard_error <- c(Standard_error, sd(x) / sqrt(length(x)))     
}

#make every of the vectors created into a single data frame (dIS)

dIS <- data.frame(Spray, Mean, Median, Number_of_insect, Standard_error)
                
#Question 2. Print a plot to see the differences of counts between sprays.
# Include a caption explaining the figure. 
# Which type of plot is the one you choose and why? #boxplot is used here because it you can add letters to determine if there are significant differences or not 

plot(InsectSprays$count ~ InsectSprays$spray, xlab="spray", ylab="count")


#Question 3.  Test for differences between sprays using anova and a posthoc comparison and redo the previous plot including the representation of all posthoc differences.
# Note: for the anova use the command aov() and for the posthoc comparison use the Tukey’s ‘Honest Significant Difference’ method. For this method try the TukeyHSD() and the agricolae::HSD.test() and see the differences.

#ANOVA
A <- aov(count ~ spray, data= InsectSprays)
summary.aov(A)

T <- TukeyHSD(A)
Ag <- agricolae::HSD.test(A, "spray",group=TRUE,console=TRUE)

#plot with the representation of the posthoc differences
PH <- plot(InsectSprays$count ~ InsectSprays$spray, ylim= c(0,30))  #redoing previous plot
text(x=0:7, y=28, c("a","a","b","b","b", "a"))      #show groups


#Question 4. Test for differences between sprays using non-parametric Kruskal-Wallis rank sum test. Again, redo the plot with these results.
# Note: Use agricolae::kruskal().
K <- agricolae::kruskal(InsectSprays$count, InsectSprays$spray)

##Kruskal plot
KP <- plot(InsectSprays$count ~ InsectSprays$spray, ylim= c(0,30))
text(x=0:7, y=28, c("a","a","b","b","bc", "c"))      #show groups


#Question 5.Transform count data using sqrt(counts) and redo the anova, 
#the Tukey posthoc comparison and the plot.

SR <- c(sqrt(InsectSprays$count))                                       #transforming count data
TransA <- aov(sqrt(count)~spray, data = InsectSprays)                   #redoing anova
TransT <- TukeyHSD(TransA)                                              #redoing Tukey posthoc
TransAg <- agricolae::HSD.test(TransA, "spray",group=TRUE,console=TRUE)

#plotting with the posthoc analysis of sqrt transformed T

TransPH <- plot(sqrt(InsectSprays$count)~InsectSprays$spray, ylim= c(0,8))
text(x=0:7, y=6, c("a","a","b","b","bc", "c"))           #show groups


#Question 6. Test for normality of residuals for the two performed anova analyses 
#of points 4 and 6 using shapiro.test() and use plot the anova to see the qqplots and compare them.
#a)shapiro test on ANOVA 1 & 2
#b)plotting the anova
#c) checking qqplots to see if the data is normally distributed or not. 
##qqplots confirms  that distribution is actually better in the second than in the one and it follows the results of the shapiro tests


#Question 7. Which of the previous analysis is the adequate in this case? Why?
#Is there any difference in the results between the square root transformed ANOVA 
#and the Kruskal-Wallis analyses? 
#Is there any difference in the results between the direct ANOVA and the square root transformed ANOVA?
#Which ones?
  