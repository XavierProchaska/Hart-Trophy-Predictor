# Upload data, removing unneeded statistics and isolating forwards
skater22 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_21-22.csv')
skater22 <- subset(skater22, situation == 'all', select = c(name, team, position, I_F_points, I_F_goals))
skater22 <- subset(skater22, position != 'D')
# create new df column for Hart Trophy points based on total points scored
hart <- c()
for (i in 1:nrow(skater22)) {
  hart <- c(hart, skater22$I_F_points[i])
}
# add 10 Hart Trophy points to each player whose team made the playoffs that season
playoffs22 <- c('CAR', 'NYR', 'PIT', 'FLA', 'TOR', 'TBL', 'BOS', 'WSH', 'COL',
                'MIN', 'STL', 'CGY', 'EDM', 'LAK', 'DAL', 'NSH')
for (j in 1:length(hart)) {
  if(toString(skater22$team[j]) %in% playoffs22) {
    hart[j] <- hart[j] + 10
  }
}
skater22$hart_points <- hart
# add 20 Hart Trophy points to each player who scored 50 or more goals
for (k in 1:nrow(skater22)) {
  if(skater22$I_F_goals[k] >= 50) {
    skater22$hart_points[k] <- skater22$hart_points[k] + 20
  }
}
# sort the df by Hart Trophy points in descending order
skater22 <- skater22[order(skater22$hart_points, decreasing = TRUE),]
# of the top five players by Hart Trophy points, 
# if two or more are teammates remove 10 points from all such players
for (l in 1:5) {
  for (m in 1:5) {
    if(l != m) {
      if(skater22$team[l] == skater22$team[m]) {
        skater22$hart_points[l] <- skater22$hart_points[l] - 10
      }
    }
  }
}
# sort the df by Hart Trophy points in descending order again
skater22 <- skater22[order(skater22$hart_points, decreasing = TRUE),]
