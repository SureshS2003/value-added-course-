# Importing Dataset
Heart <- read.csv("heart.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Heart)

# Datatypes Check
str(Heart)

# Datatype Conversion
Heart$sex <- as.factor(Heart$sex)
Heart$cp <- as.factor(Heart$cp)
Heart$restecg <- as.factor(Heart$restecg)
Heart$fbs <- as.factor(Heart$fbs)

# Datatypes Recheck
str(Heart)

# Express Table for people restecg
prop.table(table(Heart$restecg))

# Importing Library
library(ggplot2)


# People restecg Bar graph
ggplot(Heart, aes(x = restecg)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Patient count", title = "Heart rate restecg")


# Gender wise restecg Plot
ggplot(Heart, aes(x = sex, fill = restecg)) + theme_light() + 
  geom_bar() + 
  labs(y = "Patient count", 
       title = "Heart rate restecg by gender")


# Plot for restecg based on cp
ggplot(Heart, aes(x = cp, fill = restecg)) + theme_light() + 
  geom_bar() + 
  labs(y = "Patient count", 
       title = "Heart rate restecg by cp")


# Plot for gender based restecg from each cp
ggplot(Heart, aes(x = sex, fill = restecg)) + theme_light() + 
  facet_grid(~cp) + geom_bar() + 
  labs(y = "Patient count", 
       title = "Heart rate resecg by cp and gender")


# Pie chart for restecg ratio in each cp
ggplot(Heart, aes(x = "", fill = restecg)) + 
  geom_bar(position = "fill") + 
  facet_grid(~cp) + coord_polar(theta = "y")


# Plot for age group survival distribution
ggplot(Heart, aes(x = age, fill = restecg)) + 
  theme_bw() + geom_histogram(binwidth = 5) +
  labs(y = "Patient count", x = "Age", 
       title = "Heart rate wrt Age distribution")


# Box Plot for survival rate by age
ggplot(Heart, aes(x = restecg, y = age)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "age", x = "restecg", 
       title = "Heart rate by age")


# Density plot
ggplot(Heart, aes(x = age, fill = restecg)) + theme_bw() + 
  facet_wrap(sex~cp) + geom_density(alpha = 0.5) + 
  labs(y = "age", x = "restecg", 
       title = "Heart rate by age, class and gender")