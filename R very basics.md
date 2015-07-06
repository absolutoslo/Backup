shttp://tryr.codeschool.com/levels/1/challenges/1

## R


###Get wd - set wd
```
getwd()
[1] "\\\\booking.pcln.com/userdata/AMS9UserHome/cdiloreto/documents"
setwd("C:/Users/cdiloreto/Desktop")
getwd()
[1] "C:/Users/cdiloreto/Desktop"
```

##R packages
```
a <- available.packages()
head(rownames(a), 3)  ## Show names of the first few packages

install.packages("slidify")
install.packages(c("slidify", "ggplot2", "devtools"))

library(slidify)
search()
```

###Save history
```
savehistory("wdNamehere/HistoryfileName.Rhistory")
```

#####Create directory if it does not already exist:
```
if (!file.exists("data")) {
    dir.create("data")
}
```

#####To remove files / directories USE UNLINK()
From the same wd
```
unlink("howmany.files.R")
```

###Clean environment ---
> rm(list = ls())
> ls()
character(0)


## General commands 

<- to assign (or =)

The : operator is used to create integer sequences
x<-1:20
or
seq(5, 9)


seq also allows you to use increments other than 1.

seq(5, 9, 0.5)
[1] 5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5 9.0

> 2 + 2 == 5
[1] FALSE

Rep () function (repeat)
rep("Yo ho!", times = 3)
[1] "Yo ho!" "Yo ho!" "Yo ho!"

Sqrt () function (square root)
sqrt()

The c() Combine function can be used to create vectors of objects ## vectors contain objects of the same class
x <-c(3,5,1,10,12,6)
x <- c(0.5,0.6)## numeric
x <- c(TRUE,FALSE)## logical
x <- c(T,F)## logical
x <- c("a","b","c")## character
x <-9:29## integer
x <- c(1+0i,2+4i)## complex

vector() function

Vector Access
> sentence <- c('walk', 'the', 'plank')
> sentence[3]
[1] "plank"
## add an object to the vector
> sentence[4]= 'to'
sentence[2:4]
[1] "the" "dog" "to"
sentence[c(1, 3)]
[1] "walk" "dog"

You can also set ranges of values; just provide the values in a vector
sentence[5:7] <- c('the', 'poop', 'deck')
sentence[6]
[1] "poop"

Assigning names
> ranks <- 1:3
> names(ranks) <- c("first", "second", "third")
> ranks
 first second  third
     1      2      3
> ranks["first"]
first 
    1


##Visualizations

```
barplot()
plot()
contour() ## 2D
persp() ## 3D
persp(..., expand=0.2) ## limits expansion to 1/5 = 0.2 of the visualizatoin
image() ## heatmap

abline() ## draws a horizontal (h) line on the plot or vertical (v) line

Mean() function returns average of the values
Median() function returns the median value
Sd() function - standard deviation function

Factor() function and plotting with factors
http://tryr.codeschool.com/levels/5/challenges/10
```

##Data frames

data.frames() function creates a data frame!


Sum () function exclude NA
> a= c(2,5,7,NA)
> sum(a)
[1] NA
> sum(a, na.rm= TRUE)
[1] 14

####Class

mixing objects
y <- c(1.7,"a")## character
y <- c(TRUE,2)## numeric
y <- c("a",TRUE)## character

When different objects are mixed in a vector,coercion occurs so that every element in the vector is of the same class

Objects can be explicitly coerced from one class to another using the as.* functions
x <- 0:6  
class(x) 
[ 1 ] "integer" 
as.numeric(x) 
[ 1 ] 0 1 2 3 4 5 6 
as.logical(x) 
[ 1 ] FALSE TRUE TRUE TRUE TRUE TRUE TRUE 
as.character(x) 
[ 1 ] "0" "1" "2" "3" "4" "5" "6"

Lists are a special type of vector that can contain elements of different class
list() function
x <- list(1,"a",TRUE,1+4i)
x

[[1]][1]1

[[2]][1]"a"

[[3]][1]TRUE

[[4]][1]1+4i


matrix() function
m <- matrix(1:6, nrow =2, ncol =3)
reshape matrix with planck() function to assign values
dim() function assigns new nrow and ncol


The 'L' suffix creates an integer vector as opposed to a numeric vector.

The 'cbind' function treats vectors as if they were columns of a matrix. It then takes those vectors and binds them together column-wise to create a matrix.
> x=c(3,4,5,6)
> y=c(9,8,7,6)
> cbind(x,y)
     x y
[1,] 3 9
[2,] 4 8
[3,] 5 7
[4,] 6 6

> x <- data.frame(foo =1:4, bar = c(T,T,F,F)) 
> x
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE



####Subsetting - deprecated!

