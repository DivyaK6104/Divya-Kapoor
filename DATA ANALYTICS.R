S_data<- read.csv("http://bit.ly/w-data")
print("Data imported successfully")
head(S_data,10)
plot(S_data,xlab= "Hours",ylab ="Scores",col ="blue",pch=20)
x<- S_data$Hours
y<- S_data$Scores
library(caTools)
s.d <- sample.split(S_data$Scores,SplitRatio = 0.2)
s.d
train<- subset(S_data,s.d == TRUE)
test <- subset(S_data,s.d == FALSE)
data<- lm(Scores~Hours,S_data)
abline(data,col ="blue")
yobs<- train$Scores
ypred <- coef(data)[1]+coef(data)[2]*c(train$Hours)
c<- data.frame(yobs,ypred)
c
yVAL <- coef(data)[1]+coef(data)[2]*9.25
rmse(yobs,ypred)
