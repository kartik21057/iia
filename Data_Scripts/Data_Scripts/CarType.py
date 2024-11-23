import random
from collections import defaultdict
import pandas as pd

number_plates = pd.read_csv("CarDriver.csv")["Car_Number_Plate"]
types =  ['Micro', 'Sedan', 'Mini', 'SUV', 'Lux']
capacity = [2,5,4,7,5]
price = [(150,300),(300,500),(200,400),(400,800),(800,1600)]

fake_data = defaultdict(list)
samples = len(number_plates)
for i in range(samples):
    fake_data["Car_ID"].append(number_plates[i])
    idx = random.randint(0,4)
    fake_data["Class"].append(types[idx])
    fake_data["Price"].append(random.randint(price[idx][0],price[idx][1]))
    fake_data["Capacity"].append(capacity[idx])


df = pd.DataFrame(fake_data)
df.to_csv("CarType.csv",index = False)

