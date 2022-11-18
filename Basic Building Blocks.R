5 + 7   
[1] 12      # In its simplest form, R can be used as an interactive calculator

As R is the programming language and has automoted processes,if 
we may want to use our result from above in a second calculation.
Instead of retyping 5 + 7 every time we need it, we can just create a new variable
that stores the result

The way you assign a value to a variable in R is by using the assignment operator,
which is just a 'less than' symbol followed by a 'minus' sign. It looks like this:
<-
  
To assign the result of 5 + 7 to a new variable called x, you type
x <- 5 + 7
> x
[1] 12

Now, let's create a small collection of numbers called a vector
Any object that contains data is called a data structure and 
numeric vectors are the simplest type of data structure in R. 
In fact, even a single number is considered a vector of length
one

The easiest way to create a vector is with the c() function, which stands for
'concatenate' or 'combine'. To create a vector containing the numbers 1.1, 9, and
3.14, type c(1.1, 9, 3.14). Try it now and store the result in a variable 
called z.

> z <- c(1.1, 9, 3.14)


Anytime you have questions about a particular function, you can access R's 
built-in help files via the `?` command

> ?c

Type z to view its contents. Notice that there are no commas separating the values in
the output.

> z
[1] 1.10 9.00 3.14


We can combine vectors to make a new vector. Create a new vector that 
contains z, 555, then z again in that order. Don't assign this vector to a new variable, so that
| we can just see the result immediately.

> c(z, 555, z)
[1]   1.10   9.00   3.14 555.00   1.10   9.00   3.14


Numeric vectors can be used in arithmetic expressions. Type the following to 
see what
happens:
z * 2 + 100.

> z * 2 + 100
[1] 102.20 118.00 106.28

First, R multiplied each of the three elements in z by 2. Then it added 100 to 
each element to get the result you see above


Take the square root of z - 1 and assign it to a new variable called my_sqrt.

> my_sqrt <- sqrt(z - 1)
> my_sqrt
[1] 0.3162278 2.8284271 1.4628739


R first subtracted 1 from each element of z, then took the
square root of each element. This leaves you with a vector of the 
same length as the original vector z


Now we will create a variable called my_div that gets the value of z divided 
by my_sqrt

> my_div <- z/my_sqrt
> my_div
[1] 3.478505 3.181981 2.146460


When given two vectors of the same length, R simply performs the specified 
arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. If the 
vectors are of different lengths, R 'recycles' the shorter vector until it 
is the same length as the longer vector

When we did z * 2 + 100 in our earlier example, z was a vector 
of length 3, but technically 2 and 100 are each vectors of length 1

Behind the scenes, R is 'recycling' the 2 to make a vector of 2s and 
the 100 to make a vector of 100s. In other words, when you ask R to
compute z * 2 + 100, what it really computes is this: 
z * c(2, 2, 2) + c(100, 100, 100)


To see another example of how this vector 'recycling' works, try adding
c(1, 2, 3, 4) and c(0, 10). We will save the result in a new variable.

> c <- c(1,2,3,4) + c(0, 10)

Now if we enter c(1, 2, 3, 4) + c(0, 10) in the console to see how 
R adds two vectors of different length. Don't assign the result to a variable.

> c(1, 2, 3, 4) + c(0, 10)
[1]  1 12  3 14


If the length of the shorter vector does not divide evenly into the 
length of the longer vector, R will still apply the 'recycling' method, 
but will throw a warning to let you know something fishy might be going on
For Example:

Try c(1, 2, 3, 4) + c(0, 10, 100) 
> c(1, 2, 3, 4) + c(0, 10, 100)
[1]   1  12 103   4
Warning message:
  In c(1, 2, 3, 4) + c(0, 10, 100) :
  longer object length is not a multiple of shorter object length



















  


