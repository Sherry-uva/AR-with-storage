import sys, csv, pdb

mode = 'AR'
numCustomers = sys.argv[1]
numHighSpeedPorts = 4
windowsAR = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000]
load = sys.argv[2]
lossRate = 1e-11
num100GIP = 2

result = 'results'+mode+'-K'+str(int(numCustomers))+'-N'+str(numHighSpeedPorts)+'-load'+str(load)+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'

with open(result, 'wt') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerow( ('W','numTransfers', 'numBlocked', 'blockingProb', 'aveResponseTime', 'aveRespsTimeCircuit', 'aveRespsTime10GIP') )
	
for W in windowsAR:
	output = mode + '-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
	print output
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
		writer.writerow( (W, numTransfers, numBlocked, blockingProb, aveResponseTime, aveRespsTimeCircuit, aveRespsTime10GIP) )
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
