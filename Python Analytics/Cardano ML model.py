import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
#My sql connection
conn=mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Nimisalu8787@",
    database="cardano_crypto_db"
)
query="SELECT Date,Open,High,Low,Close,Volume From cardano_prices;"
df=pd.read_sql(query,conn)
conn.close()
print(df.head())
#Select Features
df["Daily_Return"]=df["Close"].pct_change()*100
df["M47"]=df["Close"].rolling(7).mean()
df["MA30"]=df["Close"].rolling(7).mean()
df["MA30"].fillna(df["Close"], inplace=True)  
df.dropna(inplace=True)
print("Shape of df after dropna:", df.shape)
print("Columns:", df.columns)
print(df.head(3))   # first 3 rows check
print(df[["Open","High","Low","Volume","M47","MA30","Daily_Return"]].info())
#ML Models
#Regression (Price Prediction)
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
x=df[["Open","High","Low","Volume","M47","MA30","Daily_Return"]]
y=df["Close"]
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2,shuffle=False)
model=LinearRegression()
model.fit(x_train,y_train)
predict=model.predict(x_test)
print("MSE",mean_squared_error(y_test,predict))
#Visualization (Prediction vs Actual)
plt.figure(figsize=(10,6))
plt.plot(y_test.values,label="Actual Price")
plt.plot(predict,label="Predicted Price")
plt.legend()
plt.show()