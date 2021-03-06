import csv


modes = ['AR', 'IR']

for mode in modes:
	output = mode + '-response-time.csv'
	input = mode + '-total-delay.csv'
	dict = {}
	with open(input, 'r') as csvfile:
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		for line in csvreader:
			dict[line[0]] = line[1]


	with open(output, 'wt') as csvfile:
		writer = csv.writer(csvfile)
		writer.writerow( ('K', 'N', 'W', 'load', 'numCircuits', 'num10GIP', 'totalTransfers', 'delayTotal', 'delayCircuits', 'delay10GIP') )


	input = mode + '-OCS-delay.csv'
	with open(input, 'r') as csvfile, open(output, 'a') as outfile:
		writer = csv.writer(outfile)
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		for line in csvreader:
			par = line[0].replace('-', ' ').split(' ')
			writer.writerow( (par[1][1:], par[2][1:], par[3][1:], par[4][4:], line[1], line[2], line[3], dict[line[0]], line[4], line[5]) )

		
		