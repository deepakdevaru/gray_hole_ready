
import csv

filename = "node6rsfDRTR.csv"
totalPackeetsreceived =0
totalPackeetsdropped =0

with open(filename, "r") as f:
    readlines = csv.reader(f,delimiter=',')
    for lines in readlines:
        if lines[1] == 'D':
            totalPackeetsdropped+=1

        elif lines[1] =='r':
            totalPackeetsreceived+=1
        else : continue



print("Total number of dropped packets are: ", totalPackeetsdropped)
print("Total number of received packets are: ", totalPackeetsreceived)

print("Packet drop ratio : ", totalPackeetsdropped/totalPackeetsreceived)