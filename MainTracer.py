import pandas as pd
import csv
from collections import defaultdict
import os

from os import listdir
filenames=[]
path="/Users/deepakjoshi/Desktop/Project/parser/tr files/"
for file in listdir(path):
        if(file[-2:]=="tr"):
            filenames.append(path + file)




def lengthofcsv():
    with open("RTRs.csv",'r') as readfile1:
        num_lines = len(readfile1.readlines())
        return num_lines

for filename in filenames:
        with open(filename, 'r') as file:
            linecontents = file.readlines()

        linecontents = [lines.strip() for lines in linecontents]

        """
        create RTRs.csv file
        Functions happening :
         1. remove all data enteries with Node = Src IP and type = 'D' for drop packets
         2. only choose data enteries with RTR as they are the packet carrying data
        
        """
        filename2 = "RTRs.csv"
        with open(filename2, 'w') as csvwrite:
            for i in range(0, len(linecontents)):

                linestr = linecontents[i]
                words = linestr.split(' ')
                if (len(words) == 21):
                    del words[4]   #make lines of equal length removing redundant entries

                if (len(words) == 20 and words[3] == 'RTR'):
                    if (words[2][1]!= words[13][1]):
                        words[2] = words[2][1]
                        writer = csv.writer(csvwrite)
                        writer.writerow(words)
        csvwrite.close()
        file.close()



        run_num= lengthofcsv()

        columns = ["Node","Packet received", "Packet forwarded" ,"packet dropped"]

        packet_received = {}
        packet_dropped = {}
        packet_forward ={}

        dict_final = packet_received, packet_forward, packet_dropped
        with open("RTRs.csv",'r') as readfile:
                with open("Stage1.csv",'a') as writefile:
                        writer = csv.writer(writefile,delimiter='\t')
                        # writer.writerow(columns)
                        csv_reader = csv.reader(readfile,delimiter =',')

                        for index,row in enumerate(csv_reader):
                                merged_dict = defaultdict(list)
                                if(index%1000 !=0 or index == 0):
                                        if(row[0] == 'r'):
                                                if(row[2]  in packet_received):
                                                        packet_received[row[2]] +=1
                                                else : packet_received[row[2]] =1

                                        elif(row[0] == 'f'):
                                                if(row[2]  in packet_forward):
                                                        packet_forward[row[2]] +=1
                                                else : packet_forward[row[2]] =1

                                        elif(row[0]=='D'):
                                                if (row[2] in packet_dropped):
                                                        packet_dropped[row[2]] +=1
                                                else : packet_dropped[row[2]] =1

                                elif ((index % 1000 ==0 and index!=0)):
                                        if (row[0] == 'r'):
                                                if (row[2] in packet_received):
                                                        packet_received[row[2]] += 1
                                                else:
                                                        packet_received[row[2]] = 1

                                        elif (row[0] == 'f'):
                                                if (row[2] in packet_forward):
                                                        packet_forward[row[2]] += 1
                                                else:
                                                        packet_forward[row[2]] = 1

                                        elif (row[0] == 'D'):
                                                if (row[2] in packet_dropped):
                                                        packet_dropped[row[2]] += 1
                                                else:
                                                        packet_dropped[row[2]] = 1

                                if ((index % 1000 == 0) or index == run_num-1):
                                        for i in packet_received:
                                                if i not in packet_dropped:
                                                        packet_dropped[i] = 0

                                        for dicts in dict_final:
                                                for k, v in dicts.items():
                                                        merged_dict[k].append(v)

                                        for key, value in merged_dict.items():

                                                writer.writerow([key] + value)

                                        packet_received={}
                                        packet_dropped={}
                                        packet_forward={}
                                        merged_dict={}
                                        dict_final = packet_received, packet_forward, packet_dropped
        writefile.close()
        readfile.close()
        os.remove(filename2)


print("stange 1 is completed ... now begining stage 2.........")
filename3 = "Stage1.csv"
label = ["Node", "Packetreceived", "packetforwarded", "packetdropped"]
dataset = pd.read_csv(filename3, delimiter='\t', names=label)
dataset = pd.DataFrame(dataset)

dataset.drop_duplicates(inplace=True)
dataset.dropna(axis=0, how="any", inplace=True)
dataset["Packet Drop Ratio"] = dataset["packetdropped"] / dataset["Packetreceived"]
dataset["Packet Drop Ratio"] = dataset["Packet Drop Ratio"].round(3)


#determining nodes that are malicious
def cal1(row):
        if row["Packet Drop Ratio"]  >= 0.400:  #need to check this ratio for malicious activity
                val =1
        else : val = 0;

        return val

def cal2(row):
        if row["Node"] == 2 or row["Node"] == 7:  #need to add more nodes that are malicious
                val =1
        else : val = 0
        return val

#removing all pdr rows with value 0
dataset = dataset[dataset["Packet Drop Ratio"] != 0]

#need to change this ratio to autonomous breaking
ratio  = int(.80*dataset.shape[0])
train = dataset.iloc[:ratio,:]
test = dataset.iloc[ratio:,:]

#added output column which contains 0: non malicious or 1:malicious
test["Output"] = test.apply(cal2,axis =1)
train["Output"] = train.apply(cal1,axis=1)


with open("train.csv","a") as f:
         train.to_csv(f,header = False, index = False)

with open("test.csv","a") as f:
        test.to_csv(f,header = False, index = False)


os.remove(filename3)
print(" The last stage reached ......")
