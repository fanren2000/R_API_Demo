library(rpart)

set.seed(0)
df <- data.frame(label=sample(c("A", "B"), 100, replace=TRUE),
                 var1=sample(100,100), var2=sample(1000,100), var3=sample(10000,100))

model <- rpart(formula(df), df)
save(model, file="sample_model.RData")
