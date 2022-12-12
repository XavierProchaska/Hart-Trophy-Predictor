# Upload data, removing unneeded statistics
goalie09 <- read.csv('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_08-09.csv')
goalie09 <- subset(goalie09, situation == 'all', select = c(name, team, games_played, goals, ongoal))
colnames(goalie09) <- c('name', 'team', 'games', 'goals_allowed', 'shots_allowed')
# Create new column for goals against average by dividing goals allowed by number of games
gaa <- c()
for (i in 1:nrow(goalie09)) {
   gaa <- c(gaa, (goalie09$goals_allowed[i]/goalie09$games[i]))
}
goalie09$GAA <- gaa
# Create new column for save percentage based on the percentage of shots allowed resulting in goals
save_percentage <- c()
for (j in 1:nrow(goalie09)) {
   save_percentage <- c(save_percentage, (1 - (goalie09$goals_allowed[j]/goalie09$shots_allowed[j])))
}
goalie09$'SV%' <- save_percentage
