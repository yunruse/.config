import csv
from datetime import datetime
from noether import catalogue
from rich import print
N = len(set(catalogue.units.values()))

with open('/Users/yunruse/iCloud/Projects/Noether/catalogue_count.csv') as f:
    data = [(date, int(N)) for date, N in csv.reader(f)]

today = N - data[-2][1]
print(f'[green italic]Noether has {N} unique units ({today} today)')
