defensemen_hart_points <- function(raw_data, playoffs) {
    new_data <- read.csv(raw_data)
    new_data <- subset(new_data, situation == 'all', select = c(name, team, position, I_F_goals, I_F_points))
    new_data <- subset(new_data, position == 'D')

    hart <- c()
    for (i in 1:nrow(new_data)) {
       hart <- c(hart, new_data$I_F_points[i])
    }

    for (i in 1:nrow(new_data)) {
       if (toString(new_data$team[i]) %in% playoffs) {
          hart[i] <- hart[i] + 10
       }
       else {
          hart[i] <- hart[i] - 5
       }
    }
    new_data$hart_points <- hart
    new_data <- new_data[order(new_data$hart_points, decreasing = TRUE),]

    for (i in 1:nrow(new_data)) {
       if (new_data$I_F_points[i] >= 90) {
          new_data$hart_points[i] <- new_data$hart_points[i] + 15
       }
       else if (new_data$I_F_points[i] >= 80) {
          new_data$hart_points[i] <- new_data$hart_points[i] + 10
       }
       else if (new_data$I_F_points[i] >= 70) {
          new_data$hart_points[i] <- new_data$hart_points[i] + 5
       }
    }
    return(head(new_data, n = 10L))
}
defensemen_hart_points('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_21-22.csv', playoffteams22)
