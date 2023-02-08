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
