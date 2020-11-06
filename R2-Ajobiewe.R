### 1. Open the data frame in iris {datasets}. Use the help to know about this data. In which units are measured the length and width of sepals and petals? How many variables and observations are there in iris?
#centimeters #5 variables #150 observations
iris
iris <- data.frame(iris)

### 2. Create a vector with the species names. Remember that genus should be with capital letters and species in small letters (e.g. “Iris setosa”).

species.name <- paste("Iris",levels(iris$Species), sep = " ")
str(species.name)

### 3. Create a vector with the name of all quantitative variables

names(iris)
names(iris)[1:4]
quan.variables <- names(iris)[1:4]

### 4.	Make a data frame with the combination of the two previous vectors

Species <- rep(species.name,each=4)
Variables <- rep(quan.variables,3)
d0 <- data.frame(Species, Variables)



#Exercise 5.Using data frame from exercise 4, make a data frame with the following variables:
# Species,Variable,the mean for each variable and species.
# Standard error, the standard error for each variable and species.
##Median, the median for each variable and species.
##Minimum, the minimum for each variable and species.
##Maximum, the maximum for each variable and species


#First we have to create empty vectors then try to make them into a "for" loop

Sp <- Spe <- Va <- character()
Me <- Se <- numeric()
Md <- numeric()
Min <- numeric()
Max <- numeric()

for (i in levels(iris$Species)){
  for (j in names(iris)[-5]){
    x <-  iris[iris$Species == i, j]
    Me <- c(Me, mean(x))                     ##mean for each variable and species
    Se <- c(Se, sd(x) / sqrt(length(x)))     ##standard error for each variable and species
    Md <- c(Md, median(x))                   ##median for each variable and species.
    Min <- c(Min, min(x))                    ##minimum for each variable and species.
    Max <- c(Max, max(x))                    ##maximum for each variable and species
     }                                         
}


### To make every of the vectors created into a data frame 
   
d1 <- data.frame(Species =Species,
                   variable =Variables,
                   Mean =Me,
                   Standard.error =Se,
                   Median =Md,
                   Minimum =Min,
                  Maximum =Max) 

### 6. Install the package WriteXLS and use the command WriteXLS to create a “yourname.xlsx” file with your data frame. Use the parameters: AdjWidth = TRUE, BoldHeaderRow = TRUE, FreezeRow = 1 and FreezeCol = 2, to personalize format.

library(writexl)
write_xlsx(d1,path = "Ajobiewe.xlsx")









