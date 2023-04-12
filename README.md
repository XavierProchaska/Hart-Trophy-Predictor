# Hart Trophy Predictor
The Hart Trophy Predictor is designed to accurately determine which NHL player will win the NHL Hart Memorial Trophy in a given season. The formulas I have created are based upon the previous 15 years of voting data alongside common NHL statistics that are most strongly correlated with what voters consider valuable to an NHL organization's success.
## How It Works

### Introduction
To begin with, all players are divided into three main groups: Forwards, Defensemen, and Goaltenders. This way, players can first be weighted against other players with the same position and then against players from the other two groups.
Therefore, the Hart Trophy Predictor is acutally three separate formulas (one for each group) that are then merged together to compare all players in the NHL.
### Forwards
Being that forwards make up the largest portion of NHL players of the three groups they also have the most readily available Hart voting data to draw inferences from. For this reason I believe that the Forward's Formula is the most accurate of the three. The formula is as follows:

Forward Hart Points (FHP) = Points + Playoff Bonus (PB) + Fifty Goal Bonus (FGB)

Each forward is given one Hart Point for each of the points (goals and assists) they score over the course of the regular season. Each forward also has the opportunity to recieve up to two bonuses. Any forward whose team makes the playoffs will receive a bonus of 10 Hart Points and any forward who scores 50 or more goals while also scoring 80 or more points will receive a bonus of 20 Hart Points.
### Defensemen
The Hart Points formula for defensemen is as follows:

Defensemen Hart Points (DHP) = Points + PB + Scoring Bonus (SB)

Similar to the forwards, each defensemen is given one Hart Point for each point they score during the regular season and can receive 10 bonus points if their team makes the playoffs. In addition, defensemen will receive bonus points based on how many points they scored in the regular season. Any defensemen who scores between 70 and 79 points will receive 5 bonus Hart Points; any defensemen who scores between 80 and 89 points will receive 10 bonus Hart Points; any defensemen who scores 90 or more points will receive 15 bonus Hart Points.
### Goaltenders
Given that a goaltender's main goal is to prevent goals rather than score them, the Hart Points formula for goaltenders is very different from the Hart Points formulas for forwards and defensemen. The four statistics I considered while grading goalies were Wins, Save Percentage, Goals Against Average, and Shutouts. The Hart Points formula for goaltenders is as follows:

Goaltender Hart Points (GHP) = Wins + ((SV%*1000 - 910)*5/4) + (50 - ((GAA*100 - 150)/3)) + PB + Shootout Bonus (SOB)

Each goaltender is given one Hart Point for each win during the regular season. Then they are awarded Hart Points for their Goals Against Average and Save Percentage, and can earn bonuses for making the playoffs or recording ten or more shutouts.
### Teammate Correction
After each player is awarded the corresponing amount of Hart Points, they are all added to the same dataframe which is then sorted by Hart Points. Finally, in order to correct for multiple MVP caliber players being on the same team, if any of the top 5 players in Hart Points are on the same team then those players will be deducted 10 Hart Points.
## How To Use The Hart Trophy Predictor

### Cloning The Repository
To clone the Hart Trophy Predictor repository go to the main page of the repository, click on the green Code button and copy one of the HTTPS, SSH, or CLI links.
### Important Files
Upon cloning the repository you will see a number of .R files. To use the Hart Trophy Predictor the only parts of the repository you need to focus on are: Hart Trophy Predictor.R, Playoff Lists.R, and the Raw Data folder. Playoff Lists.R contains lists of the playoff teams in each season from the 2008-09 to the 2021-22 season. The Raw Data folder contains season to season data for skaters and goaltenders from 2009-2022.
### Using The Hart Trophy Predictor Function
To use the code, call the Hart Trophy Predictor using the path for the skater and goalie data for the season you want to test, along with the list of playoff teams from that season. I have provided an example below:
```R
hart_trophy_predictor('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Skater Data/skaters_15-16.csv',
'/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_15-16.xlsx',
playoffteams16)
```
This will return the top 50 players in Hart Points for the 2015-2016 season according to my predictor.
## Contributing
