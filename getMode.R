library(dplyr)

# get mode
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

table <- read.table("train-data.csv", header = FALSE, sep = ",")
table <- data.frame(id = table[,1], action = table[,3], platform = table[,4], internet = table[,5])

new.table <- aggregate.data.frame(table, by = list(table$id), FUN = "Mode")
write.csv(new.table, "train.csv", quote = FALSE, row.names = FALSE)

# duration time
duration.table <- read.table("duration-time.csv", header = FALSE, sep = ",")
duration.table <- data.frame(id = duration.table[,1], duration = duration.table[,2])
new.duration.table <- duration.table[order(duration.table$id),]
write.csv(new.duration.table, "duration.csv", quote = FALSE, row.names = FALSE)

# combine table