The single bracket [ operator can be used to subset individual rows of a data frame.


The [[ operator can be used with computed indices; $can only be used with literal names *with no quotes


Subsetting
> x <- c("a" , "b" , "c" , "c" , "d" , "a" ) 
> x[ 1 ] 
[ 1 ] "a" 
> x[ 2 ] 
[ 1 ] "b" 
> x[ 1 : 4 ] 
[ 1 ] "a" "b" "c" "c" 
> x[x > "a" ] 
[ 1 ] "b" "c" "c" "d" 
> u <- x > "a" 
> u 
[ 1 ] FALSE TRUE TRUE TRUE TRUE FALSE 
> x[u] [ 1 ] "b" "c" "c" "d"

Subsetting Lists
> x <- list(foo=1:4,bar=0.6)
> x
$foo
[1] 1 2 3 4

$bar
[1] 0.6

> x[[1]]
[1] 1 2 3 4
> x[[2]]
[1] 0.6
> x$foo
[1] 1 2 3 4
> x$bar
[1] 0.6 

> x <- list(foo = 1 : 4 , bar = 0.6 ,baz ="hello")
> x
$foo
[1] 1 2 3 4

$bar
[1] 0.6

$baz
[1] "hello"

> x[c(1,3)]
$foo
[1] 1 2 3 4

$baz
[1] "hello"

Subsetting Nested Elements of a List
x <- list(a = list( 10 , 12 , 14 ), b = c( 3.14 , 2.81 ))
> x
$a
$a[[1]]
[1] 10

$a[[2]]
[1] 12

$a[[3]]
[1] 14


$b
[1] 3.14 2.81

> x[[c(1,3)]]
[1] 14
> x[[1]][[3]]
[1] 14
> x[[c(2,1)]]
[1] 3.14

Subsetting matrices
> x = matrix(1:6,2,3)
> x[1,2]
[1] 3
> x[2,3]
[1] 6
> x[2,1]
[1] 2

## missing values
> x[1,]
[1] 1 3 5
> x[,2]
[1] 3 4

Partial matching of names is allowed with [[ and $
x$a
x[["a", exact =FALSE]]

Subsetting - Removing NA Values
> x <- c( 1 , 2 , NA , 4 , NA , 5 ) 
> bad <- is.na(x) 
> x[!bad] 
[ 1 ] 1 2 4 5 

> x <- c(1,2,NA,4,NA,5)
> y <- c("a","b",NA,"d",NA,"f")
> good <- complete.cases(x, y)
> good
[1]TRUETRUEFALSETRUEFALSETRUE
> x[good]
[1]1245
> y[good]
[1]"a""b""d""f"


Load data from an external source

You can load a CSV file's content into a data frame by passing the file name to the read.csv function

> read.csv("csv name here")
For text files, Call read.table on "infantry.txt", using tab separators and setting header to TRUE
> read.table("infantry.txt", sep="\t", header=TRUE)
Merge files/data frames
merge(x,y)

```
files = list.files("directory", full.names=TRUE)
dat = data.frame()
for (i in 1:332) {
  dat = rbind(dat,read.csv(files[i])) }
write.csv(dat, "prova1.csv")
```


You can create a logical vector with the expression x %in% 1:5 and then use the [ operator to subset the original vector x.
You can create a logical vector with the expression x <= 5 and then use the [ operator to subset the original vector x.
change value of x to 0 when x between 1 and 5
x[x %in% 1:5] <- 0
x[x <= 5] = 0

You can get the column names of a data frame with the `names()' function.
names(test)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"

**You can extract the first two rows using the [ operator and an integer sequence to index the rows.**

You can use the `nrow()' function to compute the number of rows in a data frame.
> nrow(test)
[1] 153

The `tail()' function is an easy way to extract the last few elements of an R object.
> tail(test)
    Ozone Solar.R Wind Temp Month Day
148    14      20 16.6   63     9  25
149    30     193  6.9   70     9  26
150    NA     145 13.2   77     9  27
151    14     191 14.3   75     9  28
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

The head() function does the opposite (extract head from source directory)
> head(read.csv("specdata/332.csv"))

**The single bracket [ operator can be used to extract individual rows of a data frame.**

**The `is.na' function can be used to test for missing values.**

You need to construct a logical vector in R to match the question's requirements. Then use that logical vector to subset the data frame
subset according to two different conditions at the same time -- use &
data.subset = subset (data, Ozone > 31 & Temp > 90)
data.subset1 = subset (data, Month == 6)

Subset defined [(1)rows, (2)COLUMNS]
data.subset = data[c(1,3,6,34), c(3,4,5)]

##ROUND function

> summary(data$FES)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  1.000   1.000   2.000   2.659   4.000   8.000    2445 
> mean(data$FES)
[1] NA
> mean(data$FES, na.rm=T)
[1] 2.659097
> round(mean(data$FES, na.rm=T), 3)
[1] 2.659


####Write functions - deprecated!

add2 = function(x, y){
        x+y
}
above10= function (x){
        use=x>10 
        x[use]
}
above = function (x, n = 10){
        use = x>n
        x[use]
}