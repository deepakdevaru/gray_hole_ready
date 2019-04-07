import pandas as pd
import csv
from collections import defaultdict
from collections import defaultdict
import length
import os





filename = "/Users/deepakjoshi/Desktop/Project/parser/tr files/4.tr"
with open(filename, 'r') as file:
    linecontents = file.readlines()

linecontents = [lines.strip() for lines in linecontents]

"""
create RTRs.csv file
Functions happening :
 1. remove all data enteries with Node = Src IP and type = 'D' for drop packets
 2. only choose data enteries with RTR as they are the packet carrying data
 3. neglecting CBK and NRTE flags as they are route not found error
"""
filename2 = "RTRs.csv"
with open(filename2, 'w') as csvwrite:
    for i in range(0, len(linecontents)):

        linestr = linecontents[i]
        words = linestr.split(' ')
        if (len(words) == 21):
            del words[4]   #make lines of equal length removing redundant entries

        if (len(words) == 20 and words[3] == 'RTR'): #and (words[4] !='CBK' and words[4]!='NRTE')):
            if (words[2][1]!= words[13][1]):
                words[2] = words[2][1]
                writer = csv.writer(csvwrite)
                writer.writerow(words)
csvwrite.close()
file.close()



run_num= length.lengthofcsv()

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
                        #print(index)
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
                                # else : continue
                                #print(index)

                        elif ((index % 1000 ==0 and index!=0)):#or index  == 54125):
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



                                # else:
                                #         continue
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


import pandas as pd
filename3 = "Stage1.csv"
label = ["Node", "Packetreceived", "packetforwarded", "packetdropped"]
dataset = pd.read_csv(filename3, delimiter='\t', names=label)
dataset = pd.DataFrame(dataset)

dataset.drop_duplicates(inplace=True)
dataset.dropna(axis=0, how="any", inplace=True)
dataset["Packet Drop Ratio"] = dataset["packetdropped"] / dataset["Packetreceived"]
dataset["Packet Drop Ratio"] = dataset["Packet Drop Ratio"].round(3)

with open("Cleaned.csv", "a") as f:
        dataset.to_csv(f, header=False, index=False)

f.close()
os.remove(filename3)
