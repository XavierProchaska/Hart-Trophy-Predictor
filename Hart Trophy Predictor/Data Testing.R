s_0809 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_08-09.csv')
s_0809 <- subset(s_0809, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_0910 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_09-10.csv')
s_0910 <- subset(s_0910, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1011 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_10-11.csv')
s_1011 <- subset(s_1011, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1112 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_11-12.csv')
s_1112 <- subset(s_1112, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1213 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_12-13.csv')
s_1213 <- subset(s_1213, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1314 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_13-14.csv')
s_1314 <- subset(s_1314, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1415 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_14-15.csv')
s_1415 <- subset(s_1415, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1516 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_15-16.csv')
s_1516 <- subset(s_1516, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1617 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_16-17.csv')
s_1617 <- subset(s_1617, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1718 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_17-18.csv')
s_1718 <- subset(s_1718, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1819 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_18-19.csv')
s_1819 <- subset(s_1819, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_1920 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_19-20.csv')
s_1920 <- subset(s_1920, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_2021 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_20-21.csv')
s_2021 <- subset(s_2021, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))

s_2122 <- read.csv('/home/xavier/Documents/Hart Trophy Predictor/Raw Data/skaters_21-22.csv')
s_2122 <- subset(s_2122, situation == 'all', select = c(name, team, position, games_played, I_F_points, I_F_goals))


season <- c('2008-2009', '2009-2010', '2010-2011', '2011-2012', '2012-2013',
            '2013-2014', '2014-2015', '2015-2016', '2016-2017', '2017-2018',
            '2018-2019', '2019-2020', '2020-2021', '2021-2022')
first <- c('Alex Ovechkin', 'Henrik Sedin', 'Corey Perry', 'Evgeni Malkin', 
           'Alex Ovechkin', 'Sidney Crosby', 'Carey Price', 'Patrick Kane', 
           'Connor McDavid', 'Taylor Hall', 'Nikita Kucherov', 'Leon Draisaitl', 
           'Connor McDavid', 'Auston Matthews')
second <- c('Evgeni Malkin', 'Alex Ovechkin', 'Daniel Sedin', 'Steven Stamkos', 
            'Sidney Crosby', 'Ryan Getslaf', 'Alex Ovechkin', 'Sidney Crosby', 
            'Sidney Crosby', 'Nathan MacKinnon', 'Sidney Crosby', 'Nathan MacKinnon', 
            'Auston Matthews', 'Connor McDavid')
third <- c('Pavel Datsyuk', 'Sidney Crosby', 'Martin St. Louis', 'Henrik Lundqvist', 
           'John Tavares', 'Claude Giroux', 'John Tavares', 'Jamie Benn', 'Sergei Bobrovsky', 
           'Anze Kopitar', 'Connor McDavid', 'Artemi Panarin', 'Nathan MacKinnon', 'Igor Shesterkin')
hart_voting_by_season <- data.frame(season, first, second, third)
