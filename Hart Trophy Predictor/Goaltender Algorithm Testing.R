install.packages('readxl')
library('readxl')
# Upload data, removing unneeded statistics
goalie09 <- read_excel('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Goalie Data/goalies_08-09.xlsx', sheet = 2)
goalie09 <- subset(goalie09, select = -c(Rk, Age, GP, L, GA, SV, SOG, SO, TIME, G, A, P, PIM))
goalie09 <- goalie09[, c(1,2,5,3,4)]