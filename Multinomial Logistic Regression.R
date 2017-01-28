#set CAT as a factor
wine$CAT=factor(wine$V1)

#split data into training and test subsets
library(caTools)
set.seed(1234)
split <- sample.split(wine$V1, SplitRatio = 0.8)
dresstrain <- wine[split,,1]
dresstest <- wine[!split,,1]

#build multinomial logistic model
library(nnet)
mymodel <- multinom(CAT~.-V1, data=dresstrain, family=binomial)

#misclassification error using confusion matrix (on training data)
cm <- table(predict(mymodel, dresstrain), dresstrain$CAT)
print(cm)

#misclassification error using confusion matrix (on test data)
cm <- table(predict(mymodel, dresstest), dresstest$CAT)
print(cm)

