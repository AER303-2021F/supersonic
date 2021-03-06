from matplotlib import pyplot as plt
import numpy as np

data = np.genfromtxt("../data/nozzle_geometry.csv",
                     delimiter=",", skip_header=1, skip_footer=1)

plt.figure(figsize=(12, 6))
ax = plt.gca()
ax.set_facecolor('grey')
plt.fill_between(data[:, 1], data[:, 2], 30, color="white")
plt.plot(data[2:9, 1], 30 * np.ones(7), "o",
         label="Pressure Taps", color="salmon")
plt.title("De Laval Half Nozzle Geometry")
plt.xlabel("x position (mm)")
plt.ylabel("y position (mm)")
plt.legend()
plt.grid()
plt.show()
