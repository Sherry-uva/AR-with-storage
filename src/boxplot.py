import sys, csv
import pickle

n = int(sys.argv[1])
output = "rawData-storageAR-K10-N4-W2000-load20-lossRate1e-11-num100GIP" + str(n) + "-runIndex0.csv"
with open(output, 'rb') as pfile:
	storageUsage = pickle.load(pfile)

plt.boxplot(storageUsage)
plt.show()