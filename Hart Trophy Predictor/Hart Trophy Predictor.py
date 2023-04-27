import pandas as pd
import numpy as np
def hart_trophy_predictor(skater_data, goalie_data, playoffs):
    hart_skater_data = pd.read_csv(skater_data)
    hart_skater_data = hart_skater_data.loc[hart_skater_data['situation'] == 'all',:]
    hart_skater_data = hart_skater_data[['name', 'team', 'position', 'I_F_goals', 'I_F_points']]
    
    hart_skater_data['hart_points'] = hart_skater_data['I_F_points']
    hart_skater_data['hart_points'] = np.where((hart_skater_data['I_F_goals'] >= 50) & (hart_skater_data['I_F_points'] >= 80) 
                                               & (hart_skater_data['position'] != 'D'), hart_skater_data['hart_points'] + 20, 
                                               hart_skater_data['hart_points'])
    hart_skater_data['hart_points'] = np.where((hart_skater_data['position'] == 'D') & (hart_skater_data['I_F_points'] >= 90),
                                               hart_skater_data['hart_points'] + 15, hart_skater_data['hart_points'])
    hart_skater_data['hart_points'] = np.where((hart_skater_data['position'] == 'D') & (hart_skater_data['I_F_points'] < 90) 
                                               & (hart_skater_data['I_F_points'] >= 80), hart_skater_data['hart_points'] + 10,
                                                 hart_skater_data['hart_points'])
    hart_skater_data['hart_points'] = np.where((hart_skater_data['position'] == 'D') & (hart_skater_data['I_F_points'] < 80) 
                                               & (hart_skater_data['I_F_points'] >= 70), hart_skater_data['hart_points'] + 5,
                                                 hart_skater_data['hart_points'])
    hart_skater_data = hart_skater_data.sort_values(by=['hart_points'], ascending=False)
    return(hart_skater_data.head(15))
print(hart_trophy_predictor('/home/xavier/Documents/Git Repositories/Hart-Trophy-Predictor/Hart Trophy Predictor/Raw Data/Skater Data/skaters_21-22.csv',0,0))
