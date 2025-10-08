import numpy as np
import matplotlib.pyplot as plt
data = np.loadtxt('dla.txt')
x, y = data[:,0], data[:,1]
plt.scatter(x, y, s=1)
plt.axis('equal')
plt.show()