import sys, os, csv, pdb

mode = sys.argv[1]
numHighSpeedPorts = int(sys.argv[2])
W = float(sys.argv[3])
load = float(sys.argv[4])
lossRate = float(sys.argv[5])
num100GIP = float(sys.argv[6])


if mode == 'AR':
	result = 'results'+mode+'-W'+str(int(W))+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
else:
	result = 'results'+mode+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'

with open(result, 'wt') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerow( ('numCustomers','numTransfers', 'numBlocked', 'blockingProb', 'aveResponseTime', 'aveRespsTimeCircuit', 'aveRespsTime10GIP') )


for numCustomers in range(numHighSpeedPorts+1, 26):
	if mode == 'AR':
		output = mode+'-W'+str(W)+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
	else:
		output = mode+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'

	if os.path.isfile('./'+output):
		with open(result, 'a') as csvfile:
			writer = csv.writer(csvfile)
			with open(output, 'r') as input:
				input.readline()
				csvreader = csv.reader(input, delimiter=",")	
				for line in csvreader:	
					writer.writerow( (numCustomers, line[0], line[1], line[2], line[3], line[4], line[5]) )
	else:
		with open(result, 'a') as csvfile:
			writer = csv.writer(csvfile)
			writer.writerow( (numCustomers, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA') )




