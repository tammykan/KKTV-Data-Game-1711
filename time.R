# time slot
# time slot [0,1,2,3]

time.table <- read.table("time-data.csv", header = FALSE, sep = ",")
#time.table <- data.frame(id = time.table[,1], time = strptime(time.table[,2], "%Y-%m-%d %H:%M:%OS"), slot = 0)
time.table <- data.frame(id = time.table[,1], time = time.table[,2], slot = 0)

time.table$hour <- as.numeric(substr(time.table$time, 12, 13))
#time.table$min <- as.numeric(substr(time.table$time, 15, 16))

for(i in 1:nrow(time.table)) {
  if(time.table[i,]$hour >= 1 && time.table[i,]$hour < 9)
    time.table[i,]$slot <- 0
  else if(time.table[i,]$hour >= 9 && time.table[i,]$hour < 17)
    time.table[i,]$slot <- 1
  else if(time.table[i,]$hour >= 17 && time.table[i,]$hour < 21)
    time.table[i,]$slot <- 2
  else if(time.table[i,]$hour >= 21 && time.table[i,]$hour < 1)
    time.table[i,]$slot <- 3
  
  print(time.table[i,]$id)
}

write.csv(time.table, "time-slot.csv", quote = FALSE, row.names = FALSE)