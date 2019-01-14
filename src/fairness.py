import sys, csv, pdb
import numpy as np


mode = sys.argv[1]
numHighSpeedPorts = 4
W = 8000
lossRate = 1e-11
num100GIP = 2

if mode == 'AR':
	result = 'logs-load100/fairness'+mode+'-W'+str(int(W))+'-sharedPorts'+str(numHighSpeedPorts)+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
	std = 'logs-load100/maxMin'+mode+'-W'+str(int(W))+'-sharedPorts'+str(numHighSpeedPorts)+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
else:
	result = 'logs-load100/fairness'+mode+'-sharedPorts'+str(numHighSpeedPorts)+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
	std = 'logs-load100/maxMin'+mode+'-sharedPorts'+str(numHighSpeedPorts)+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'

with open(result, 'wt') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerow( ('customerId','numTransfers', 'numBlocked', 'blockingProb', 'aveResponseTime', 'aveRespsTimeCircuit', 'aveRespsTime10GIP') )

with open(std, 'wt') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerow( ('numCustomers','stdNumTransfers', 'stdNumBlocked', 'stdBlockingProb', 'stdAveResponseTime', 'stdAveRespsTimeCircuit') )
	
		
for numCustomers in range(numHighSpeedPorts+1, 21):
	if mode == 'AR':
		output = 'logs-load100/' + mode + '-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(100.0/numCustomers))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP))
	else:
		output = 'logs-load100/' + mode + '-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W0' + '-load' + str(int(100.0/numCustomers))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP))
	print output
	numTransfers = [0 for i in range(numCustomers)]
	numBlocked = [0 for i in range(numCustomers)]
	responseTime = [0 for i in range(numCustomers)]
	responseTimeBlocked = [0 for i in range(numCustomers)]
	with open(output, 'r') as csvfile:
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		for line in csvreader:
			if len(line) < 6:
				continue
			customerId = int(line[0])
			numTransfers[customerId] += 1
			responseTime[customerId] += float(line[4])
			if line[5] == 'IP':
				numBlocked[customerId] += 1
				responseTimeBlocked[customerId] += float(line[4])
	
	blockingProb = [0 for i in range(numCustomers)]	
	aveResponseTime = [0 for i in range(numCustomers)]
	aveRespsTimeCircuit	= [0 for i in range(numCustomers)]
	aveRespsTime10GIP = [0 for i in range(numCustomers)]
	with open(result, 'a') as csvfile:
		writer = csv.writer(csvfile)	
		for customer in range(numCustomers):	
			blockingProb[customer] = float(numBlocked[customer])/numTransfers[customer]	
			aveResponseTime[customer] = responseTime[customer]/float(numTransfers[customer])
			aveRespsTimeCircuit[customer] = (responseTime[customer]-responseTimeBlocked[customer])/float(numTransfers[customer]-numBlocked[customer]) 
			if numBlocked[customer] != 0:
				aveRespsTime10GIP[customer] = responseTimeBlocked[customer]/float(numBlocked[customer])
			else:
				aveRespsTime10GIP[customer] = -1
			writer.writerow( (customer, numTransfers[customer], numBlocked[customer], blockingProb[customer], aveResponseTime[customer], aveRespsTimeCircuit[customer], aveRespsTime10GIP[customer]) )
		
		with open(std, 'a') as stdfile:
			writer1 = csv.writer(stdfile)
			writer1.writerow( (numCustomers, float("{0:.3f}".format((max(numTransfers)-min(numTransfers))/np.mean(numTransfers))), float("{0:.3f}".format(np.std(numBlocked))), float("{0:.10f}".format((max(blockingProb)-min(blockingProb))/np.mean(blockingProb))), float("{0:.3f}".format((max(aveResponseTime)-min(aveResponseTime))/np.mean(aveResponseTime))), float("{0:.3f}".format((max(aveRespsTimeCircuit)-min(aveRespsTimeCircuit))/np.mean(aveRespsTimeCircuit)))) )
# 			writer1.writerow( (numCustomers, float("{0:.3f}".format(np.std(numTransfers))), float("{0:.3f}".format(np.std(numBlocked))), float("{0:.10f}".format(np.std(blockingProb))), float("{0:.3f}".format(np.std(aveResponseTime))), float("{0:.3f}".format(np.std(aveRespsTimeCircuit)))) )

	
	
	
	
	
	
	
	
	
	
	
	
	
		
