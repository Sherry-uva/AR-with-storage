import sys, pdb, csv
import os.path
import pickle
import numpy as np

numCustomers = int(sys.argv[1])
numHighSpeedPorts = int(sys.argv[2])
windowsAR = [50, 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000, 3000, 4000, 5000, 6000]
load = float(sys.argv[3])
lossRate = 1e-11
num100GIP = int(sys.argv[4])
numRuns = 100


maxCoV = []

for W in windowsAR:
	aveRespTime = []
	for runIndex in range(numRuns):
	
		output = 'AR-W'+str(float(W))+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+ '-runIndex' + str(runIndex)+'.csv'
		if not os.path.isfile(output):
			continue
		print output
		with open(output, 'r') as csvfile:
				csvfile.readline()
				csvreader = csv.reader(csvfile, delimiter=",")
				for line in csvreader:
					aveRespTime.append(float(line[3]))
			
		res = [np.std(aveRespTime)]
		for r in aveRespTime:
			res.append(round(res[0]/r,5))
		maxCoV.append(np.max(res[1:len(res)]))
			
with open('maxCoV.txt', 'w') as f:
	writer = csv.writer(f)
	writer.writerow( ( [np.max(maxCoV)] ) )
	