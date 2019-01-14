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
numRuns = int(sys.argv[5])

result = 'storageUsage-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP))
with open(result, 'wt') as f:
	writer = csv.writer(f)
	writer.writerow( ('W', 'runIndex', 'min', 'max', 'mean', '25percentile', 'median', '75percentile', '95percentile', '98percentile', '99percentile') )

for W in windowsAR:
	for runIndex in range(numRuns):
		output = 'storageAR-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
		if not os.path.isfile(output):
			continue
		print output
		with open(output, 'rb') as pfile:
			storageUsage = pickle.load(pfile)
		with open(result, 'a') as f:
			writer = csv.writer(f)
			writer.writerow( (W, runIndex, round(min(storageUsage),3), round(max(storageUsage),3), round(np.mean(storageUsage),3), round(np.percentile(storageUsage, 25),3), round(np.percentile(storageUsage, 50),3), round(np.percentile(storageUsage, 75),3), round(np.percentile(storageUsage, 95),3), round(np.percentile(storageUsage, 98),3), round(np.percentile(storageUsage, 99),3)) )
	
    	
