url = "http://bit.ly/w-data"
data <- read.csv(url)
head(data)
View(data)
plot(data, main="Hours vs Percentage")
lm(data$Scores ~ data$Hours)
abline(lm(data$Scores ~ data$Hours))
library(corrplot)
library(ggplot2)
library(ggcorrplot)
corr=cor(data)
ggcorrplot(corr)
library(caTools)
split=sample.split(data, SplitRatio = 0.7)
train=subset(data, split="TRUE")
test=subset(data, split="FALSE")
train
test
x=data$Hours
y=data$Scores
Model=lm(y ~ x, data=train)
summary(Model)
pred=predict(Model, test)
pred
actuals_preds <- data.frame(cbind(Hours=test$Hours, actuals=test$Scores, predicteds=pred))
actuals_preds
plot(pred, type ="l", lty=1.8, col="blue")
plot(test$Scores, type ="l", lty=1.8, col="red")
lines(pred, type="l", col="blue")
a <- data.frame(x=9.00)
result <- predict(Model, a)
print(result)


