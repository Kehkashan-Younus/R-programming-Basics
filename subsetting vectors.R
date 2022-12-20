we'll see how to extract elements from a vector based on some conditions that
we specify.

we may only be interested in the first 20 elements of a vector, or only the
elements that are not NA, or only those that are positive or correspond to a specific variable
of interest. By the end of this lesson, you'll know how to handle each of these scenarios.

For example a vector called x that contains a random ordering of 20 numbers (from a
| standard normal distribution) and 20 NAs. Type x now to see what it looks like.

> x
[1]          NA  0.22695664  0.50320109          NA -0.61340903 -0.33078856 -2.03035920
[8] -0.84037692 -0.02125889          NA -0.95043330          NA -0.22758537          NA
[15]  0.13218681          NA          NA  0.56956457 -2.30900667          NA          NA
[22]          NA          NA          NA -0.27326550          NA          NA          NA
[29]          NA -0.73812548  2.01750549 -1.83780053          NA          NA          NA
[36]  0.47819727 -0.79304031  0.23145548  0.60723191          NA

The way you tell R that you want to select some particular elements (i.e. a 'subset') from avector is by placing an 'index vector' in square brackets immediately following the name of the
vector.

For a simple example, if I try x[1:10] to view the first ten elements of x.

> x[1:10]
[1]          NA  0.22695664  0.50320109          NA -0.61340903 -0.33078856 -2.03035920
[8] -0.84037692 -0.02125889          NA

Index vectors come in four different flavors -- logical vectors, vectors of positive integers,
vectors of negative integers, and vectors of character strings 

Let's start by indexing with logical vectors. One common scenario when working with real-world
data is that we want to extract all elements of a vector that are not NA (i.e. missing data).
Recall that is.na(x) yields a vector of logical values the same length as x, with TRUEs
corresponding to NA values in x and FALSEs corresponding to non-NA values in x.


Prove it to yourself by typing x[is.na(x)].

> x[is.na(x)]
 [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

Recall that `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is
not NA'. Therefore, if we want to create a vector called y that contains all of the non-NA
values from x, we can use y <- x[!is.na(x)]. Give it a try.

> y <- x[!is.na(x)]

Print y to the console.

> y
[1]  0.22695664  0.50320109 -0.61340903 -0.33078856 -2.03035920 -0.84037692 -0.02125889
[8] -0.95043330 -0.22758537  0.13218681  0.56956457 -2.30900667 -0.27326550 -0.73812548
[15]  2.01750549 -1.83780053  0.47819727 -0.79304031  0.23145548  0.60723191

Now that we've isolated the non-missing values of x and put them in y, we can subset y as we
please.

Type y[y > 0] to see that we get all of the positive elements of y, which are also the positive
| elements of our original vector x.

> y[y>0]
[1] 0.2269566 0.5032011 0.1321868 0.5695646 2.0175055 0.4781973 0.2314555 0.6072319

| You might wonder why we didn't just start with x[x > 0] to isolate the positive elements of x.
| Try that now to see why.

> x[x > 0]
[1]        NA 0.2269566 0.5032011        NA        NA        NA        NA 0.1321868        NA
[10]        NA 0.5695646        NA        NA        NA        NA        NA        NA        NA
[19]        NA        NA 2.0175055        NA        NA        NA 0.4781973 0.2314555 0.6072319
[28]        NA

Since NA is not a value, but rather a placeholder for an unknown quantity, the expression NA >
0 evaluates to NA. Hence we get a bunch of NAs mixed in with our positive numbers when we do
this.

Combining our knowledge of logical operators with our new knowledge of subsetting, we could do
| this -- x[!is.na(x) & x > 0]. Try it out.

> x[!is.na(x) & x > 0]
[1] 0.2269566 0.5032011 0.1321868 0.5695646 2.0175055 0.4781973 0.2314555 0.6072319


I've already shown you how to subset just the first ten values of x using x[1:10]. In this
case, we're providing a vector of positive integers inside of the square brackets, which tells
R to return only the elements of x numbered 1 through 10.

Many programming languages use what's called 'zero-based indexing', which function
s that the first element of a vector is considered element 0. R uses 'one-based indexing', which (you guessed
                                                                                   | it!) means the first element of a vector is considered element 1.
Can you figure out how we'd subset the 3rd, 5th, and 7th elements of x? Hint -- Use the c()
function to specify the element numbers as a numeric vector.

> x[c(3, 5, 7)]
[1]  0.5032011 -0.6134090 -2.0303592


It's important that when using integer vectors to subset our vector x, we stick with the set of
indexes {1, 2, ..., 40} since x only has 40 elements. What happens if we ask for the zeroth element of x (i.e. x[0])? Give it a try.

> x[c(0)]
numeric(0)

Try x[0] to see what happens when we refer to the zeroth element of a vector, which is not
defined in R.

> x[0]
numeric(0)

As you might expect, we get nothing useful. Unfortunately, R doesn't prevent us from doing
| this. What if we ask for the 3000th element of x? Try it out.

> x[3000]
[1] NA

What if we're interested in all elements of x EXCEPT the 2nd and 10th? It would be pretty
| tedious to construct a vector containing all numbers 1 through 40 EXCEPT 2 and 10.

Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th
| elements of x, x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.
| Try x[c(-2, -10)] now to see this.

> x[c(-2, -10)]
[1]          NA  0.50320109          NA -0.61340903 -0.33078856 -2.03035920 -0.84037692
[8] -0.02125889 -0.95043330          NA -0.22758537          NA  0.13218681          NA
[15]          NA  0.56956457 -2.30900667          NA          NA          NA          NA
[22]          NA -0.27326550          NA          NA          NA          NA -0.73812548
[29]  2.01750549 -1.83780053          NA          NA          NA  0.47819727 -0.79304031
[36]  0.23145548  0.60723191          NA


A shorthand way of specifying multiple negative numbers is to put the negative sign out in
| front of the vector of positive numbers. Type x[-c(2, 10)] to get the exact same result.

> x[-c(2, 10)]
[1]          NA  0.50320109          NA -0.61340903 -0.33078856 -2.03035920 -0.84037692
[8] -0.02125889 -0.95043330          NA -0.22758537          NA  0.13218681          NA
[15]          NA  0.56956457 -2.30900667          NA          NA          NA          NA
[22]          NA -0.27326550          NA          NA          NA          NA -0.73812548
[29]  2.01750549 -1.83780053          NA          NA          NA  0.47819727 -0.79304031
[36]  0.23145548  0.60723191          NA


So far, we've covered three types of index vectors -- logical, positive integer, and negative
integer. The only remaining type requires us to introduce the concept of 'named' elements.

Create a numeric vector with three named elements using vect <- c(foo = 11, bar = 2, norf =
NA).

> vect <- c(foo = 11, bar = 2, norf = NA)

When we print vect to the console, you'll see that each element has a name. Try it out.

> vect
foo  bar norf 
11    2   NA 

| We can also get the names of vect by passing vect as an argument to the names() function. Give
| that a try.

> names()
Error in names() : 0 argument passed to 'names' which requires 1
> names(vect0)
Error: object 'vect0' not found
> names(vect)
[1] "foo"  "bar"  "norf"


Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA). Do that now.

> vect2 <- c(11, 2, NA)


Then, we can add the `names` attribute to vect2 after the fact with names(vect2) <- c("foo",
                                                                                      | "bar", "norf"). 
> names(vect2) <- c("foo", "bar", "norf")

Now, let's check that vect and vect2 are the same by passing them as arguments to the identical() function.

> identical(vect, vect2)
[1] TRUE





