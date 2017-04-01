
install.packages("HistData")
# Description The 'HistData' package provides a collection of small data sets
# that are interesting and important in the history of statistics and data
# visualization. The goal of the package is to make these available, both for
# instructional use and for historical research. Some of these present interesting
# challenges for graphics or analysis in R
# https://cran.r-project.org/web/packages/HistData/HistData.pdf

library(HistData)

# Description
# Darwin (1876) studied the growth of pairs of zea may (aka corn) seedlings, one produced by crossfertilization
# and the other produced by self-fertilization, but otherwise grown under identical conditions.
# His goal was to demonstrate the greater vigour of the cross-fertilized plants. The data
# recorded are the final height (inches, to the nearest 1/8th) of the plants in each pair.
# In the Design of Experiments, Fisher (1935) used these data to illustrate a paired t-test (well, a 
# one-sample test on the mean difference, cross - self). Later in the book (section 21), he used
# this data to illustrate an early example of a non-parametric permutation test, treating each paired
# difference as having (randomly) either a positive or negative sign.

#Format
# A data frame with 15 observations on the following 4 variables.
# pair: pair number, a numeric vector
# pot: pot, a factor with levels 1 2 3 4
# cross: height of cross fertilized plant, a numeric vector
# self: height of self fertilized plant, a numeric vector
# diff: cross - self for each pair

#(a) Permutation test, where the values of, say self are permuted and diff=cross - self is
#calculated for each permutation. There are 15! permutations, but a reasonably large number of
#random permutations would suffice. But this doesn’t take the paired samples into account.

#(b) Permutation test based on assigning each abs(diff) a + or - sign, and calculating the mean(diff).
# There are 2^15 such possible values. This is essentially what Fisher proposed. 
# The p-value for the test is the proportion of absolute mean differences under such randomization 
# which exceed the observed mean difference.

data(ZeaMays)

View(ZeaMays)

boxplot(ZeaMays[,c("cross", "self")], ylab="Height (in)", xlab="Fertilization")

# examine large individual diff/ces
largediff <- subset(ZeaMays, abs(diff) > 2*sd(abs(diff)))
with(largediff, segments(1, cross, 2, self, col="red"))

# plot cross vs. self.  NB: unusual trend and some unusual points
with(ZeaMays, plot(self, cross, pch=16, cex=1.5))
abline(lm(cross ~ self, data=ZeaMays), col="red", lwd=2)

# pot effects ?
anova(lm(diff ~ pot, data=ZeaMays))

##############################
## Tests of mean difference ##
##############################
# Wilcoxon signed rank test
# signed ranks:
with(ZeaMays, sign(diff) * rank(abs(diff)))
wilcox.test(ZeaMays$cross, ZeaMays$self, conf.int=TRUE, exact=FALSE)

# t-tests
with(ZeaMays, t.test(cross, self))
with(ZeaMays, t.test(diff))

mean(ZeaMays$diff)
# complete permutation distribution of diff, for all 2^15 ways of assigning
# one value to cross and the other to self (thx: Bert Gunter)
(N <- nrow(ZeaMays))
allmeans <- as.matrix(expand.grid(as.data.frame(
    matrix(rep(c(-1,1),N), nr =2))))  %*% abs(ZeaMays$diff) / N

# upper-tail p-value
sum(allmeans >= mean(ZeaMays$diff)) / 2^N
# two-tailed p-value
sum(abs(allmeans) >= mean(ZeaMays$diff)) / 2^N


hist(allmeans, breaks=64, xlab="Mean difference, cross-self",
     main="Histogram of all mean differences")
abline(v=c(1, -1)*mean(ZeaMays$diff), col="red", lwd=2, lty=1:2)

plot(density(allmeans), xlab="Mean difference, cross-self",
     main="Density plot of all mean differences")
abline(v=c(1, -1)*mean(ZeaMays$diff), col="red", lwd=2, lty=1:2)

rep(0,100)




####test


combn(vecTodos(),3)

length(permn(3))
dim(combn(3,2))[2]



grupoA <- c(19, 22, 25, 26)
grupoB <- c(23, 33, 40)
todos <- c(grupoA, grupoB)
perms <- combn(todos,4)

pp <- perms[,1]
todos - perms[,1]

setdiff(perms, todos)

todos[!pp][2]

'%nin%' <- Negate('%in%')

result <- todos[todos %nin% perms[,1]]

paste(as.character(result), collapse=", ")


length(grupoA[grupoA >= 25])

ttest <- t.test(grupoA, grupoB)

str(ttest)

ttest$p.value
ttest$statistic
ttest$conf.int
ttest$alternative
# observar la probabilidad asociada al estadístico T, es decir, su probabilidad de ocurrencia
# si el p-value es inferior al nivel de significación debe rechazarse la hipótesis nula.

# t = -1.7374, df = 2.4151, p-value = 0.2024
#-27.991316   9.991316
#sample estimates:
#    mean of x mean of y 
#   23        32 

sample(perms, 100, replace = TRUE)

monte <- round(runif(100, min=1, max=35), 0)
selected <- perms[,monte]

'%nin%' <- Negate('%in%')

for (i in 1:5){ #:(length(perms))) {
    print(selected[,i])
    b <- todos[todos %nin% selected[,i]]
    print(b)
}

