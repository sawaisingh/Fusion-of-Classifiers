Fusion-Of-Classifiers
=====================
Abstract : In this project we are trying to select the best group of classifier among different classifiers and then 
subsequently fuse  them for the decision of the model.

The presumption in classifier selection is that each classifier is an expert in some local area of the feature space. 

When a feature vector x is submitted for classification, the classifier responsible for the vicinity of x is given the highest credit when assigning the class label to x. 

We can nominate exactly one classifier to make the decision, or more than one local expert. 

Classifier fusion assumes that all classifiers are trained over the whole feature space, and are thereby considered as competitive rather than complementary


THREE STEP CLASSIFICATION APPROACH

1. In the first phase the classifiers are then trained with the training data.

2. In the second phase, Confusion Matrix is build up for each of the classifier. This Confusion Matrix is then further used for classifying the testing data to one of the classes.

3. In the third phase, a decision is inferred by combining the outputs of each classifier with considering Confusion Matrix which tells the confidence and the accuracy of each classifier in their results.

