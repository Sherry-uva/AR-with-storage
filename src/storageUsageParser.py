import sys, pdb, csv
import pickle
import numpy as np

numCustomers = int(sys.argv[1])
numHighSpeedPorts = int(sys.argv[2])
windowsAR = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000]
load = int(sys.argv[3])
lossRate = 1e-11
num100GIP = 2.0

result = 'storageUsage-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
with open(result, 'wt') as f:
	writer = csv.writer(f)
	writer.writerow( ('W', 'min', 'max', 'mean', '25percentile', 'median', '75percentile', '95percentile', '98percentile', '99percentile') )


for W in windowsAR:
	output = 'storageAR-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
	print output
	with open(output, 'rb') as pfile:
		storageUsage = pickle.load(pfile)
	with open(result, 'a') as f:
		writer = csv.writer(f)
		writer.writerow( (W, round(min(storageUsage),3), round(max(storageUsage),3), round(np.mean(storageUsage),3), round(np.percentile(storageUsage, 25),3), round(np.percentile(storageUsage, 50),3), round(np.percentile(storageUsage, 75),3), round(np.percentile(storageUsage, 95),3), round(np.percentile(storageUsage, 98),3), round(np.percentile(storageUsage, 99),3)) )
	
    	
