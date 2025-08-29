import pandas as pd
import matplotlib.pyplot as plt
#------Import Data-----
df=pd.read_excel("Portfoliyo/Cardano Analysis Project/data/coin_Cardano.csv Clean.xlsx")
#----Dataset Check----
print(df.head())
print(df.info())
#----Convert Date column into DateTime---
df['Date']=pd.to_datetime(df['Date'])
#---Sort Values---
df=df.sort_values(by="Date")
#--- Basic Statistics
print("Statistics Summary")
print(df.describe())
#Trend Plot of Closing Price
plt.figure(figsize=(10,5))
plt.plot(df["Date"],df["Close"],label="Closing Price",color="blue")
plt.xlabel("Date")
plt.ylabel("Close price (USD)")
plt.title("Cardano (ADA) Closing Price Trend")
plt.legend()
plt.show()
# --Trend Plot of Volume
plt.figure(figsize=(10,6))
plt.plot(df["Date"],df["Volume"],label="Volume",color="orange")
plt.xlabel("Date")
plt.ylabel("Trading Volume")
plt.title("Cardano Trading Volume Trend")
plt.legend()
plt.show()
#-- High vs Low Comparision
plt.figure(figsize=(10,6))
plt.plot(df["Date"],df["High"],label="High Price",color="green")
plt.plot(df["Date"],df["Low"],label="Low Price",color="red")
plt.xlabel("Date")
plt.ylabel("Price (USD)")
plt.title("Cardano High vs Low Prices")
plt.legend()
plt.show()