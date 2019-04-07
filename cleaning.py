##cleaning.py

import pandas as pd

label = ["Node","Packetreceived","packetforwarded","packetdropped"]
dataset = pd.read_csv("TestStage.csv",delimiter='\t',names=label)
dataset = pd.DataFrame(dataset)



dataset.drop_duplicates(inplace=True)
dataset.dropna(axis=0,how="any",inplace=True)
# dataset["Packet Drop Ratio"] = dataset["Packetdropped"] / dataset["Packetreceived"]

dataset.to_csv("TestStage1.csv")
