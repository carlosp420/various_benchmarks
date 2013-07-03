# R code to extract and plot times of execution for several benchmarks

b1 <- read.csv("benchmark1.txt", header=FALSE, sep="\t")
b2 <- read.csv("benchmark2.txt", header=FALSE, sep="\t")
b3 <- read.csv("benchmark3.txt", header=FALSE, sep="\t")
b4 <- read.csv("benchmark4.txt", header=FALSE, sep="\t")
b5 <- read.csv("benchmark5.txt", header=FALSE, sep="\t")

#sub(" user,", "", a)
b1_times <- c();
b2_times <- c();
b3_times <- c();
b4_times <- c();
b5_times <- c();

for( i in 1:length(b1[,3]) ) {
    b1_times <- append(b1_times, as.double(sub(" user,", "", as.character(b1[i,3]))));
    b2_times <- append(b2_times, as.double(sub(" user,", "", as.character(b2[i,3]))));
    b3_times <- append(b3_times, as.double(sub(" user,", "", as.character(b3[i,3]))));
    b4_times <- append(b4_times, as.double(sub(" user,", "", as.character(b4[i,3]))));
    b5_times <- append(b5_times, as.double(sub(" user,", "", as.character(b5[i,3]))));
}


data <- matrix(ncol=4, nrow=100)
dimnames(data) <- list(c(), c("b1", "b2", "b3", "b4","b5"))

data[,1] <- b1_times
data[,2] <- b2_times
data[,3] <- b3_times
data[,4] <- b4_times
data[,5] <- b5_times

data <- as.data.frame(data)

pdf(file="benchmarks.pdf")
boxplot(data, xlab="benchmark", ylab="time in seconds (s)", 
    main="Time of execution for various processes")
dev.off()
