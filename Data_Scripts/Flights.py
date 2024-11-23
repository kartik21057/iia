import pandas as pd
import random
import string
from datetime import *
from collections import defaultdict

def generate_random_bus_schedule(start_date, end_date, offset_minutes):
    time_difference = (end_date - start_date).total_seconds()
    random_seconds = random.randint(0, int(time_difference))
    departure_datetime = start_date + timedelta(seconds=random_seconds)
    arrival_datetime = departure_datetime + timedelta(minutes=offset_minutes)
    return departure_datetime, arrival_datetime


def generate_random_number_plate():
    random_digits = ''.join(random.choices(string.digits, k=4))
    random_letters = ''.join(random.choices(string.ascii_uppercase, k=2))
    random_string = f"BH {random_digits} {random_letters}"
    return random_string


start_date = datetime(2023, 9, 1)
end_date = datetime(2023, 10, 30)
fake_data = defaultdict(list)
samples = 1000
for i in range(samples):
    fake_data["Flight_ID"].append(i+1)
    fake_data["Airline_ID"].append(random.randint(1,14))
    dept_ID = random.randint(0,74)
    arriv_ID = random.randint(0,74)
    while dept_ID == arriv_ID:
        arriv_ID = random.randint(0,74)
    fake_data["Departure_ID"].append(dept_ID+1)
    fake_data["Arrival_ID"].append(arriv_ID+1)
    duration = random.randint(300,540)
    depart_time,arriv_time = generate_random_bus_schedule(start_date,end_date,duration)
    fake_data["Departure_Time"].append(depart_time)
    fake_data["Arrival_Time"].append(arriv_time)
    fake_data["Duration"].append(duration)

df = pd.DataFrame(fake_data)
df.to_csv("Flights.csv",index=False)