# -*- coding: utf-8 -*-
"""
Created on Sun Apr 14 01:36:20 2024

@author: david
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Data Preparation
data = pd.read_csv("C:/Users/david/OneDrive/Documents/AIT 580/air-traffic-passenger-statistics-1.csv")

# Data Exploration
print(data.head())
print(data.describe())

# Statistical Summaries
print(data['Passenger Count'].describe())

# Visualizations
plt.hist(data['Passenger Count'], bins=20, color='skyblue', edgecolor='black')
plt.title('Passenger Count Distribution')
plt.xlabel('Passenger Count')
plt.ylabel('Frequency')
plt.show()


#QUESTION1
# Filter out only international flights
international_flights = data[data['GEO Summary'] == 'International']

# Group by GEO Region and Operating Airline, summing the passenger counts
passenger_activity = international_flights.groupby(['GEO Region', 'Operating Airline']).sum().reset_index()

# Plotting
plt.figure(figsize=(12, 8))
sns.barplot(x='Passenger Count', y='GEO Region', hue='Operating Airline', data=passenger_activity, ci=None)
plt.title('Passenger Activity Across International Regions by Operating Airline')
plt.xlabel('Passenger Count')
plt.ylabel('International Region')
plt.show()


#QUESTION 2
# Plotting
plt.figure(figsize=(10, 6))
sns.boxplot(x='Price Category Code', y='Passenger Count', hue='GEO Summary', data=data)
plt.title('Relationship between Passenger Counts and Price Categories')
plt.xlabel('Price Category')
plt.ylabel('Passenger Count')
plt.show()


#QUESSTION3
# Group by Terminal, Boarding Area, and GEO Summary, summing the passenger counts
terminal_boarding_activity = data.groupby(['Terminal', 'Boarding Area', 'GEO Summary']).sum().reset_index()

# Plotting
plt.figure(figsize=(12, 8))
sns.barplot(x='Passenger Count', y='Terminal', hue='Boarding Area', data=terminal_boarding_activity, ci=None)
plt.title('Passenger Activity by Terminal and Boarding Area')
plt.xlabel('Passenger Count')
plt.ylabel('Terminal')
plt.show()

