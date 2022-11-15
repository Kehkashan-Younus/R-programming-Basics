# R-programming-Basics
## Basic data types in R can be divided into the following types:

1- Numeric - (11.5, 33, 982)

2- Integer  - (3L, 23L, 200L, where the letter "L" declares this as an integer)

3- Complex - (4 + 3i, where "i" is the imaginary part)

4- Character - ( or string)- ("a", "I am happy", "TRUE", "4.5")

5- Logical - (or boolean) - (TRUE or FALSE)


## Type Conversion

How to convert one type to another?
let's see and practice in R as we go along!

as.numeric()

as.integer()

as.complex()


## R Math

Now, let's look into the R Math

In R, you can use operators to perform common mathematical operations on numbers.

The + operator is used to add together two values:
For example 10 + 5

Also,

The - operator is used for subtraction as:
10 - 5

Other Built-In functions for Math are:

min()

max()

sqrt()

abs()

ceiling()

floor()

Lets discuss some other operators:

Multiplication - x*y


Division - x/y

Exponent - x ^ y

Modulus (Remainder from division)	- x %% y

Integer Division	- x%%y

Equal	-  x== y

Not equal	- x != y

Greater than	- x > y	

Less than	x < y

Greater than or equal to	x >= y

Less than or equal to	x <= y


## R Strings

A string is surrounded by either single quotation marks, or double quotation marks:

str <- "Hello"


If you want the line breaks to be inserted at the same position as in the code, use the cat() function:

cat(str)


How to find the number of characters in a string?
 
Use nchar() function
 
How to combine two strings?
 
Use the paste() function to merge/concatenate two strings:

Example: paste(x, y)

Escape characters in R:

\\	Backslash

\n	New Line

\r	Carriage Return

\t	Tab

\b	Backspace











