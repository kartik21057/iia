import random

import pandas as pd
from collections import defaultdict

fake_data = defaultdict(list)

airlines_name = ['AirAsia India Airline', 'Air India Airline', 'Air India Express Airline', 'Go First Airline',
     'IndiGo Airline', 'SpiceJet', 'Vistara', 'Alliance Air', 'FlyBig', 'Star Air',
     'TruJet', 'Dove Airlines', 'Blue Dart Aviation', 'Quikjet Airlines']

for i in range(len(airlines_name)):
    fake_data["Airline_ID"].append(i+1)
    fake_data["Airline_Name"].append(airlines_name[i])
    fake_data["Country"].append("INDIA")
    fake_data["Rating"].append(float(random.randint(30,50))/10)

df = pd.DataFrame(fake_data)
df.to_csv("AirlineTable.csv",index = False)

