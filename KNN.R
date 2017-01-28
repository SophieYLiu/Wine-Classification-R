#set CAT as a factor
wine$CAT=factor(wine$V1)

#split data into training and test subsets
library(caTools)
set.seed(1234)
split <- sample.split(wine$V1, SplitRatio = 0.8)
dresstrain <- wine[split,,1]
dresstest <- wine[!split,,1]

#build multinomial logistic model
library(class)
kmodel<-knn(train=dresstrain[,2:14], test=dresstest[,2:14],cl=dresstrain$CAT, k=3)

#misclassification error using confusion matrix
cm <- table(kmodel, dresstrain$V1)
print(cm)

#misclassification error using confusion matrix
cm <- table(kmodel, dresstest$V1)
print(cm)
