library( dplyr )
library( stargazer )


e <- rnorm(30)
id <- rep( 1:3, each=10 )
org.id <- factor(id)


# x = commercial revenue as % of total
# y = growth rate


# MODEL 1 - OLS

x1  <- 9 + 1:10 + 0*id
y1  <- 25 + x1 + 0*id + e


x <- x1
y <- y1
m1 <- lm( y ~ x )


# MODEL 2 - Random Effect

x2  <- 9 + 1:10 + 0*id
y2  <- 5 + x2 + 10*id + e



x <- x2
y <- y2
m2.ols <- lm( y ~ x )
m2.re <- lm( y ~ x + org.id )


# MODEL 3

x3  <- 1:10 + 5*id
y3  <- 5 + x3 + 10*id + e

x <- x3
y <- y3
m3.ols <- lm( y ~ x )
m3.fe <- lm( y ~ x + org.id )



# MODEL 4 - Dynamic

(rep(1:10,3))[c(F,rep(T,9))]
(rep(1:10,3))[c(rep(T,9),F)]

y4 <- y3[c(F,rep(T,9))]
y.lagged <- y3[c(rep(T,9),F)]
x4 <- x3[c(F,rep(T,9))]

x <- x4
y <- y4
m4 <- lm( y ~ x + y.lagged )



## GRAPHICS

par( mfrow=c(1,3) )


plot( x1, y1, pch=19, col=org.id, cex=2, 
      ylim=c(20,60), xlim=c(0,30),
      bty="n", axes=F,
      xlab="Fertilizer", ylab="Tons of Corn Per Acre", 
      line=1.5, cex.lab=1.5 ) 
axis( side = 1, labels = FALSE )
axis( side = 2, labels = FALSE )
title( main="Scenario 1: All Farms Equal", line=1, cex.main=2 )


plot( x2, y2, pch=19, col=org.id, cex=2, 
      ylim=c(20,60), xlim=c(1,30),
      bty="n", axes=F,
      xlab="Fertilizer", ylab="Tons of Corn Per Acre", 
      cex.lab=1.5 ) 
axis( side = 1, labels = FALSE )
axis( side = 2, labels = FALSE )
title( main="Scenario 2: Land Quality Varies", line=1, cex.main=2 )


plot( x3, y3, pch=19, col=org.id, cex=2, 
      ylim=c(20,60), xlim=c(1,30),
      bty="n", axes=F,
      xlab="Fertilizer", ylab="Tons of Corn Per Acre", 
      line=1.5, cex.lab=1.5 ) 
axis( side = 1, labels = FALSE )
axis( side = 2, labels = FALSE )
title( main="Scenario 3: Management Varies", line=1, cex.main=2 )









stargazer( m1, m2.ols, m2.re, m3.ols, m3.fe, m4,
           type="text",
           intercept.bottom=FALSE, 
           omit="org.id",
           omit.stat=c("f","ser","adj.rsq"),
           digits=2 )


par( mfrow=c(1,3) )

plot( x1, y1, pch=19, col=org.id, cex=1.5 ) 
abline( m1, col="blue" )

plot( x3, y3, pch=19, col=org.id, cex=1.5 ) 
abline( m3.ols, col="blue" )
abline( m3.fe, col="red" )

