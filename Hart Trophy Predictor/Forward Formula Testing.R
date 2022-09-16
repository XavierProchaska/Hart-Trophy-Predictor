s_0809 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_08-09.csv')
s_0809 <- subset(s_0809, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))
testdf <- s_0809
testdf[1,]
testdf$I_F_assists <- with(testdf, I_F_points - I_F_goals)
testdf$hart_points <- with(testdf, 2*I_F_assists + 1.5*I_F_goals)
