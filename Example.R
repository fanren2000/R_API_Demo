#run the commands in the console to launch api
#  > r <- plumb("Example.R")
#  > r$run(port=8080)

#* Get the sum of the 2 numbers
#* @post /sum
function(x, y){
  as.numeric(x) + as.numeric(y)
}

#* @png 
#* @get /plot
function(){
  barplot(1:10, col="lightblue")
}

#* @get /model
function(var1, var2, var3){
  load("sample_model.RData")
  
  test <- data.frame(var1 = as.numeric(var1), 
                      var2 = as.numeric(var2), 
                      var3 = as.numeric(var3))
  
  pred <- predict(model, test)
  pred[1]
}