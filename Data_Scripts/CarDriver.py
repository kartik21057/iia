import random
from collections import defaultdict
import string
import numpy as np
import pandas as pd


def generate_phoneNumber():
    first_digit = str(random.randint(1, 9))
    remaining_digits = "".join([str(random.randint(0, 9)) for _ in range(9)])
    phone_number = first_digit + remaining_digits
    return phone_number


def generate_random_number_plate():
    random_digits = ''.join(random.choices(string.digits, k=4))
    random_letters = ''.join(random.choices(string.ascii_uppercase, k=2))
    random_string = f"BH {random_digits} {random_letters}"
    return random_string


cities = pd.read_csv("Cities.csv")
cities = cities.iloc[1:,0].to_numpy()

fake_data = defaultdict(list)
first_Names = ['Sourav', 'Arun', 'Rajesh', 'Meera', 'Neha', 'Sanjay', 'Amit', 'Kavita', 'Ashwin', 'Vedant', 'Sita', 'Vikram', 'Priya', 'Shivam']
last_Names = ['Yadav', 'Sharma', 'Sheoran', 'Singh', 'Patel', 'Gupta', 'Kumar', 'Jha', 'Verma', 'Goyal', 'Reddy', 'Jindal', 'Mishra', 'Patil']
samples = 10000
for i in range(samples):
    fake_data["Driver_ID"].append(i+1)
    number_plate = generate_random_number_plate()
    while "Car_Number_Plater" in fake_data and number_plate in fake_data["Car_Number_Plate"]:
        number_plate = generate_random_number_plate()
    fake_data["Car_Number_Plate"].append(number_plate)
    fake_data["Driver_Name"].append(random.choice(first_Names) + " " + random.choice(last_Names))
    fake_data["Total_Rides"].append(random.randint(30,150))
    fake_data["Rating"].append(float(random.randint(20,50))/10)
    fake_data["Phone_Number"].append(generate_phoneNumber())
    fake_data["City"].append(np.random.choice(cities))

df = pd.DataFrame(fake_data)
df.to_csv("CarDriver.csv",index = False)
