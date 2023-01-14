install.packages('readxl')
library('readxl')
# when making final formula, perform multiple steps with one for loop if possible
goaltender_hart_points <- function(raw_data) {
    new_data <- read_excel(raw_data, sheet = 2)
    new_data <- subset(new_data, select = -c(Rk, Age, GP, L, GA, SV, SOG, SO, TIME, G, A, P, PIM))
    new_data <- new_data[, c(1,2,5,3,4)]

    hart <- c()
    for (i in 1:nrow(new_data)) {
       hart <- c(hart, new_data$W[i])
    }
    new_data$hart_points <- hart

    for (i in 1:nrow(new_data)) {
       sv <- (new_data$'SV%'[i]*1000 - 910)*5/4
       new_data$hart_points[i] <- new_data$hart_points[i] + sv
    }

    for (i in 1:nrow(new_data)) {
       gaa <- 50 - (new_data$GAA[i]*100 - 150)/3
       new_data$hart_points[i] <- new_data$hart_points[i] + gaa
    }

    for (i in 1:nrow(new_data)) {
       if (new_data$W[i] < 25) {
          new_data$hart_points[i] <- new_data$hart_points[i] - 15
       }
    }

    for (i in 1:nrow(new_data)) {
       new_data$hart_points[i] <- floor(new_data$hart_points[i])
    }

    new_data <- new_data[order(new_data$hart_points, decreasing = TRUE),]
    return(head(new_data, n = 10L))
}
goaltender_hart_points('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/goalies_08-09.xlsx')