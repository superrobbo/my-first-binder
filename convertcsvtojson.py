import csv
import json

csvfile = open('my-data/import.csv', 'r')
jsonfile = open('my-data/file.json', 'w')

fieldnames = ("ID","Artist","Song", "Artist")
reader = csv.DictReader( csvfile, fieldnames)
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')
