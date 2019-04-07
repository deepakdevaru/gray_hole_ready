##This is tracer.py

import pandas as pd
import csv


filename ="out.tr"
with open(filename,'r') as file:
	
	linecontents = file.readlines()

linecontents = [lines.strip() for lines in linecontents]


print(len(linecontents))
for i in range(0,len(linecontents)):

	linestr = linecontents[i]
	words = linestr.split(' ')
	# print(words)
	if (len(words) == 21):
		del words[4]

	if( len(words)==20 and words[2][1] == '6' ):
		with open("node6.csv", 'a') as csvwrite:
			writer = csv.writer(csvwrite)
			writer.writerow(words)




