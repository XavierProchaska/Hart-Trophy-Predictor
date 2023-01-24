# install readxl package to be able to read .xlsx files
install.packages('readxl')
library('readxl')

hart_trophy_predictor  <- function(skater_data, goalie_data, playoffs) {
   # read in the skater data, removing unnecessary statistics
   hart_skater_data <- read.csv(skater_data)
   hart_skater_data <- subset(hart_skater_data, situation == 'all', select = c(name, team, position, I_F_goals, I_F_points))
   # create new df column 'hart points' based on each skater's point total
   hart_s <- c()
   for (i in 1:nrow(hart_skater_data)) {
      hart_s <- c(hart_s, hart_skater_data$I_F_points[i])
   }
   hart_skater_data$hart_points <- hart_s
   # give bonus points for playoffs, 50 goal seasons, and defensemen point totals
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
   # sort the df by hart points
   hart_skater_data <- hart_skater_data[order(hart_skater_data$hart_points, decreasing = TRUE),]


   # read in the goaltender data, removing unnecessary statistics
   hart_goaltender_data <- read_excel(goalie_data, sheet = 2)
   hart_goaltender_data <- subset(hart_goaltender_data, select = -c(Rk, Age, GP, L, GA, SV, SOG, TIME, G, A, P, PIM))
   # create new df column 'hart points' based on each goaltender's win total
   hart_g <- c()
   for (i in 1:nrow(hart_goaltender_data)) {
      hart_g <- c(hart_g, hart_goaltender_data$W[i])
   }
   hart_goaltender_data$hart_points <- hart_g
   # assign hart points for goaltender's GAA and SV%
   # give bonus points for playoffs and shutouts
   # deduct points for less than 25 wins
   for (i in 1:nrow(hart_goaltender_data)) {
      sv <- (hart_goaltender_data$'SV%'[i]*1000 - 910)*5/4
      gaa <- 50 - (hart_goaltender_data$GAA[i]*100 - 150)/3
      hart_goaltender_data$hart_points[i] <- hart_goaltender_data$hart_points[i] + sv + gaa
      if (toString(hart_goaltender_data$Team[i]) %in% playoffs) {
         hart_goaltender_data$hart_points[i] <- hart_goaltender_data$hart_points[i] + 5
      }
      if (hart_goaltender_data$SO[i] >= 10) {
         hart_goaltender_data$hart_points[i] <- hart_goaltender_data$hart_points[i] + hart_goaltender_data$SO[i]
      }
      if (hart_goaltender_data$W[i] < 20) {
         hart_goaltender_data$hart_points[i] <- hart_goaltender_data$hart_points[i] - 45
      }
      else if (hart_goaltender_data$W[i] < 25 && hart_goaltender_data$W[i] >= 20) {
         hart_goaltender_data$hart_points[i] <- hart_goaltender_data$hart_points[i] - 15
      }
   }
   # sort the df by hart points
   hart_goaltender_data <- hart_goaltender_data[order(hart_goaltender_data$hart_points, decreasing = TRUE),]


   # merge the two dataframes by hart points

}
test <- hart_trophy_predictor('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Skater Data/skaters_21-22.csv',
'/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_21-22.xlsx', playoffteams22)
View(test)