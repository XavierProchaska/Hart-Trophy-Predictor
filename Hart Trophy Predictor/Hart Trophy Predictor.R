# install readxl package to be able to read .xlsx files
install.packages('readxl')
library('readxl')

hart_trophy_predictor  <- function(skater_data, goalie_data, playoffs) {
   # read in the skater data, removing unnecessary statistics
   hart_skater_data <- read.csv(skater_data)
   hart_skater_data <- subset(hart_skater_data, situation = 'all', select = c(name, team, position, I_F_goals, I_F_points))
   # create new df column 'hart points' based on each skater's point total
   hart <- c()
   for (i in 1:nrow(hart_skater_data)) {
      hart <- c(hart, hart_skater_data$I_F_points[i])
   }
   hart_skater_data$hart_points <- hart
   # give bonus points for playoffs, 50 goal seasons, and defenseman scoring
   for (i in 1:nrow(hart_skater_data)) {
      if (hart_skater_data$position[i] != 'D') {
         if (hart_skater_data$I_F_goals[i] >= 50 && hart_skater_data$I_F_points[i] >= 80) {
            hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] + 20
         }
      }
      else {
         if (hart_skater_data$I_F_points[i] >= 90) {
            hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] + 15
         }
         else if (hart_skater_data$I_F_points[i] >= 80) {
            hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] + 10
         }
         else if (hart_skater_data$I_F_points[i] >= 70) {
            hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] + 5
         }
      }
      if (toString(hart_skater_data$team[i]) %in% playoffs) {
         hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] + 10
      }
      else {
         hart_skater_data$hart_points[i] <- hart_skater_data$hart_points[i] - 5
      }
   }
   # sort the df by hart points and return
   hart_skater_data <- hart_skater_data[order(hart_skater_data$hart_points, decreasing = TRUE),]
   return(hart_skater_data)
}
test <- hart_trophy_predictor('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Skater Data/skaters_21-22.csv', 1, playoffteams22)
View(test)