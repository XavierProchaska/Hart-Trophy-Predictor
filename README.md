# Hart Trophy Predictor
The Hart Trophy Predictor is designed to accurately determine which NHL player will win the NHL Hart Memorial Trophy in a given season. The formulas I have created are based upon the previous 15 years of voting data alongside common NHL statistics that are most strongly correlated with what voters consider valuable to an NHL organization's success.
## How It Works

### Introduction
To begin with, all players are divided into three main groups: Forwards, Defensemen, and Goaltenders. This way, players can first be weighted against other players with the same position and then against players from the other two groups.
Therefore, the Hart Trophy Predictor is acutally three separate formulas (one for each group) that are then merged together to compare all players in the NHL.
### Forwards
Being that forwards make up the largest portion of NHL players of the three groups they also have the most readily available Hart voting data to draw inferences from. For this reason I believe that the Forward's Formula is the most accurate of the three. The formula is as follows:

Forward Hart Points (FHP) = Points + Playoff Bonus (PB) + Fifty Goal Bonus (FGB)

