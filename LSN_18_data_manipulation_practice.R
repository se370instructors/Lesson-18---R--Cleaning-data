## SE370 AY22-2
## Lesson 18 In-Class activity

library(dplyr)
library(tidyr)
library(readr)

# Read in the data


#---Which soccer teams have the highest concentration of talent?  
# Create a new dataframe called team_scores. It should do the following:
# 1. Group by club and summarise by summing overall score (which is the player's ranking)
# 2. Filtering out any blanks for the club
# 3. Display only the 25 highest totals
# 4. Arrange in descending order



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



# Plot using the plot() function



# Aggression is considered the player's chances of coming out on top 
# in a 50/50 challenge with an opponent. Based on this -- is there a certain
# height or height range where players score highest in this metric?




#--- Are older players more composed? What age(s) score highest on this?
# Follow a similar approach to the last question to answer this!
# However, you won't need to convert data types :) 



# plot




#--- Which 25 teams have the most powerful players?
# The power metrics are Shot Power, Jumping, Stamina, Strength, and Long Shots
# Think through how you might create a metric that allows you to compare 
# all these values between teams!
# HINT: It may be valueable to summarise by MORE THAN ONE metric, and also beneficial
# to get a count of players on each team.


#--- YOUR TURN
# Consider the goalkeeper data. (Columns GK Diving to GK Reflexes)
# Create a dataframe that provides insight on goalkeepers. 
# You could find the best goalkeepers, see how goalkeepers match up with their 
# team's offensive players, check on age of goalkeepers, etc.
