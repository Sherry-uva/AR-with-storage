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
		with open(output, 'r') as csvfile:
			with open(result, 'a') as f:
				csvfile.readline()
				csvreader = csv.reader(csvfile, delimiter=",")
				writer = csv.writer(f)
				for line in csvreader:
						writer.writerow( (W, runIndex, float(line[0]), float(line[1]),float(line[2]),float(line[3]),float(line[4]),float(line[5]),float(line[6]),float(line[7]),float(line[8])) )

		