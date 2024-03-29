install.packages('readxl')
library('readxl')
# when making final formula, perform multiple steps with one for loop if possible
goaltender_hart_points <- function(raw_data, playoffs) {
    new_data <- read_excel(raw_data, sheet = 2)
    new_data <- subset(new_data, select = -c(Rk, Age, GP, L, GA, SV, SOG, TIME, G, A, P, PIM))
    new_data <- new_data[, c(1,2,5,3,4,6)]

    hart <- c()
    for (i in 1:nrow(new_data)) {
       hart <- c(hart, new_data$W[i])
    }
    new_data$hart_points <- hart

    for (i in 1:nrow(new_data)) {
       if (toString(new_data$Team[i]) %in% playoffs) {
          new_data$hart_points[i] <- new_data$hart_points[i] + 5
       }
    }

    for (i in 1:nrow(new_data)) {
       sv <- (new_data$'SV%'[i]*1000 - 910)*5/4
       new_data$hart_points[i] <- new_data$hart_points[i] + sv
    }

    for (i in 1:nrow(new_data)) {
       gaa <- 50 - (new_data$GAA[i]*100 - 150)/3
       new_data$hart_points[i] <- new_data$hart_points[i] + gaa
    }

    for (i in 1:nrow(new_data)) {
       if (new_data$W[i] < 20) {
          new_data$hart_points[i] <- new_data$hart_points[i] - 45
       }
       else if (new_data$W[i] < 25 && new_data$W[i] >= 20) {
          new_data$hart_points[i] <- new_data$hart_points[i] - 15
       }
    }

    for (i in 1:nrow(new_data)) {
       if (new_data$SO[i] >= 10) {
          new_data$hart_points[i] <- new_data$hart_points[i] + new_data$SO[i]
       }
    }

    for (i in 1:nrow(new_data)) {
       new_data$hart_points[i] <- floor(new_data$hart_points[i])
    }

    new_data <- new_data[order(new_data$hart_points, decreasing = TRUE),]
    return(head(new_data, n = 10L))
}
goaltender_hart_points('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_21-22.xlsx', playoffteams22)
