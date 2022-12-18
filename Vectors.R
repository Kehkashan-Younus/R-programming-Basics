The simplest and most common data structure in R is the vector
Vectors come in two different flavors: atomic vectors and lists. An atomic vector contains
exactly one data type, whereas a list may contain multiple data types. We'll explore atomic
vectors further before we get to lists

First, create a numeric vector num_vect that contains the values 0.5, 55, -10, and 6.

> num_vect <- c(0.5, 55, -10, 6)

create a variable called tf that gets the result of num_vect < 1, which is read as
| 'num_vect is less than 1'.

> tf <- num_vect < 1

What do you think tf will look like?

1: a single logical value
2: a vector of 4 logical values

Selection: 2


Print the contents of tf now
> tf
[1]  TRUE FALSE  TRUE FALSE

The statement num_vect < 1 is a condition and tf tells us whether each corresponding element of
our numeric vector num_vect satisfies this condition.

The first element of num_vect is 0.5, which is less than 1 and therefore the statement 0.5 < 1
is TRUE. The second element of num_vect is 55, which is greater than 1, so the statement 55 < 1
is FALSE. The same logic applies for the third and fourth elements

Let's try another. Type num_vect >= 6 without assigning the result to a new variable.
> num_vect >= 6
[1] FALSE  TRUE FALSE  TRUE

This time, we are asking whether each individual element of num_vect is greater than OR equal
to 6. Since only 55 and 6 are greater than or equal to 6, the second and fourth elements of the
result are TRUE and the first and third elements are FALSE

The `<` and `>=` symbols in these examples are called 'logical operators'. Other logical
operators include `>`, `<=`, `==` for exact equality, and `!=` for inequality

If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B
(logical 'or' a.k.a. 'union') or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection'). Lastly, !A is the negation of A and is TRUE when A is FALSE and vice versa.

(3 > 5) & (4 == 4)

1: FALSE
2: TRUE
Selection : 1

((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

1: TRUE
2: FALSE

Selection: 1

Create a character vector that contains the following words: "My", "name", "is". Remember to
enclose each word in its own set of double quotes, so that R knows they are character strings.
Store the vector in a variable called my_char

> my_char <- "My", "name", "is"
Error: unexpected ',' in "my_char <- "My","
> my_char <- c("My", "name", "is")

Print the contents of my_char to see what it looks like.

> my_char
[1] "My"   "name" "is"  

Right now, my_char is a character vector of length 3. Let's say we want to join the elements of
my_char together into one continuous character string (i.e. a character vector of length 1). We
can do this using the paste() function

Type paste(my_char, collapse = " ") now. Make sure there's a space between the double quotes in
the `collapse` argument. You'll see why in a second.

> paste(my_char, collapse = " ")
[1] "My name is"

The `collapse` argument to the paste() function tells R that when we join together the elements
of the my_char character vector, we'd like to separate them with single spaces

To add (or 'concatenate') your name to the end of my_char, use the c() function like this:
c(my_char, "your_name_here"). Place your name in double quotes where I've put "your_name_here".
Try it now, storing the result in a new variable called my_name.

> my_name <- c(my_char, "Kehkashan")

> my_name
[1] "My"        "name"      "is"        "Kehkashan"

Now, use the paste() function once more to join the words in my_name together into a single
character string. Don't forget to say collapse = " "!
  
  > paste(my_name, collapse = " ")
[1] "My name is Kehkashan"

we used the paste() function to collapse the elements of a single character
vector. paste() can also be used to join the elements of multiple character vectors.

In the simplest case, we can join two character vectors that are each of length 1 (i.e. join
                                                                                   | two words). Try paste("Hello", "world!", sep = " "), where the `sep` argument tells R that we
| want to separate the joined elements with a single space.

> paste("Hello", "world!", sep = " ")
[1] "Hello world!"


For a slightly more complicated example, we can join two vectors, each of length 3. Use paste() to join the integer vector 1:3 with the character vector c("X", "Y", "Z"). This time, use sep =
 "" to leave no space between the joined elements.

> paste(1:3, c("X", "Y", "Z"), sep = "")
[1] "1X" "2Y" "3Z"

Vector recycling! Try paste(LETTERS, 1:4, sep = "-"), where LETTERS is a predefined variable in
R containing a character vector of all 26 letters in the English alphabet.

> paste(LETTERS, 1:4, sep = "-")
[1] "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" "I-1" "J-2" "K-3" "L-4" "M-1" "N-2" "O-3"
[16] "P-4" "Q-1" "R-2" "S-3" "T-4" "U-1" "V-2" "W-3" "X-4" "Y-1" "Z-2"

Since the character vector LETTERS is longer than the numeric vector 1:4, R simply recycles, or
repeats, 1:4 until it matches the length of LETTERS

Also worth noting is that the numeric vector 1:4 gets 'coerced' into a character vector by the
paste() function

Assign the result of is.na(my_data) to the variable my_na.

> my_na <- is.na(my_data)

> my_data == NA
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[32] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[63] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[94] NA NA NA NA NA NA NA

The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder
for a quantity that is not available. Therefore the logical expression is incomplete and R has
no choice but to return a vector of the same length as my_data that contains all NAs

So, back to the task at hand. Now that we have a vector, my_na, that has a TRUE for every NA
and FALSE for every numeric value, we can compute the total number of NAs in our data

The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and
FALSE as the number 0. Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the
total number of TRUEs

> sum(my_na)
[1] 50

> my_data
[1]  0.40156756          NA -2.33000589          NA  0.70308974 -0.68403587  0.53594239
[8] -0.75298437  0.59864672  3.92186419          NA          NA          NA          NA
[15]  0.45639450          NA          NA          NA          NA  0.53108473          NA
[22] -0.69115297          NA -1.12174891          NA -0.09382902  0.23992575 -0.41008264
[29]          NA  0.48467536          NA          NA -0.80008114          NA  0.23678670
[36] -0.19216550          NA          NA -0.41670878          NA          NA          NA
[43] -2.68015029          NA          NA          NA          NA          NA -0.34702144
[50]          NA  0.15950621 -0.97309123          NA  0.14024842          NA          NA
[57] -1.50845879          NA          NA          NA          NA -0.23906182  0.99252223
[64]  0.02414207 -0.64789606          NA          NA  1.64379353          NA -1.31948090
[71]          NA          NA -1.16599651 -1.62225819          NA          NA -1.99508299
[78]          NA  1.56824898          NA  0.12921605 -0.05635996          NA          NA
[85]          NA -0.77864278  0.90767622  0.46758310 -0.22146699  0.15021852  0.37480755
[92]  0.77189474 -2.17402493  0.48669677          NA          NA -0.14427407          NA
[99]  0.98323787 -0.65937976



Now that we've got NAs down pat, let's look at a second type of missing value -- NaN, which
stands for 'not a number'. To generate NaN, try dividing (using a forward slash) 0 by 0 now.

> 0/0
[1] NaN

Let's do one more, just for fun. In R, Inf stands for infinity. What happens if you subtract
| Inf from Inf?

> 0-0
[1] 0

Type Inf - Inf. Can you guess the result?

> 0 - 0
[1] 0

> Inf - Inf
[1] NaN






















