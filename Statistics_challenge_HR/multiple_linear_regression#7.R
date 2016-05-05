split_str_to_numeric <- function(input){
  a1 <- as.character(line1)
  a2 <- strsplit(a1, " ")
  a3 <- unlist(a2)
  a4 <- as.vector(as.numeric(a3))
  a4
}

rename_Col <- function(input) {
  for (i in 1:ncol(input)) {
    names(input)[i] <- i 
  }
  input
}

f <- file("stdin")

open(f)

line1 <- readLines(f, n = 1)
line1 <- split_str_to_numeric(line1)

house_df <- data.frame()
feat_num <- line1[1];
house_qty <- line1[2];

for (i in 1:(house_qty)) {
  line1 <- readLines(f,n = 1)
  line1 <- split_str_to_numeric(line1)
  house_df <- rbind(house_df, line1)
}

house_df <- rename_Col(house_df)

line1 <- readLines(f,n = 1)
line1 <- split_str_to_numeric(line1)

house_pred_df <- data.frame()

house_wo_price <- line1[1]

for (i in 1:(house_wo_price)) {
  line1 <- readLines(f,n = 1)
  line1 <- split_str_to_numeric(line1)
  house_pred_df <- rbind(house_pred_df, line1)
}

house_pred_df <- rename_Col(house_pred_df)

price <- house_df[,ncol(house_df)]
features <- house_df[,1:ncol(house_df) - 1]

#print(price)
#print(features)

regression <- lm(price ~ ., data=features);

prediction <- as.data.frame(predict(regression, house_pred_df));

for (i in prediction) write(i, stdout())

close(f)