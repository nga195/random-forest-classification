# Gene-Based IBD Detection
Operated Random Forest Classification to predict the three distinct IBS statuses of patients: Ulcerative Colitis, Crohn’s Disease, and Normal

## Table of Contents

- [Introduction](#introduction)
- [Data Description](#data-description)
- [Research Questions](#research-questions)
- [Methodology](#methodology)
- [Analysis](#analysis)
- [Result and discussion](#result-and-discussion)
- [References](#references)


## Introduction
This report dives into the analysis of a microarray dataset, a type of data that captures the expression levels of thousands of genes simultaneously. The primary objective is to use the Random Forest Classification, a powerful machine learning algorithm, to predict the three distinct statuses of Irritable Bowel Syndrome (IBS) in patients: Ulcerative Colitis, Crohn’s Disease, and Normal.

The Random Forest Classification algorithm is chosen for its ability to handle high-dimensional data and its robustness against overfitting. It operates by constructing multiple decision trees during training and outputting the class that is the mode of the classes of individual trees.

The three distinct forms of IBS - Ulcerative Colitis, Crohn’s Disease, and Normal - are the target variables in this study. These conditions are differentiated based on the patterns in the gene expression data. The comparison of these predicted variables will provide insights into the accuracy and effectiveness



## Data Description

The data source for this report is a global gene expression dataset generated using the Affymetrix HG-U133A human GeneChip array. This array is a high-throughput tool that allows for the simultaneous analysis of thousands of genes. The dataset includes gene expression profiles for a total of 126 individuals, comprising 41 healthy people, 26 patients with Ulcerative Colitis (UC), and 59 patients with Crohn’s Disease (CD).

The process of data generation involved the use of sophisticated software to examine the genes of IBD candidates. Out of a total of 225 distinct genes identified, 185 were found on the Affymetrix HG-U133A human GeneChip array. These 185 potential genes are associated with 309 probesets, which are specific sequences designed to detect the expression of a particular gene.

The structure of the dataset is such that each row corresponds to a probeset, and each column represents an individual from the study. The first column lists the names of the probesets (Probe.Set.ID), and the first row lists the patient IDs.

The dataset includes the following variables:

- Probe.Set.ID: This represents the names of the 309 probesets.
- Group: This categorizes the individuals into one of three groups: Normal, Ulcerative Colitis (UC), or Crohn’s Disease (CD).
- Age: This represents the age of the individuals in years.
- Ethnicity: This represents the national, ethnic, or cultural origins of the individuals.
- Sex: This indicates the sex of the individuals, either male or female.

This comprehensive dataset serves as the foundation for the machine learning analysis conducted in this report, with the aim of determining whether gene expression data can identify patients with inflammatory bowel disease. The findings from this study could potentially contribute to the diagnosis and treatment strategies for IBD.


Data Source: [https://ssc.ca/sites/default/files/case-studies/ssc_case_study_2_inflammatory_bowel_disease.xlsx)

## Research Questions

1. Can data features be used to cluster individuals into three biological groups?

  Clustering is an unsupervised machine learning technique that groups similar instances on the basis of features. In this context, the features are variables, probesets, or genes. The aim is to cluster individuals into three biological groups: healthy individuals, CD patients, and UC patients.
  The hypothesis is that gene expression profiles (the data features) of individuals from these three groups would be significantly different. Therefore, a clustering algorithm could potentially group individuals based on the similarity of their gene expression profiles, effectively distinguishing between healthy individuals, CD patients, and UC patients.
  Techniques such as K-means clustering, hierarchical clustering, or DBSCAN could be employed. The choice of algorithm would depend on the specific characteristics of the dataset.

2. Can data features predict the disease state of individuals from three biological groups?

  This question pertains to supervised learning, where a model is trained on labeled data. In this case, the labels would be the disease state of individuals: healthy, CD, or UC.
  The goal is to use the gene expression data (the features) to predict these labels. This involves training a model on a portion of the data where the disease state is known, and then testing the model on unseen data to evaluate its performance.
  The Random Forest Classification algorithm, as mentioned in the report, is one such supervised learning algorithm that can be used for this purpose. It is particularly well-suited to this task due to its ability to handle high-dimensional data and its robustness against overfitting.

The performance of the model can be evaluated using metrics such as accuracy, precision, recall, or F1 score. Additionally, techniques such as Cross-Validation can be used to ensure that the model generalizes well to unseen data.

In conclusion, both clustering and predictive modeling techniques can be applied to gene expression data to gain insights into IBD. These approaches could potentially lead to more precise diagnoses and better-targeted treatments for individuals suffering from this debilitating condition.



## Methodology

Random forest is a machine learning method that combines multiple decision trees to produce a single prediction. It can handle both classification and regression problems, as well as missing values and outliers:
The main steps of the random forest algorithm are:
  1. Bootstrap sampling: For each tree in the forest, a random sample of the data is drawn with replacement (meaning that some data points may be repeated and some may be left out). This creates a diverse set of training data for each tree and reduces the correlation among them.
  2. Feature selection: For each split in each tree, a random subset of the features (or variables) is chosen as candidates for the best split. This adds more randomness and variety to the trees and prevents them from relying on the same features.
  3. Tree building: Each tree is grown to its maximum depth without pruning, meaning that each leaf node contains only one data point or a very small number of data points. This allows the trees to capture complex patterns and interactions in the data, but also makes them prone to overfitting.
  4. Prediction: For a new data point, each tree in the forest makes a prediction based on the values of the features. For classification, the final prediction is the most common class among the trees (also known as majority voting). For regression, the final prediction is the average of the predictions of the trees.


## Analysis

Data preprocessing

We imported the raw dataset and performed some preprocessing steps, such as transposing the data and removing unnecessary rows or columns. We also factored the predictor variables (the columns of data) and the dependent variable (Groups), which indicates the patients’ status.

**Model 1: Normal vs Disease**

For the first model, we separated the data into two groups: Normal and Disease. We combined the patients with Ulcerative Colitis (UC) and Crohn’s Disease (CD) into one group and named it Disease. We used 80% of the dataset as the training data and 20% as the testing data. The training set was used to build the model, while the testing set was used to evaluate its performance on unseen data. This reduces variability since the cross-validation approach uses multiple divisions and the results are aggregated to determine the model’s prediction accuracy.

We used the Random Forest Classification algorithm to predict the Groups variable using all the predictor variables. We specified the number of trees to be generated as 100 (ntree = 100) to minimize the leakage of data. The model selected an optimal number of features to be used in the construction of each tree as 2 (mtry = 2) to maximize the cross-validation accuracy. The error of the first model was 13.44, and the accuracy for the predictor was approximately 89.16%.

**Model 2: Normal vs Ulcerative Colitis**

For the second model, we compared the Normal group with the Ulcerative Colitis group and created a new dataset named final1 (refer to Appendix 1). We repeated the same steps as in the first model, using the same algorithm and parameters. The error of the second model was 12.65, and the accuracy for the predictor was nearly 89.48%.

**Model 3: Normal vs Crohn’s Disease**

For the third model, we compared the Normal group with the Crohn’s Disease group and created a new dataset named final2 (refer to Appendix 2). We repeated the same steps as in the first model, using the same algorithm and parameters. The error of the third model was 11.07692, and the accuracy for the predictor was around 89.92%.



## Result and discussion


I compared the results for each model using the cross-validation accuracy as the evaluation metric. The cross-validation accuracy measures how well the model can generalize to unseen data by using multiple splits of the data and averaging the results.

**Model 1: Normal vs Disease**. This model achieved a cross-validation accuracy of 89.16%, which means that it correctly predicted the status of 89.16% of the patients in the testing set. This model used all the patients with UC or CD as one group (Disease) and compared them with the patients without any IBS (Normal).

**Model 2: Normal vs Ulcerative Colitis**. This model achieved a cross-validation accuracy of 89.48%, which is slightly better than model 1. This model used only the patients with UC as one group and compared them with the Normal group. This suggests that the model can distinguish between UC and Normal patients better than between Disease and Normal patients.

**Model 3: Normal vs Crohn’s Disease**. This model achieved a cross-validation accuracy of 89.92%, which is the best among the three models. This model used only the patients with CD as one group and compared them with the Normal group. This suggests that the model can distinguish between CD and Normal patients better than between UC and Normal patients or between Disease and Normal patients.

Based on these results, I can conclude that the Random Forest Classification algorithm can be used to predict the three different IBS statuses of patients: UC, CD, and Normal. However, since the limitation of random forest is that it might require more trees for the model to be more accurate and precise, I also explored some alternative models to improve the performance.

**Model 4: Ulcerative Colitis vs Disease**. This model compared the patients with UC with the patients with CD or Normal as one group (Disease). This model achieved a cross-validation accuracy of 91.36%, which is higher than any of the previous models. This suggests that the model can differentiate between UC and non-UC patients very well.

**Model 5: Crohn’s Disease vs Disease**. This model compared the patients with CD with the patients with UC or Normal as one group (Disease). This model achieved a cross-validation accuracy of 92.24%, which is the highest among all the models. This suggests that the model can differentiate between CD and non-CD patients very well.

By comparing these models, I can see that the models that use only one type of IBS as one group and the rest as another group perform better than the models that use two types of IBS as one group and Normal as another group. This implies that the predictor variables have more discriminative power for distinguishing between different types of IBS than between IBS and non-IBS.

In conclusion, Random Forest Classification has done a great job in predicting three distinct IBS statuses of patients by comparing five models and applying cross-validation to obtain the misclassification error. The accuracy predictions were substantially high for all models, ranging from 89.16% to 92.24%. Simultaneously, this method reduces the capacity of the model and the risk of overfitting.




## References

1. Statistical Society of Canada. Case Study #2: Can Gene Expression Data Identify Patients with Inflammatory Bowel Disease? | Statistical Society of Canada. (n.d.). Retrieved April 21, 2023, from https://ssc.ca/en/meeting/annual/2017/case-study-2
2. IBD: Crohn's disease. Canadian Digestive Health Foundation. (2022, October 21). Retrieved April 21, 2023, from https://cdhf.ca/en/digestive-conditions/ibd-crohns-disease/#:~:text=Canada%20has%20one%20of%20the,to%20long%2Dterm%20work%20loss.








