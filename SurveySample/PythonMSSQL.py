
import pandas as pd
import pyodbc

sql_conn = pyodbc.connect('DRIVER={ODBC Driver 13 for SQL Server}; SERVER=RONAD-FISHER\SQL2019;DATABASE=Survey_Sample_A18;Trusted_Connection=yes') 
query = "SELECT * FROM [Survey_Sample_A18].[dbo].[vw_AllSurveyData] ORDER BY SurveyId, UserId"
df = pd.read_sql(query, sql_conn)

print(df.head(3))