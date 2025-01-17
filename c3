library(caret)
set.seed(123)
data <- iris
train_index <- createDataPartition(data$Species, p = 0.7, list = FALSE)
train <- data[train_index, ]
test <- data[-train_index, ]

model <- train(Species ~ ., data = train, method = "rpart")
predictions <- predict(model, test)
confusionMatrix(predictions, test$Species)
