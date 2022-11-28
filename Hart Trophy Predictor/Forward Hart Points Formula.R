forward_hart_points <- function(raw_data, playoffs) {
  new_data <- read.csv(raw_data)
  new_data <- subset(new_data, situation == 'all', select = c(name, team, position, I_F_points, I_F_goals))
  new_data <- subset(new_data, position != 'D')

  hart <- c()
  for (i in 1:nrow(new_data)) {
    hart <- c(hart, new_data$I_F_points[i])
  }
  
  for (j in 1:length(hart)) {
    if(toString(new_data$team[j]) %in% playoffs) {
      hart[j] <- hart[j] + 10
    }
  }
  new_data$hart_points <- hart
  
  for (k in 1:nrow(new_data)) {
    if(new_data$I_F_goals[k] >= 50) {
      new_data$hart_points[k] <- new_data$hart_points[k] + 20
    }
  }
  new_data <- new_data[order(new_data$hart_points, decreasing = TRUE),]
  
  for (l in 1:5) {
    for (m in 1:5) {
      if(l != m) {
        if(new_data$team[l] == new_data$team[m]) {
          new_data$hart_points[l] <- new_data$hart_points[l] - 10
        }
      }
    }
  }
  new_data <- new_data[order(new_data$hart_points, decreasing = TRUE),]
  return(head(new_data, n = 10L))
}
forward_hart_points('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_21-22.csv', playoffteams22)
