# R code to extract and plot times of execution for several benchmarks

b1 <- read.csv("benchmark1.txt", header=FALSE, sep="\t")
b2 <- read.csv("benchmark2.txt", header=FALSE, sep="\t")

#sub(" user,", "", a)
b1_times <- c();
b2_times <- c();

for( i in 1:length(b1[,3]) ) {
    b1_times <- append(b1_times, as.double(sub(" user,", "", as.character(b1[i,3]))));
    b2_times <- append(b2_times, as.double(sub(" user,", "", as.character(b2[i,3]))));
}

print(paste("mean: ", mean(user_times)))
print(paste("standard deviation: ", sd(user_times)))

data <- matrix(ncol=2, nrow=100)
dimnames(data) <- list(c(), c("b1", "b2"))

data[,1] <- b1_times
data[,2] <- b2_times

data <- as.data.frame(data)

pdf(file="benchmarks.pdf")
boxplot(data, xlab="benchmark", ylab="time in seconds (s)", 
    main="Time of execution for various processes")
dev.off()