import pandas as pd
import random
from collections import defaultdict

classes = ["ECO","BUS","FST"]
price = [(5000,10000),(10000,20000),(20000,30000)]
capacity = [(100,300),(50,100),(20,50)]
fake_data = defaultdict(list)
samples = 1000
for i in range(samples):
    for j in range(3):
        fake_data["Class_Name"].append(str(i+1) + "_" + classes[j])
        fake_data["Price"].append(random.randint(price[j][0],price[j][1]))
        fake_data["Capacity"].append(random.randint(capacity[j][0],capacity[j][1]))
        fake_data["Class_Code"].append(classes[j])
        fake_data["Flight_ID"].append(i+1)

df = pd.DataFrame(fake_data)
df.to_csv("FlightClass.csv",index = False)