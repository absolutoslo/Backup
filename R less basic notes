#R less basic notes

##Write functions 

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


####Set default value in function

f <- function(a, b = 1, c = 2, d = NULL) {
        }

In addition to not specifying a default value, you can also set an argument value to NULL


##Times in R

Dates use the Date class
Times use the POSIXct and POSIXlt class

Times are represented using the POSIXct or the POSIXlt class

    POSIXct is just a very large integer under the hood; it use a useful class when you want to store times in something like a data frame
    POSIXlt is a list underneath and it stores a bunch of other useful information like the day of the week, day of the year, month, day of the month

There are a number of generic functions that work on dates and times

    weekdays: give the day of the week
    months: give the month name
    quarters: give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

Times can be coerced from a character string using the as.POSIXlt or as.POSIXct function

Sys.time()  ##with capital! returns the current system time
unclass()   ##display the object instead of the class

> x = Sys.time()
> x
[1] "2015-07-27 20:44:56 CEST"

> p <- as.POSIXlt(x)

> unclass(x)
[1] 1438022697

> names(p)
NULL

> names(unclass(p))
 [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"   "isdst"  "zone"  
[11] "gmtoff"

> p$sec
[1] 56.91341
> p$mday
[1] 27
> p$zone
[1] "CEST"
> p$gmtoff
[1] 7200
> p$wday
[1] 1

Finally, there is the strptime function in case your dates are written in a different format

datestring <- c("January 10, 2012 10:40", "December 9, 2011
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
## [1] "2012-01-10 10:40:00" "2011-12-09 09:10:00"
class(x)
## [1] "POSIXlt" "POSIXt"

You can use mathematical operations on dates and times. Well, really just + and -. You can do comparisons too (i.e. ==, <=)
> x <- as.Date("2012-01-01")
> x
[1] "2012-01-01"
> y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
> y
[1] "2011-01-09 11:34:21 CET"
> x-y
Error in x - y : non-numeric argument to binary operator
In addition: Warning message:
Incompatible methods ("-.Date", "-.POSIXt") for "-" 
> x <- as.POSIXlt(x)
> x-y
Time difference of 356.5595 days

x <- as.Date("2012-03-01") y <- as.Date("2012-02-28") 
x-y
## Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT") 
y-x
## Time difference of 1 hours


##Format as date
```{r}
selenium = read.csv("c:/users/cdiloreto/desktop/28-08-2015.csv")

selenium$last_change = format.Date(selenium$last_change)
min(selenium$last_change)
```


##Loop functions
Lapply
http://datasciencespecialization.github.io/courses/02_RProgramming/lapply/index.html
Apply
http://datasciencespecialization.github.io/courses/02_RProgramming/apply/index.html
Mapply
http://datasciencespecialization.github.io/courses/02_RProgramming/mapply/index.html
Tapply
http://datasciencespecialization.github.io/courses/02_RProgramming/tapply/index.html


##str() Function
Use as alternative to summary() function


##Simulation
####Generate random numbers


Functions for probability distributions in R

    rnorm: generate random Normal variates with a given mean and standard deviation
    dnorm: evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
    pnorm: evaluate the cumulative distribution function for a Normal distribution
    rpois: generate random Poisson variates with a given rate

 

Probability distribution functions usually have four functions associated with them. The functions are prefixed with a

    d for density
    r for random number generation
    p for cumulative distribution
    q for quantile function

> x <- rnorm(10) 
> x
 [1] 1.38380206 0.48772671 0.53403109 0.66721944
 [5] 0.01585029 0.37945986 1.31096736 0.55330472
 [9] 1.22090852 0.45236742
> x <- rnorm(10, 20, 2) 
> x
 [1] 23.38812 20.16846 21.87999 20.73813 19.59020
 [6] 18.73439 18.31721 22.51748 20.36966 21.04371
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  18.32   19.73   20.55   20.67   21.67   23.39

##Optimization


Using system.time()

    Takes an arbitrary R expression as input (can be wrapped in curly braces) and returns the amount of time taken to evaluate the expression

    Computes the time (in seconds) needed to execute an expression
        If there’s an error, gives time until the error occurred

    Returns an object of class proc_time
        user time: time charged to the CPU(s) for this expression
        elapsed time: "wall clock" time


