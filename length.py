
import csv
def lengthofcsv():

    with open("RTRs.csv",'r') as readfile1:
        num_lines = len(readfile1.readlines())
        return num_lines


