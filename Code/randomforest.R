
library(dplyr)
library(randomForest)
library(caret)
library(readr)

### Importing Data and transposing and removing col and row
df = read.csv("data.csv")

df = data.frame(df)
df = t(df)
colnames(df) = df[1,]
df = df[-1,]


df = data.frame(df)

df$Age =as.integer(df$Age)
df_split1=df[,1:4]


df_split2 = df[,5:dim(df)[2]]
df_split2 = df_split2 %>% mutate_if(is.character, as.numeric)
df= data.frame(cbind(df_split1, df_split2))
df1<-df
### Factoring predictor variables and dependent variable
predCats = c("Group","Ethnicity", "Sex")

df1[predCats] = lapply(df1[predCats], factor)
class(df1$Group) # Should output factor
levels(df1$Group) = c("Disease","Normal", "Disease")
levels(df1$Group)

d1<-subset(df,subset=df$Group=="Crohn's Disease"  )
d2<-subset(df,subset=df$Group=="Ulcerative Colitis"  )
d3<-subset(df,subset=df$Group=="Normal"  )

final<-rbind(d1,d3)  
final1 <- final

final1<-data.frame(final1)
final1[predCats] = lapply(final1[predCats], factor)
class(final1$Group) 
levels(final1$Group) = c("Crohn's Disease","Normal")
levels(final1$Group) 


final<-rbind(d2,d3)  
final2 <- final
final2<-data.frame(final2)
final2[predCats] = lapply(final2[predCats], factor)
class(final2$Group) 
levels(final2$Group) = c("Ulcerative Colitis", "Normal")
levels(final2$Group) 

library(randomForest)
nt<-round(0.8*dim(df)[1])
n<- dim(df)[1]
rep<-100
neval = n - nt

error1<-dim(rep)
sum1<-0

for(k in 1:rep){
  train=sample(1:n,nt)
  datatrain1=df1[train, ]
  datatest1=df1[-train,]
  ytest1=datatest1$Group
  rf=randomForest(Group~.,data = datatrain1,type=classification, ntree=100,mtry=2)
  pred<-predict(rf,datatest1)
  table_rf=table(ytest1,pred)
  error1<-(neval-sum(diag(table_rf)))/neval
  sum1<-sum1+error1
  
}
mean(sum1)


control <- trainControl(method = "cv", number = 10)
model_cv <- train(Group ~., data = datatrain1, method = "rf", trControl = control)
print(model_cv)


nt<-round(0.8*dim(final1)[1])
          n<- dim(final1)[1]
          rep<-100
          neval = n - nt
          
          
          error2<-dim(rep)
          sum2<- 0
          for(k in 1:rep){
            train2=sample(1:n,nt)
            datatrain2=final1[train2, ]
            datatest2=final1[-train2,]
            ytest2=datatest2$Group
            rf_2=randomForest(Group~.,data = datatrain2,type=classification, ntree=100,mtry=2)
            pred<-predict(rf_2,datatest2)
            table_rf2=table(ytest2,pred)
            error2<-(neval-sum(diag(table_rf)))/neval
            sum2<-sum2+error2
          }
          mean(sum2)
          control <- trainControl(method = "cv", number = 10)
          model_cv <- train(Group ~., data = datatrain2, method = "rf", trControl = control)
          print(model_cv)
          
          nt<-round(0.8*dim(final2)[1])
          n<- dim(final2)[1]
          rep<-100
          neval = n - nt
          
          
          error3<-dim(rep)
          sum3 <-0
          for(k in 1:rep){
            train3=sample(1:n,nt)
            datatrain3=final2[train3, ]
            datatest3=final2[-train3,]
            ytest3=datatest3$Group
            rf_3=randomForest(Group~.,data = datatrain3,type=classification, ntree=100,mtry=2)
            pred<-predict(rf_3,datatest3)
            table_rf=table(ytest3,pred)
            error3<-(neval-sum(diag(table_rf)))/neval
            sum3<-sum3+error3
            
          }
          mean(sum3)
          control <- trainControl(method = "cv", number = 10)
          model_cv <- train(Group ~., data = datatrain3, method = "rf", trControl = control)
          print(model_cv)
