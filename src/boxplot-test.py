import matplotlib.pyplot as plt
import numpy as np
import sys, pdb, csv
import pickle
import json


n = int(sys.argv[1])
input = "rawData-storageAR-K10-N4-W2000-load20-lossRate1e-11-num100GIP" + str(n) + "-runIndex0.csv"
output = "rawData-storageAR-K10-N4-W2000-load20-num100GIP" + str(n) + "-runIndex0.csv"
with open(input, 'rb') as pfile:
	storageUsage = pickle.load(pfile)
	with open(output, 'wb') as f:	
		writer = csv.writer(f)
		for storage in storageUsage:
# 			pdb.set_trace()
			writer.writerow( ( [storage] ) )

# bp = plt.boxplot(storageUsage)
# 
# pdb.set_trace()
# 
# with open('boxplot-storage-n2.json', 'w') as f:
#     json.dump(bp, f)
# 
# 
# def get_percentiles_from_box_plots(bp):
#     percentiles = []
#     for i in range(len(bp['boxes'])):
#         percentiles.append((bp['caps'][2*i].get_ydata()[0],
#                            bp['boxes'][i].get_ydata()[0],
#                            bp['medians'][i].get_ydata()[0],
#                            bp['boxes'][i].get_ydata()[2],
#                            bp['caps'][2*i + 1].get_ydata()[0],
#                            (bp['fliers'][i].get_xdata(),
#                             bp['fliers'][i].get_ydata())))
#     return percentiles
    
# with open('my_dict.json') as f:
#     my_dict = json.load(f)    
#     
    
# plt.show()