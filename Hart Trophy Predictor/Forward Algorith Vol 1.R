skater22 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_21-22.csv')
skater22 <- subset(skater22, situation == 'all', select = c(name, team, position, I_F_points, I_F_goals))
skater22 <- subset(skater22, position != 'D')
hart <- c()
for (i in 1:nrow(skater22)) {
  hart <- c(hart, skater22$I_F_points[i])
}
playoffs22 <- c('CAR', 'NYR', 'PIT', 'FLA', 'TOR', 'TBL', 'BOS', 'WSH', 'COL',
                'MIN', 'STL', 'CGY', 'EDM', 'LAK', 'DAL', 'NSH')
for (j in 1:length(hart)) {
  if(toString(skater22$team[j]) %in% playoffs22) {
    hart[j] <- hart[j] + 10
  }
}
skater22$hart_points <- hart
