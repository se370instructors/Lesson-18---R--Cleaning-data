## SE370 AY22-2
## Lesson 18 In-Class activity

setwd("C:/Users/erin.williams/Desktop/SE370_21_2/Lessons/Lesson 19")

library(dplyr)
library(tidyr)
library(readr)

# Read in the data
data <- read.csv("fifa_data_2.csv")

#---Which soccer teams have the highest concentration of talent?  
# Create a new dataframe called team_scores. It should do the following:
# 1. Group by club and summarise by summing overall score (which is the player's ranking)
# 2. Filtering out any blanks for the club
# 3. Display only the 25 highest totals
# 4. Arrange in descending order


team_scores <- data %>%
  group_by(Club) %>%
  summarize(total = sum(Overall)) %>%
  filter(Club != '') %>%
  top_n(25, total) %>%
  arrange(-total)


#---Can a player's size predict how aggressive he is?
# For this question, we want to create a plot! 
# Unfortunately, our height is current a character value and we need to make it
# a continuous numeric value for plotting purposes.

# To approach this, do the following:
# 1. Convert the player height from a character to a numeric argument. This is a 
# multi-step process! Think: drop NAs, separate feet & inches, convert to numeric, covert to 
# either pure inches or pure feet, then unit the column back together.
# 2. Once that is complete (phew!), group by height and find the mean Aggression 
# score at each height

aggression <- data %>%
  select(Height, Aggression) %>%
  separate(Height, into= c("feet", "inches"), sep= "'") %>%
  drop_na(feet, inches) %>%
  mutate(feet = as.integer(feet), inches = as.numeric(inches)) %>%
  mutate(inches = (inches / 12)*100, inches = as.integer(inches)) %>%
  unite(feet, inches, col = "Height", sep = ".") %>%
  group_by(Height) %>%
  summarise(aggression = mean(Aggression), count = n())

# Plot using the plot() function

plot(aggression$Height, aggression$aggression)

# Aggression is considered the player's chances of coming out on top 
# in a 50/50 challenge with an opponent. Based on this -- is there a certain
# height or height range where players score highest in this metric?

# yes, between 5.8 ft and 6.0 ft


#--- Are older players more composed? What age(s) score highest on this?
# Follow a similar approach to the last question to answer this!
# However, you won't need to convert data types :) 

age_composure <- data %>%
  group_by(Age) %>%
  drop_na(Composure) %>%
  summarise(com_mean = mean(Composure))

# plot

plot(age_composure$Age, age_composure$com_mean)


#--- Which 25 teams have the most powerful players?
# The power metrics are Shot Power, Jumping, Stamina, Strength, and Long Shots
# Think through how you might create a metric that allows you to compare 
# all these values between teams!
# HINT: It may be valueable to summarise by MORE THAN ONE metric, and also beneficial
# to get a count of players on each team.

power <- data %>%
  group_by(Club) %>%
  summarise(ShotPower = mean(ShotPower, na.rm = TRUE), Jumping = mean(Jumping, na.rm = TRUE), Stamina = mean(Stamina, na.rm = TRUE), 
            Strength = mean(Strength, na.rm = TRUE), LongShots = mean(LongShots, na.rm = TRUE), count = n()) %>%
  drop_na(ShotPower:count) %>%
  mutate(Power_score = ShotPower + Jumping + Stamina + Strength + LongShots) %>%
  arrange(-Power_score) %>%
  top_n(25)

#--- YOUR TURN
# Consider the goalkeeper data. (Columns GK Diving to GK Reflexes)
# Create a dataframe that provides insight on goalkeepers. 
# You could find the best goalkeepers, see how goalkeepers match up with their 
# team's offensive players, check on age of goalkeepers, etc.
