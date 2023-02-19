import csv
from datetime import datetime
from noether import catalogue
from rich import print

N = len(catalogue.units())
P = len(list(catalogue.prefixes()))
print(
    f'[green italic]{N} units[/], [purple italic]{P} prefixes')
