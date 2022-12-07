hart_position09 <- c(8, 13, 17, 24)
dmen09 <- c('Zdeno Chara', 'Mike Green', 'Nicklas Lidstrom', 'Dan Boyle')
d_goals09 <- c(19, 31, 16, 16)
d_assists09 <- c(31, 42, 43, 41)
d_points09 <- d_goals09 + d_assists09
d_playoffs09 <- c('Yes', 'Yes', 'Yes', 'Yes')
dmen_scoring_data09 <- data.frame(hart_position09, dmen09, d_goals09, d_assists09, d_points09, d_playoffs09)
colnames(dmen_scoring_data09) <- c('Pos', 'Player', 'G', 'A', 'PTS', 'Playoffs?')

