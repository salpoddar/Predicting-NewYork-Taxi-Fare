import matplotlib.pyplot as plt
import csv

x = []
y = []

# open the results file
with open('day_vs_fare.csv', 'r') as csvfile:
	# read the results using csv reader.
    plots = csv.reader(csvfile, delimiter=',')
	# skip header line.
    next(plots)
	
    for row in plots:
		# add each row to x and y coordinates
        x.append(float(row[0]))
        y.append(float(row[1]))

# plot the results
plt.plot(x, y, label='Day of the year vs Average Fare')
# set the x axis label of graph
plt.xlabel('Day of the year')
# set the y axis label of graph
plt.ylabel('Average fare')
# set the title of graph
plt.title('Day of the year vs Average fare')
plt.legend()
# dispay the graph
plt.show()
