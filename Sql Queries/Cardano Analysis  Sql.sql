drop database if exists crypto_db;
create database cardano_crypto_db;
drop database if exists cardano_crypto_db;
create database cardano_crypto_db;
use cardano_crypto_db;
CREATE TABLE cardano_prices (
    SNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Symbol VARCHAR(10),
    Date DATE,
    High DECIMAL(20,8),
    Low DECIMAL(20,8),
    Open DECIMAL(20,8),
    Close DECIMAL(20,8),
    Volume BIGINT,
    Marketcap BIGINT
);
INSERT INTO cardano_prices 
(SNo, Name, Symbol, Date, High, Low, Open, Close, Volume, Marketcap) 
VALUES
(1, 'Cardano', 'ADA', STR_TO_DATE('10/2/2017','%m/%d/%Y'), 0.03, 0.02, 0.02, 0.03, 57641300, 628899052),
(2, 'Cardano', 'ADA', STR_TO_DATE('10/3/2017','%m/%d/%Y'), 0.03, 0.02, 0.03, 0.02, 16997800, 539692715),
(3, 'Cardano', 'ADA', STR_TO_DATE('10/4/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 9000050, 568619548),
(4, 'Cardano', 'ADA', STR_TO_DATE('10/5/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 5562510, 557139041),
(5, 'Cardano', 'ADA', STR_TO_DATE('10/6/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 7780710, 480664553),
(6, 'Cardano', 'ADA', STR_TO_DATE('10/7/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 7411240, 542936191),
(7, 'Cardano', 'ADA', STR_TO_DATE('10/8/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 7727460, 530913809),
(8, 'Cardano', 'ADA', STR_TO_DATE('10/9/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 4663310, 573343460),
(9, 'Cardano', 'ADA', STR_TO_DATE('10/10/2017','%m/%d/%Y'), 0.02, 0.02, 0.02, 0.02, 2725600, 558243534);
-- Check firt 8 rows
select * from cardano_prices limit 8;
-- Check range of dataset 
select min(Date) as Start_date, max(Date) as End_date from cardano_prices;
-- Average Close Price
select avg(Close) as Avg_Close from cardano_prices;
-- Highest Price Ever
select Date, High as All_Time_High from cardano_prices
where High=(select max(High) from cardano_prices);
-- Low Price Ever
select Date, Low as ALL_Time_Low from cardano_prices
where Low=(select min(Low) from cardano_prices);
-- Yearly Average Close Price
select YEAR(Date) as Year, avg(Close) as Avg_Close
from cardano_prices
group by year(Date)
order by year;
-- Monthly Trading Volume
select year(Date) as year, month(Date) as month, sum(Volume) as total_Volume 
from cardano_prices
group by year(Date),month(Date)
order by year,month;
-- Biggest Daily gain (High-Low)
select Date,(High-Low) as Daily_Gain from cardano_prices
order by Daily_Gain desc limit 5;
-- Percentage Change in Close
SELECT 
    Date,
    ((Close - LAG(Close) OVER (ORDER BY Date)) / LAG(Close) OVER (ORDER BY Date)) * 100 
    AS Daily_Return_Percentage
FROM cardano_prices;
select Date, Volume,Close from cardano_prices
order by Date;





