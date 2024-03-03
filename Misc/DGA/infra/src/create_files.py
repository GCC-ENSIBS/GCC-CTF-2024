import pandas as pd
import numpy as np

df_legit = pd.read_csv("cloudflare-radar-domains-top-500000-20240101-20240108.csv")

# Open and read the contents of the file
with open("all_data.txt", 'r') as file:
    content = file.read()

dga_domains = content.split("\n")
df_legit['dga'] = 0

df_dga = pd.DataFrame()
df_dga['domain'] = dga_domains
df_dga['dga'] = 1

df_legit = df_legit.reindex(np.random.permutation(df_legit.index))
df_dga = df_dga.reindex(np.random.permutation(df_dga.index))

dataset_dga = list(df_dga[:30000]['domain'])
other_dataset_dga = list(df_dga[30000:]['domain'])

dataset_legit = list(df_legit[:30000]['domain'])
other_dataset_legit = list(df_legit[30000:]['domain'])

with open("dataset_dga.txt", 'w') as file:
    for item in dataset_dga:
        file.write(str(item) + '\n')

with open("other_dataset_dga.txt", 'w') as file:
    for item in other_dataset_dga:
        file.write(str(item) + '\n')

with open("dataset_legit.txt", 'w') as file:
    for item in dataset_legit:
        file.write(str(item) + '\n')

with open("other_dataset_legit.txt", 'w') as file:
    for item in other_dataset_legit:
        file.write(str(item) + '\n')