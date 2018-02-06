# KKTV Data Game 201711

# list input file
files <- list.files(path = ".", pattern = ".csv", recursive = FALSE)

for(file in files){
  # read data
  data.table <- read.table(file, header = TRUE, sep = ",", stringsAsFactors = FALSE)
  data <- as.data.frame(data.table)
  
  platform <- levels(factor(data$platform))
  action <- levels(factor(data$action_trigger))
  internet <- levels(factor(data$internet_connection_type))
  
  # replace factor to numeric value
  for(i in 1:length(platform)){
    data$platform[data$platform == platform[i]] <- (i-1)
  }
  
  for(i in 1:length(action)){
    data$action_trigger[data$action_trigger == action[i]] <- (i-1)
  }
  
  for(i in 1:length(internet)){
    data$internet_connection_type[data$internet_connection_type == internet[i]] <- (i-1)
  }
  
  write.csv(data, paste0("data/", file), quote = FALSE, row.names = FALSE)
}

