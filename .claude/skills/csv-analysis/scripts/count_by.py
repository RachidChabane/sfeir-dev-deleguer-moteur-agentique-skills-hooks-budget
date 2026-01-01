#!/usr/bin/env python3
"""Count the rows of a CSV file per value of one column."""
import csv
import sys
from collections import Counter

path, column = sys.argv[1], sys.argv[2]
with open(path, newline="", encoding="utf-8") as handle:
    counts = Counter(row[column] for row in csv.DictReader(handle))

print(f"rows read: {sum(counts.values())}")
for value, count in counts.most_common(10):
    print(f"{count}\t{value}")
