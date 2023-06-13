data_csv <- read.csv("HW2data.csv")
score_csv <- read.csv("HW2grade.csv")

grade_array <- rep("", 101)
for(i in 1:nrow(score_csv))
{
 grade_array[(score_csv[i,"From"]+1):(score_csv[i,"To"]+1)] <- score_csv[i,"Grade"]
}

for(i in 1:nrow(data_csv)) {
 score <- data_csv[i, 4] * 0.1 + data_csv[i, 5] * 0.1 + data_csv[i, 6] * 0.1 +
 data_csv[i, 7] * 0.3 + data_csv[i, 8] * 0.4
 current_row <- data_csv[i,]
 cat(sprintf("NO:%s, ID:%s, Name:%s\n", current_row[1],current_row[2], current_row[3]))
 cat(sprintf("Score:%.2f, Grade:%s\n\n", score, grade_array[round(score)+1]))
}