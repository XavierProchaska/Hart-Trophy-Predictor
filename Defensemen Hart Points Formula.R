defensemen_hart_points <- function(raw_data, playoffs) {
    new_data <- read.csv(raw_data)
    new_data <- subset(new_data, situation == 'all', select = c(name, team, position, I_F_points, I_F_goals))
    new_data <- subset(new_data, position == 'D')

    hart <- c()
    for (i in 1:nrow(new_data)) {
       hart <- c(hart, new_data$I_F_points[i])
    }

    for (j in 1:nrow(new_data)) {
       if (toString(new_data$team) %in% playoffs) {
          hart[j] <- hart[j] + 10
       }
       else {
          hart[j] <- hart[j] - 5
       }
    }
    new_data$hart_points <- hart

    return(head(new_data, n = 10L))
}
defensemen_hart_points('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_11-12.csv', playoffteams12)