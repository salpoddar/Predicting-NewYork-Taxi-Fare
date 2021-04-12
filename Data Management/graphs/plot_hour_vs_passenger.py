import matplotlib.pyplot as plt
import csv

x = []
y = []

# open the results file
with open('hour_vs_passenger.csv', 'r') as csvfile:
	# read the results using csv reader.
    plots = csv.reader(csvfile, delimiter=',')
	# skip header line.
    next(plots)
	
    for row in plots:
		# add each row to x and y coordinates
        x.append(float(row[0]))
        y.append(float(row[1]))

# plot the results
plt.plot(x, y, label='Hour vs Average Passenger count')
# set the x axis label of graph
plt.xlabel('Hour of day')
# set the y axis label of graph
plt.ylabel('Average Passenger count')
# set the title of graph
plt.title('Hour vs Average Passenger count')
plt.legend()
# dispay the graph
plt.show()
