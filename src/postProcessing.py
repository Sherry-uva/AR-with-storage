import sys, os, csv, pdb


def parser(mode, numCustomers, numHighSpeedPorts, W, load, lossRate, num100GIP, runIndex):

	if mode == 'AR':
		result = mode+'-W'+str(W)+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+ '-runIndex' + str(runIndex)+'.csv'
		output = mode + '-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
	else:
		result = mode+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
		output = 'IR-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '.csv'

	with open(result, 'wt') as csvfile:
		writer = csv.writer(csvfile)
		writer.writerow( ('numTransfers', 'numBlocked', 'blockingProb', 'aveResponseTime', 'aveRespsTimeCircuit', 'aveRespsTime10GIP') )
	
	
	
	numTransfers = 0
	numBlocked = 0
	responseTime = 0
	responseTimeBlocked = 0
	with open(output, 'r') as csvfile:
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		for line in csvreader:
			if len(line) < 6:
				continue
			numTransfers += 1
			responseTime += float(line[4])
			if line[5] == 'IP':
				numBlocked += 1
				responseTimeBlocked += float(line[4])
			
	blockingProb = float(numBlocked)/numTransfers	
	aveResponseTime = responseTime/float(numTransfers)
	aveRespsTimeCircuit = (responseTime-responseTimeBlocked)/float(numTransfers-numBlocked) 
	if numBlocked != 0:
		aveRespsTime10GIP = responseTimeBlocked/float(numBlocked)
	else:
		aveRespsTime10GIP = -1

	with open(result, 'a') as csvfile:
		writer = csv.writer(csvfile)
		writer.writerow( (numTransfers, numBlocked, blockingProb, aveResponseTime, aveRespsTimeCircuit, aveRespsTime10GIP) )
		
	os.remove(output)