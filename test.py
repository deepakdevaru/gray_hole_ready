import pandas as pd
import csv
with open("test.csv","a") as writefile:
    with open("RTRs.csv","r") as openfil:
        csv_reader = csv.reader(openfil, delimiter=',')


        for index, row in enumerate(csv_reader):
            if row[0] == "D":
                writer = csv.writer(writefile)
                writer.writerow(row)