# Install readxl package
install.packages('readxl')
library('readxl')
# Upload data, removing unneeded statistics
goalie09 <- read_excel('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_08-09.xlsx', sheet = 2)
goalie09 <- subset(goalie09, select = -c(Rk, Age, GP, L, GA, SV, SOG, SO, TIME, G, A, P, PIM))
goalie09 <- goalie09[, c(1,2,5,3,4)]
# create new df column for Hart Trophy points based off of goalie wins
hart <- c()
for (i in 1:nrow(goalie09)) {
   hart <- c(hart, goalie09$W[i])
}
goalie09$hart_points <- hart
# award Hart Trophy points based on a goalie's SV%
for (i in 1:nrow(goalie09)) {
   sv <- (goalie09$'SV%'[i]*1000 - 910)*5/4
   goalie09$hart_points[i] <- goalie09$hart_points[i] + sv
}
# award Hart Trophy Points based on a goalie's GAA
for (i in 1:nrow(goalie09)) {
   gaa <- 50 - (goalie09$GAA[i]*100 - 150)/3
   goalie09$hart_points[i] <- goalie09$hart_points[i] + gaa
}
# deduct Hart Trophy points for having less than 25 wins
for (i in 1:nrow(goalie09)) {
   if (goalie09$W[i] < 25) {
      goalie09$hart_points[i] <- goalie09$hart_points[i] - 15
   }
} 
# round the Hart Trophy points column to a whole number
for (i in 1:nrow(goalie09)) {
   goalie09$hart_points[i] <- floor(goalie09$hart_points[i])
}
# sort the df by Hart Trophy points in descending order
goalie09 <- goalie09[order(goalie09$hart_points, decreasing = TRUE),]
View(goalie09)
