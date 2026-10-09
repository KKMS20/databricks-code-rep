import pandas as pd
data = {'Name': ['Alice', 'Bob', 'Charlie', None],
        'Age': [25, 30, 35, 40]}
df = pd.DataFrame(data)
print (df)
df.dropna(subset=['Name'], inplace=True)
print(df)
