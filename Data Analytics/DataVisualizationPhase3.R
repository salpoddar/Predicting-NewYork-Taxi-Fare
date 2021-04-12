#load the libraries

library(data.table) # Fast CSV read
library(ggplot2)    #Visualisation
library(lubridate)  #Date-Time extraction
library(dplyr)      #Data wrangling
library(ranger) # Random forest
library(geosphere) #Dist
library(caret) #Cross vaildation
library(xgboost)
library(DataExplorer)
library(mlr)
library(gridExtra)


#load the training data with 20M rows

train=fread("C:\\train.csv",nrows=2000000)
train<-na.omit(train)
train = train %>% 
  filter(fare_amount>=2.5,
         pickup_latitude<=41.71, pickup_latitude>=40.57,
         dropoff_latitude<=41.70, dropoff_latitude>=40.57,
         pickup_longitude<=-72.99, pickup_longitude>=-74.25,
         dropoff_longitude<=-72.99, dropoff_longitude>=-74.26)



#preprocess data and add extra columns derived from date column

train<-train%>%
  mutate(
    pickup_datetime = ymd_hms(pickup_datetime),
    year = as.factor(year(pickup_datetime)),
    month = as.factor(month(pickup_datetime)),
    day = as.numeric(day(pickup_datetime)),
    dayofweek = as.factor(wday(pickup_datetime)),
    hour = as.numeric(hour(pickup_datetime)),
    timeofday = as.factor(ifelse(hour >= 3 & hour < 9,
                    "Morning", ifelse(hour >= 9 & hour < 14, "Mid-Day",
                        ifelse(hour >= 14 & hour < 18, "Evening", "Night")))),
    lat_diff=abs(dropoff_latitude)-abs(pickup_latitude),
    long_diff=abs(dropoff_longitude)-abs(pickup_longitude),
    ) %>% 
    select(-pickup_datetime)

#plot histogram of  fare amount and histogram of log of fare amount

p1=ggplot(train,aes(x=fare_amount))+
    geom_histogram(fill="red",alpha=0.5) +
    ggtitle("Histogram of fare amount")
    

p2=ggplot(train,aes(x=log1p(fare_amount)))+
    geom_histogram(fill="red",alpha=0.5,binwidth=0.25)+
    ggtitle("Histogram of log fare_amount")

#save the grid with your own path
g1 = grid.arrange(p1,p2,ncol=2)
ggsave(filename='fare distribution.jpg',plot=g1,path='D:\\Dell\\RIT MS\\Intro to Big Data\\final project')


#plot scatter plot of Dropoff and pick up locations in data

p1=train %>%
    ggplot(aes(x=pickup_latitude,y=pickup_longitude))+
    geom_point()+
    theme_light()+
    theme(plot.title = element_text(hjust = 0.5)) +
    ggtitle("Scatterplot of Pickup in Data")


p2=train   %>%
    ggplot(aes(x=dropoff_latitude,y=dropoff_longitude))+
    geom_point()+
    theme_light()+
    theme(plot.title = element_text(hjust = 0.5)) +
    ggtitle("Scatterplot of Dropoff in Data")


g2 = grid.arrange(p1,p2,nrow=2);
ggsave(filename='scatter_lati_long.jpg',plot=g1,path='D:\\Dell\\RIT MS\\Intro to Big Data\\final project')

#plot box plot of year in data

p1=train %>%
    ggplot(aes(factor(year),y=fare_amount))+
    geom_boxplot()+
    theme_light()+
    theme(plot.title = element_text(hjust = 0.5)) +
    ggtitle("Boxplot of Year")

#plot box plot of fare amount by year in data

p2=train %>%
    ggplot(aes(as.factor(year), fare_amount))+
    geom_point(stat = "summary", fun.y = "median", col = "red", size = 5)+
    ggtitle("Fare Amount by Year")+
    theme(plot.title = element_text(hjust = .5), legend.position = "bottom")


g3 = grid.arrange(p1,p2,nrow=2)
ggsave(filename='box_plot_year.jpg',plot=g3,path='D:\\Dell\\RIT MS\\Intro to Big Data\\final project')

#plot box plot of fare amount by month in data

p1 = train %>%
    ggplot(aes(as.factor(month), fare_amount))+
    geom_point(stat = "summary", fun.y = "median", col = "red", size = 5)+
    ggtitle("Fare Amount by Month")+
    theme(plot.title = element_text(hjust = .5), legend.position = "bottom")+
    facet_wrap(~factor(year),nrow=3)
ggsave(filename='fare_amount_month.jpg',plot=p1,path='D:\\Dell\\RIT MS\\Intro to Big Data\\final project')

#plot box plot of fare amount by time of day in data

p1 = train  %>%
    ggplot(aes(as.factor(timeofday), fare_amount))+
    geom_point(stat = "summary", fun.y = "median", col = "red", size = 5)+
    ggtitle("Fare Amount by Time of Day")+
    theme(plot.title = element_text(hjust = .5), legend.position = "bottom")+
    facet_wrap(~factor(year),nrow=3)
ggsave(filename='fare_amount_timeofday.jpg',plot=p1,path='D:\\Dell\\RIT MS\\Intro to Big Data\\final project')
