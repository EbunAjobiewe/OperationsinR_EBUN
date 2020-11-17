#### Install packages --------------
#### Packages ------------
# install.packages(c("dplyr", "tidyr"), dependencies = TRUE)

install.packages(c("dplyr", "tidyr"), dependencies = TRUE)
library(tidyr)
library(dplyr)
library(tidyverse)

%>% #magrittr pipe for nesting different commands e.g
### Example using Magritte pipe ------------------------
library(magrittr)
i <- iris %>% 
  filter(Sepal.Length < 5) %>% 
  select(Sepal.Width, Sepal.Length, Species)

#the function mutate is used to create new variables from previous variables e.g ### Create new variables
iris %>% 
  mutate(Petal.Shape = Petal.Width / Petal.Length,
         Sepal.Shape = Sepal.Width / Sepal.Length) %>% 
  select(Species, Petal.Shape, Sepal.Shape)


#using the group_by() and summarize() functions
### Use of group_by and summarize ------------------
iris %>% 
  group_by(Species) %>% 
  summarise(Mean.Petal.Length = mean(Petal.Length))
   as.data.frame() #you can change this to a dataframe
   #you can also make this into a table using the kable function
  
   ### grouping by multiple columns
   iris %>% 
     mutate(Petal.Long = Petal.Length > 5) %>% 
     group_by(Species, Petal.Long) %>% 
     summarise(Mean.Petal.Length = mean(Petal.Length),
               n.Petals = length(Petal.Length),
               sd.Petal.Length = sd(Petal.Length),
               SE.Petal.Length = sd(Petal.Length) / sqrt(length(Petal.Length)))
   
   
   ### Order observations --------------
   iris %>% 
     group_by(Species) %>% 
     summarise(Mean.Petal.Length = mean(Petal.Length),
               n.Petals = length(Petal.Length),
               sd.Petal.Length = sd(Petal.Length),
               SE.Petal.Length = sd(Petal.Length) / sqrt(length(Petal.Length))) %>% 
     arrange(-Mean.Petal.Length)
   
   #The tidyr package
   ### Difference between long and wide format in tidy data -------------------
   ### Number  of insects in each trap each year. Wide format. 
   (d1 <- tibble(
     trap = 1:10,
     Year.2013 = c(12, 10, 5, 3, 15, 11, 12, 10, 7, 5),
     Year.2014 = c(12, 3, 15, 1, 13, 4, 1, 16, 7, 13),
     Year.2015 = c(12, 0, 5, 3, 15, 11, 12, 10, 7, 15),
     Year.2016 = c(2, 10, 6, 3, 1, 11, 12, 10, 7, 10)))
   as.data.frame(d1)
#this is not a tidy data because Year should be a variable with its own column. Also it should be numeric or Date type. Data should be given in this way:
#we want less
### Number  of insects in each trap each year. Long format.
   tibble(
     trap = rep(1:10, 4),
     year = c(rep(2013, 10), rep(2014, 10), rep(2015, 10), rep(2016, 10)),
     numberInsects = c(12, 10, 5, 3, 15, 11, 12, 10, 7, 5,
                       12, 3, 15, 1, 13, 4, 1, 16, 7, 13,
                       12, 0, 5, 3, 15, 11, 12, 10, 7, 15,
                       2, 10, 6, 3, 1, 11, 12, 10, 7, 10))

##From long to wide format and viceversa: pivot_longer() and pivot_wider()
#long format is good for analysis while wide format is good for presentation
   
## From wide to long format ------
   d1.long <- d1 %>% 
     pivot_longer(contains("Year"), 
                  names_to = "Year", 
                  values_to = "insects")
   relig_income
   relig_income %>%
 
        pivot_longer(!religion, names_to = "income", values_to = "count")
### Same cleaner ---------
   d1.long <- d1 %>% 
     pivot_longer(contains("Year"), 
                  names_to = "Year", 
                  values_to = "insects") %>% 
     separate(Year, into = c("na", "year"), convert = TRUE) %>%
     select(-na)
   
### output 
   head(d1.long, 4)
   
### Wide format again 
   d1.long %>% 
     pivot_wider(names_from = year, names_prefix = "Year.", 
                 values_from = insects)
### Create the summary table ------
   r2 <- iris %>% 
     pivot_longer(Sepal.Length:Petal.Width, 
                  names_to = "NumVariable", 
                  values_to = "value")  %>% 
     group_by(Species, NumVariable) %>% 
     summarise(mean = mean(value),
               st.error = sd(value) / sqrt(length(value)),
               median = median(value),
               maxim = max(value),
               minim = min(value))
## `summarise()` regrouping output by 'Species' (override with `.groups` argument)
