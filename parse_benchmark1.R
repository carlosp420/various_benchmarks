times <- read.csv("benchmark1.txt", header=FALSE, sep="\t")

#sub(" user,", "", a)
user_times <- c();

for( i in 1:length(times[,3]) ) {
    user_times <- append(user_times, as.double(sub(" user,", "", as.character(times[i,3]))));
}

print(paste("mean: ", mean(user_times)))
print(paste("standard deviation: ", sd(user_times)))