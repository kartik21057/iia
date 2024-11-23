import pandas as pd
import random
from collections import defaultdict

classes = ["SLP","3AC","CC","EC"]
price = [(250,500),(500,1000),(1000,1500),(1500,3000)]
capacity = [(200,500),(200,500),(200,500),(200,500)]
fake_data = defaultdict(list)
samples = 5000
for i in range(samples):
    for j in range(4):
        fake_data["Class_Name"].append(str(i+1) + "_" + classes[j])
        fake_data["Price"].append(random.randint(price[j][0],price[j][1]))
        fake_data["Capacity"].append(random.randint(capacity[j][0],capacity[j][1]))
        fake_data["Class_Code"].append(classes[j])
        fake_data["Train_ID"].append(i+1)

df = pd.DataFrame(fake_data)
df.to_csv("TrainClass.csv",index = False)