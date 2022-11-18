How to examine your local workspace in R and begin to explore the 
relationship between your workspace and the file system of your machine

Determine which directory your R session is using as its current working directory
| using getwd().

> getwd()
[1] "/home/rstudio"


List all the objects in your local workspace using ls().

> ls()
character(0)

Assign 9 to x using x <- 9.

> x <- 9

Type ls() to view all the objects in your workspace

> ls()
[1] "x"

List all the files in your working directory using list.files() or dir().

> list.files()
[1] "Getting Started with Your Lab.rd" "R_Programming.swc"               
[3] "README.rd"                        "Week 1"                          
[5] "Week 2"                           "Week 3"                          
[7] "Week 4"  


As we go through this lesson, you should be examining the help page for each new
function. Check out the help page for list.files with the command ?list.files.

> dir()
[1] "Getting Started with Your Lab.rd" "R_Programming.swc"               
[3] "README.rd"                        "Week 1"                          
[5] "Week 2"                           "Week 3"                          
[7] "Week 4"  


Type ?list.files to see the help page.

> ?list.files

Using the args() function on a function name is also a handy way to see what arguments
a function can take

Use the args() function to determine the arguments to list.files()

Type args(list.files) to see the arguments to list.files.

> args(list.files)
function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, 
          recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, 
          no.. = FALSE) 
  NULL

Assign the value of the current working directory to a variable called "old.dir".

Type old.dir <- getwd() to assign the value of the current working directory 
to a variable called "old.dir"

> old.dir <- getwd()

We will use old.dir later to move back to the place that we
started. A lot of query functions like getwd() have the useful property that they
return the answer to the question as a result of the function


Use dir.create() to create a directory in the current working directory called
| "testdir".

> dir.create("testdir")

Set working directory to "testdir" with the setwd() command.

> setwd("testdir")

In general, we would want our working directory to be someplace sensible,
perhaps created for the specific project that you are working on. In fact, 
organizing your work in R packages using RStudio is an excellent option. 
Check out RStudio at http://www.rstudio.com/
  
Create a file in your working directory called "mytest.R" using the file.create()
function.

> file.create("mytest.R")
[1] TRUE


This should be the only file in this newly created directory. Let's check this by
listing all the files in the current directory.

list.files() shows that the directory only contains mytest.R.

> list.files()
[1] "mytest.R"


Check to see if "mytest.R" exists in the working directory using the file.exists()
function.

> file.exists(0)
Error in file.exists(0) : invalid 'file' argument
> file.exists()
Error in file.exists() : invalid 'file' argument
> file.exists(mytest.R)
Error in file.exists(mytest.R) : object 'mytest.R' not found
> file.exists("mytest.R")
[1] TRUE

Access information about the file "mytest.R" by using file.info()
For example:

> file.info("mytest.R")
         size isdir mode               mtime               ctime               atime
mytest.R    0 FALSE  644 2022-11-03 05:14:22 2022-11-03 05:14:22 2022-11-03 05:14:22
          uid  gid   uname  grname
mytest.R 1000 1000 rstudio rstudio


You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab 
specific items.

...file.info("mytest.R")$mode


Change the name of the file "mytest.R" to "mytest2.R" by using file.rename()

> file.rename("mytest.R", "mytest2.R")
[1] TRUE


Make a copy of "mytest2.R" called "mytest3.R" using file.copy()
> file.rename("mytest.R", "mytest2.R")
[1] TRUE

Provide the relative path to the file "mytest3.R" by using file.path()

> file.path("mytest3.R")
[1] "mytest3.R"


We can use file.path to construct file and directory paths that 
are independent of the operating system your R code is running on. Pass 'folder1' and 'folder2' as
arguments to file.path to make a platform-independent pathname.

> file.path("folder1", "folder2")
[1] "folder1/folder2"

Take a look at the documentation for dir.create by entering ?dir.create . Notice the
'recursive' argument. In order to create nested directories, 'recursive' must be set
to TRUE.

> ?dir.create

Create a directory in the current working directory called "testdir2" and a
subdirectory for it called "testdir3", all in one command by using dir.create() and
file.path()

> dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)

Going back to our original working directory using setwd(). (Recalling that 
we created the variable old.dir with the full path for the orginal working 
directory at the start of these questions.)

Use setwd(old.dir).

> setwd(old.dir)

















  












