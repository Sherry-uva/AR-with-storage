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

result = 'plot-storageUsage-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP))
with open(result, 'wt') as f:
	writer = csv.writer(f)
	writer.writerow( ('W', 'numRuns', 'min', 'max', 'mean', '25percentile', 'median', '75percentile', '95percentile', '98percentile', '99percentile') )

W = 0
count = 0
sum = [0 for i in range(9)]
output = 'storageUsage-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP))
with open(output, 'r') as csvfile:
	with open(result, 'a') as f:
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		writer = csv.writer(f)
		for line in csvreader:
			if W != int(line[0]):
				if W != 0:
					writer.writerow( (W, count, round(sum[0]/count, 3), round(sum[1]/count, 3), round(sum[2]/count, 3), round(sum[3]/count, 3), round(sum[4]/count, 3), round(sum[5]/count, 3), round(sum[6]/count, 3), round(sum[7]/count, 3), round(sum[8]/count, 3)) )
				W = int(line[0])
				count = 0
				sum = [0 for i in range(9)]
			for i in range(len(sum)):
				sum[i] += float(line[i+2])
			count += 1
		writer.writerow( (W, count, round(sum[0]/count, 3), round(sum[1]/count, 3), round(sum[2]/count, 3), round(sum[3]/count, 3), round(sum[4]/count, 3), round(sum[5]/count, 3), round(sum[6]/count, 3), round(sum[7]/count, 3), round(sum[8]/count, 3)) )
			


