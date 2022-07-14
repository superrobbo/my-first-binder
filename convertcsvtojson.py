import csv
import json
from collections import OrderedDict 

csvfile = open('my-data/import.csv', 'r')
### jsonfile = open('my-data/file.json', 'w') 

fieldnames = ("ID","Artist","Song", "Album")
entries = []

with open('my-data/import.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile, fieldnames,delimiter=";")   
    for row in reader:
        entry = OrderedDict()
        print(row)
        for field in fieldnames:
            entry[field] = row[field]
        entries.append(entry)
        
output = {
    "Music": entries
}

with open('my-data/file.json', 'w') as jsonfile:
    json.dump(output, jsonfile)
    jsonfile.write('\n')        

