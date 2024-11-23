import os
import pandas as pd

l = {'Mumbai'}
with open('bus_stations.txt', 'r') as file:
    idx = 0
    for line in file:
        if idx == 0:
            idx += 1
            continue
        # Remove parentheses and split the string into parts
        parts = line.strip('()\n').split(',')

        # Extract the values from the parts and create a tuple
        entry = (int(parts[0]), parts[1].strip("' "), parts[2].strip("' "), parts[3].strip("' "), parts[4].strip("' "))

        # Append the entry to the list
        l.add(entry[2])

# # Now you can work with the extracted data
# print(entry)
# df1 = pd.read_csv("bus_stations.txt")
# for i in range(df1.shape[0]):
#     l.add(df1.iloc[i,2])
#
with open('Airport Table.txt', 'r') as file:
    idx = 0
    for line in file:
        if idx == 0:
            idx += 1
            continue
        # Remove parentheses and split the string into parts
        parts = line.strip('()\n').split(',')

        # Extract the values from the parts and create a tuple
        entry = (int(parts[0]), parts[1].strip("' "), parts[2].strip("' "), parts[3].strip("' "), parts[4].strip("' "))

        # Append the entry to the list
        l.add(entry[2])

with open('Hotel.txt', 'r') as file:
    idx = 0
    for line in file:
        if idx == 0:
            idx += 1
            continue
        # Remove parentheses and split the string into parts
        parts = line.strip('()\n').split(',')

        # Extract the values from the parts and create a tuple
        entry = (int(parts[0]), parts[1].strip("' "), parts[2].strip("' "), parts[3].strip("' "), parts[4].strip("' "))

        # Append the entry to the list
        l.add(entry[3])

with open('Train_Stations.txt', 'r') as file:
    idx = 0
    for line in file:
        if idx == 0:
            idx += 1
            continue
        # Remove parentheses and split the string into parts
        parts = line.strip('()\n').split(',')

        # Extract the values from the parts and create a tuple
        entry = (int(parts[0]), parts[1].strip("' "), parts[2].strip("' "), parts[3].strip("' "), parts[4].strip("' "))

        # Append the entry to the list
        l.add(entry[2])

with open('CarDriver.txt', 'r') as file:
    idx = 0
    for line in file:
        if idx == 0:
            idx += 1
            continue
        # Remove parentheses and split the string into parts
        parts = line.strip('()\n').split(',')

        # Extract the values from the parts and create a tuple
        entry = (int(parts[0]), parts[1].strip("' "), parts[2].strip("' "), parts[3].strip("' "), parts[4].strip("' "),parts[6].strip("' "))

        # Append the entry to the list
        l.add(entry[5])

indian_states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Jammu and Kashmir'
]
for i in indian_states:
    if i in l:
        l.remove(i)

ans = list(l)
res = []
for i in ans:
    s = i.replace(")","")
    s = s.replace("'","")
    s = s.replace(";","")
    res.append(s)

df = pd.DataFrame(res)
df.to_csv("Cities.csv")