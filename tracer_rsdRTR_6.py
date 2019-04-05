import csv
import pandas as pd
import numpy as np
from collections import defaultdict
import length

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
                                print(packet_received)
                                print(packet_forward)
                                print(packet_dropped)
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













