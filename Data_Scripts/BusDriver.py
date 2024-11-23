import random
import numpy as np
import pandas as pd
from collections import defaultdict


def generate_phoneNumber():
    first_digit = str(random.randint(1, 9))
    remaining_digits = "".join([str(random.randint(0, 9)) for _ in range(9)])
    phone_number = first_digit + remaining_digits
    return phone_number


ids = pd.read_csv("Buses.csv")["Bus_Number_Plate"].to_numpy()
ids = ids.reshape((10000,))
fake_data = defaultdict(list)
first_Names = ['Sourav', 'Arun', 'Rajesh', 'Meera', 'Neha', 'Sanjay', 'Amit', 'Kavita', 'Ashwin', 'Vedant', 'Sita', 'Vikram', 'Priya', 'Shivam']
last_Names = ['Yadav', 'Sharma', 'Sheoran', 'Singh', 'Patel', 'Gupta', 'Kumar', 'Jha', 'Verma', 'Goyal', 'Reddy', 'Jindal', 'Mishra', 'Patil']

samples = 10000
for i in range(samples):
    fake_data["Driver_ID"].append(ids[i])
    fake_data["Name"].append(random.choice(first_Names) + " " + random.choice(last_Names))
    fake_data["Rating"].append(float(random.randint(20,50))/10)
    fake_data["PhoneNumber"].append(generate_phoneNumber())

df = pd.DataFrame(fake_data)
df.to_csv("BusDriver.csv",index = False)
