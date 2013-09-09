# If you are seeing this file in your browser, go back, right click, and save
# the file.

# This is a brief introduction to Python. We will be around to help you with
# any questions you may have. This is setup as a reference guide but as you go
# along you should be practicing. If you are familiar with programming you will
# still want to skim this document for how Python is different.

# By Jeffrey Bush

# Open IDLE or Spyder. This depends on your OS and how you installed Python.

# On Windows with Python(x,y) it is found at "Start > Programs > Python(x,y)
# > IDLE" (or for Vista and newer just typing IDLE in the Start Menu).

# On Mac with Enthought it is found in "Applications > Enthought > IDLE"
# (or just use Spolight for IDLE)

# Then use "File > Open"

# While going through this tutorial you should type the lines (or variations of
# them) into the Python Shell/Console by typing them after the ">>> " and
# pressing enter. Make sure you know what each line means. Play around with
# them, and try variations to test if you understand the commands.

# Note: If you are used to using Matlab, I recommend checking out
# http://www.scipy.org/NumPy_for_Matlab_Users
# for all the conversions from Matlab to SciPy / NumPy. Biggest thing to
# remember is arrays / matrices are 0-based, not 1-based.


############################# Basics ##########################################
# First, any text after a '#' symbol is a comment and is ignored by Python.
# For example, all of these lines so far are ignored. You should be in the
# practice of commenting your code thoroughly so that someone else will know
# what it is doing and so you will know in a couple months when you go back and
# look at it (you think you'll remember but you won't).

# To output to the command window, you use 'print' like so:
print "Hello World"
print 'It is a beautiful day'
# Where a string is enclosed in either single or doule quotes

# Note: when using the shell / console instead of a script, no need to use
# print at all

# Simple math is pretty straight forward:
print 2 + 2       # prints 4
print (50-5*6)/4  # prints 5
print 3**3        # prints 27 (3^3)
print 7 / 2       # prints 3 (because they are integers* [in Spyder you may get 3.5])
print 7 % 2       # prints 1 (the remainder after dividing 7 by 2)
print 7.0 / 2     # prints 3.5 (because there is a decimal number)
print abs(-5)     # prints 5
print round(5.53) # prints 6
print round(5.53, 1) # prints 5.5

# You can create variables to hold values:
x = 2 + 2   # assigns 4 to the variable x
y = x * 3   # assigns 12 to the variable y
print y / 2 # prints 6

# At any time if you want to know what a function does you can use the help
# function like so:

help(round)


############################# Strings #########################################
# You can concatenate strings to each other:
longer_str = "How " + "are you?" # How are you?

# You can easily convert numbers to a str:
num_str = str(2+2)  # the string "4"

# You can even concatenate numbers to a string by first converting:
print "2 + 2 equals: "+str(2+2) # prints "2+2 equals: 4"

# There are an incredible number of built-in functions for working with strings
# See http://docs.python.org/library/stdtypes.html#string-methods for more info

# Strings also provide a very rich formatting syntax, however it is a bit much
# for this guide. For more information see:
# http://docs.python.org/library/string.html#format-specification-mini-language


############################# Lists ###########################################
# Lists are many variables rolled into one that have a specific order. Lists in
# Python are quite powerful and versatile.

num_list = [5, 0, 2, 6] # a list of a few numbers
str_list = ['Hello','World',    # a list of strings, can be across many lines
            'How','Are','You?'] # however the other lines must be indented

print len(num_list)     # prints 4, the number of items in the list
print min(num_list)     # prints 0, the minimum in the list
print max(str_list)     # prints You?, the maximum of the list
# Strings also support len, min, max

# Lists support + and * for concatenation and repetition
x = num_list+str_list   # x is [5,0,2,6,'Hello','World','How','Are','You?']
x = num_list*2          # x is [5, 0, 2, 6, 5, 0, 2, 6]

# Python lists are zero-based (unlike Matlab which is one-based). This means
# that the first item in a list has the index 0. You can retrieve and modify
# items by index:
x = num_list[1]         # x is 0, the second element of num_list
num_list[2] = 99        # num_list is now [5, 0, 99, 6]

# To add and remove elements from a list use append and del:
num_list.append(200)    # num_list is now [5, 0 99, 6, 200]
del num_list[1]         # num_list is now [5, 99, 6, 200]

# Python lists support 'slices' which are portions of a list
print num_list[1:3]     # prints [99, 6]
# Note: the range includes the first number and goes up to the second number
# but does not include it

# Each side of the slice is optional and if not included means go to the end:
print num_list[1:]      # prints [99,6,200] (from the second element to the end)
print num_list[:3]      # prints [5,99,6] (from the start to the third element)
print num_list[:]       # prints [5,99,6,200] (the entire list)

# Negative slice values mean from the end
print num_list[:-1]     # prints [5,99,6] (from the start to the second to last element)
print num_list[1:-1]    # prints [99,6] (from the second to the second to last element)
print num_list[-1:]     # prints [200] (from the second to last element to the end)

# And even more advanced with a third value for an increment:
print num_list[::2] # prints [5, 6] (every other element)

# Slices can be be replaced and deleted:
str_list[1:2] = num_list  # str_list is now ['Hello',5,99,6,200,'How','Are','You?']
del str_list[1:5]         # str_list is now ['Hello','How','Are','You?']

# Lists support many useful functions including:
#   sort() and reverse()
# See http://docs.python.org/library/stdtypes.html#mutable-sequence-types

# Another powerful feature of Python lists is list comprehensions, but they are
# a bit complicated. If you want to learn more, see:
# http://docs.python.org/tutorial/datastructures.html#list-comprehensions


############################# Tuples ##########################################
# Tuples are similar to lists but a little less powerful. Instead of using []
# tuples use (). Tuples are fixed in length and cannot be changed. They are
# most useful for things like coordinates (e.g (x, y)), having functions return
# more than one value, and read-only lists. Here are some examples:

coord = (4, 5)  # packs a tuple
coord = 4, 5    # same as above
x, y = coord    # unpacks a tuple
x = coord[0]    # they support many of the list features
coords = [ (1, 2), (3, 4), (4, 5) ] # a list of tuples
x,y = coords[2] # x is 4, y is 5

# Lists and tuples can be coverted to each other: tuple(aList) and list(aTuple)


############################# Booleans ########################################
# Booleans are values that are either True or False. They are typically used in
# conditional tests (which we will get to in the very soon section). When using
# a value as a boolean, any of the following are considered False:
#   None, False, 0, and empty strings, lists, and tuples : "" [] ()
# Everything else is True

# Boolean operations:
t = True
f = not t    # False (not switches True to False and False to True)
b = t and t  # True  (and is True only if both are True)
b = t and f  # False (this and is False if either is False)
b = f and f  # False
b = t or t   # True  (or is True if either is True)
b = t or f   # True
b = f or f   # False

# You can also make booleans by comparisons:
x = 5
b = x > 4  # True (greater than)
b = x >= 4 # True (greater than or equal to)
b = x < 4  # False (less than)
b = x <= 4 # False (less than or equal to)
b = x == 4 # False (equals)
b = x != 4 # True (not equals), can also be written 5 <> 4
b = 4 < x < 6  # True, same as 4 < x and x < 6
b = 4 < x == 6 # False, same as 4 < x and x == 6

# Comparisons work for strings as well:
b = "aardvark" < "zebra" # True
b = "aardvark" < "Zebra" # False (capitals come before lowercase letters)
b = "Yes" == 'Yes' # True

# There are special comparisons for lists (also work for strings and tuples):
l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b = x in l     # True  (the list contains 5)
b = x not in l # False


############################# Making a Script #################################
# So far you have been running everything in a shell which allows you to run
# things very easily but gets annoying for anything more than simple commands.
# Lets make a script so that we can easily do more complicated things and save
# our work.

# In IDLE, choose "File > New Window". A new empty window will open up. You can
# type any Python commands and then run the script by "Run > Run Module (F5)".
# When saving the file make sure you have the ".py" extension on the file or
# IDLE will not color the code properly.


############################# If Statements ###################################
# So now we get into the interesting stuff. If statements let you run a chunk
# of run code if and only if something is True. Let's see an example:

x = 5

if x > 0:
    print "x is positive"

# This will only print "x is positive" if x is positive. Your value of x could
# come from many places, maybe a file, maybe from the user, maybe from some
# really complicated calculations.

# You can also execute code in the case the if statement was False:
if x > 0:
    print "x is positive"
else:
    print "x is not positive"

# And you can also chain multiple if statements together:
if x > 0:
    print "x is positive"
elif x < 0: # elif stands for "else if"
    print "x is negative"
else: # at this point x cannot be positive or negative
    print "x is 0"

# Indentation is very important in Python
# Here is an example to help explain indentation importance:
if x > 0:
    print "x is positive"
elif x < 0:
    # this group has two lines, both have the same indentation
    x = -x
    print "x was negative, now positive"
    # this group is done so the next line is un-indented
else:
    print "x is 0"

# And another example:
if x > 0:
    print "x is positive"
    if x > 20:
        # if statements can be inside if statements, you just need to indent again
        print "x is above 20"
    else: # this else is paired with "if (x > 20):" b/c of its indentation
        print "x is at most 20"
    print "wasn't that interesting?"
else: # this else is paired with "if (x > 0):" b/c of its indentation
    print "x is not positive"


############################# While Loops #####################################
# So now that we have conditional statements down, lets add on loops. The
# simplest loop is a while loop. An example is:

a, b = 0, 1
while b < 20:
    print b
    a, b = b, a+b

# Put that loop into a script and run it. Do you recongnize the pattern of
# numbers? The while loop will repeatedly run the code inside it until it's
# conditional statement is False. So you can compute more of this series by
# change "b < 20" to "b < 2000".

# If you wanted all the numbers to print on a single line you could do the
# following instead:

a, b = 0, 1
while b < 20:
    print b,  # the trailing , prevents the newline
    a, b = b, a+b
print # make a new line after printing the series


############################# For Loops #######################################
# The truth is that you probably won't use while loops too much because their
# big brother the "for loop" is much more convient.

a = ['cat', 'window', 'defenestrate']
for x in a: # For loops can take any 'iterable' object
    print x, len(x)

for letter in a[0]:
    print letter

# If you need to cover a range of values, then you use the conveniently named
# 'range' function:

for i in range(len(a)): # Goes from i = 0 to len(a)-1 (so 0, 1, 2 in this case)
    print i, a[i]

# A range creates a list of numbers based on what you give it. Range doesn't
# just go from 0 up by 1 at a time, it can create fancy lists as well:

print range(5)              # [0, 1, 2, 3, 4]
print range(5, 10)          # [5, 6, 7, 8, 9]
print range(0, 10, 3)       # [0, 3, 6, 9]
print range(-10, -100, -30) # [-10, -40, -70]

# Basically range(start, end, step) with start and increment as optional


############################# Functions #######################################
# If you find yourself writing the same lines of code over and over, or if you
# just need to organize your code (always a good thing), you can create
# functions. Functions are mini-programs that take a set of inputs and
# give an optional set of outputs. Here is a basic example:

def minimum(a, b): # takes two inputs, 'a' and 'b'
    if (a < b):
        return a # the return function gives the outputs, in this case just 1
    else:
        return b

# The above function finds the minimum of two values. You can use it like so:
min_value = minimum(5, 10) # min_value is now 5

# Since the return function immediately stops the function, the above function
# could be simplified to:

def minimum(a, b):
    if (a < b):
      return a
    return b

# You can also return more than one value. The function below returns both
# the minumum and maximum value.
def min_max(a, b):
    if (a < b):
        return a, b
    return b, a

min_value, max_value = min_max(10, 5)


############################# Exercise ########################################
# To see that you understand the basics, write a function that computes the
# Fibonacci series up to a given value. It should store every value in a list
# and return that list.

# To make sure it works, print out that list by doing something like:
#print fib(20)   # should print [1, 1, 2, 3, 5, 8, 13]
#print fib(2000) # should print [1, 1, 2, 3, 5, 8, 13, ... 610, 987, 1597]

# Tip: the example while loops printed the Fibonacci series, so you have
# the algorithm.


############################# Dictionaries ####################################
# We previously learned about lists and tuples. There is one more very powerful
# built-in data structure called a dictionary (or dict). It associates a set of
# keys with values. You use the { } to define it. For example:

charges = { "K" : 1, "Na" : 1, "H" : 1, "Ca" : 2, "Mg" : 2, "Cl" : -1 }

print charges["Ca"]  # prints 2
print "K" in charges # prints True
for ion in charges: # iterate over keys
    print ion + " has a charge of " + str(charges[ion])

# The keys do not have to be strings but can also be tuples and numbers:

xy = { (1,1) : -5, (2,4) : 45, (-4,6) : 0 }

# The values can be anything (numbers, strings, lists, ...)


############################# Errors ##########################################
# It is invetible that you will run into errors in your code so you need to
# understand the common errors, what they mean, and how to work on fixing them.

# Probably the most common error is a "SyntaxError". This basically means that
# you tried to run a program that doesn't follow the rules of the Python
# language. For example, if you type in the shell "x = [5, 6, 7)" you will get
# a syntax error (the list must end with ]). Depending on your version of IDLE
# it will either highlight the error or print a message in the shell like:

"""
 File "<pyshell#1>", line 1, in <module>
   x = [5, 6, 7)
               ^
"""

# The little ^ indicates where the problem is.

# Sometimes a syntax error on a previous line causes Python to complain on a
# future so make sure to check the line before if you can't find a problem
# with the given line.

# A special type of the SyntaxError is the IndentationError meaning Python
# expected an indentation and you didn't indent.

# Other errors give a traceback where it tells you all the functions being
# called with the second to last being the line that caused the error at the
# and the last line being a description of the problem.

# For example, create the following function, and then call it like divZero(8)

def divZero(x):
    return x / 0;

# You should see an error like:
"""
Traceback (most recent call last):
 File "<pyshell#2>", line 1, in <module>
   divZero(6)
 File "D:\Desktop\complab\week0\PythonTutorial.py", line 383, in divZero
   return x / 0;
ZeroDivisionError: integer division or modulo by zero
"""
# It tells you that you divided by zero, which is not allowed.

# Other common errors:

"""NameError: name 'spam' is not defined"""
# You tried to use a variable named "spam" but it does not exist yet.

"""IndexError: list index out of range"""
# You tried to access an element in a list or array that is <0 or >=len(list)
# For example
#x = [1, 2, 3]
#print x[5]   # generates error
#print x[-1]  # generates error

"""TypeError: cannot concatenate 'str' and 'int' objects"""
# You tried to "add" a string and a number like so: "hello" + 5
# To do this properly you must do: "hello" + str(5)

"""TypeError: divZero() takes exactly 1 argument (0 given)"""
# You called a function with the wrong number of inputs. This is the error you
# would get if you called divZero with no inputs.

"""ImportError: No module named foo"""
# You tried to import the module named foo but it doesn't exist. Either you
# typed the name wrong or you haven't properly installed the module.

"""IOError: [Errno 2] No such file or directory: 'x.txt'"""
# All IOErrors deal with problems with files. In this case we tried to open the
# file 'x.txt' which doesn't exist.

"""AttributeError: 'list' object has no attribute 'bar'"""
# You tried to access an attribute or function that doesn't exist. The above
# example is what you would get if you did:
#x = [1, 2, 3]
#x.foo()
# Since lists have no foo function, this causes an error.

"""ValueError: list.remove(x): x not in list"""
# A ValueError means that a function received an unexpected value. The above
# example is generated when you do:
#x = [1, 2, 3]
#x.remove(6)
# Since there is no "6" in the list it causes an error.

# There are many other errors, but these are the most common ones. Hopefully
# you won't see them too often, and never see the less common ones.


############################# Advanced ########################################
# There are tons of other advanced things Python offers. Ask us and we may be
# able to help you use them. Here is a brief list of things you may use:
#   * classes / namespaces
#   * complex numbers
#   * lambda functions
#   * sets, queues, and stacks
#   * list comprehensions


###############################################################################
############################# SciPy ###########################################
###############################################################################
# SciPy provides advanced math and scientific functions for Python. It provides
# nearly all of the functionality of Matlab for Python.

# The SciPy module (aka library) needs to be imported to use it. The next line
# imports the SciPy library.
import scipy

# From now on you can use all of the SciPy functions by doing scipy.function()
# You can get help for these functions by doing help(scipy.function), e.g.
help(scipy.fft)

# If you use one function a lot then you may want to make an 'alias' for it:
from scipy import fft
# Now the function 'scipy.fft' can be used just as 'fft'.

# You can also import a module and give it a new name, for example:
import scipy as sp
# Now you can use sp anywhere you would have used scipy.
# If you use 'import scipy as sp' there is no need to use 'import scipy'


############################# Arrays ##########################################
# So you know how we learned about lists? Well it turns out that for the most
# part you want to use a SciPy array and not a list. They are much faster and
# when used with SciPy the benefits are amazing. The good news is that they
# act almost the same as the normal Python lists.

# Some simple 1-dimension array examples
a1 = sp.array([1, 2, 3, 4])
a2 = sp.array([4, 3, 2, 1])
a3 = a1 + a2  # add array element-wise (normal Python lists would concatenate)
print a3      # prints [5, 5, 5, 5]
print a1[0]   # prints [1]
print a2[1:3] # prints [3, 2] (all the other slice operations work as well)
a4 = a1 * a2  # multiply arrays element-wise
a5 = sp.sin(a1); # takes sin of all elements
a6 = sp.log(a2); # takes natrual log of all elements
a7 = sp.exp(a6); # computes e^(x) for each x in the array
a8 = 10**a1;  # computes 10^(x) for each x in the array
py_list = a4.tolist() # converts to a Python list

# There are many more available functions, commonly used ones are:
#   sum, mean, std, cumsum, append, concatenate, amin, amax, argmin, argmax,
#   histogram, round, sign, unique
# For a complete list with examples see (just pretend "numpy" is "scipy"):
#   http://www.scipy.org/Numpy_Example_List_With_Doc

# More ways to make a 1-D array
r = sp.arange(0, 50, 1) # like Python range but with real-valued SciPy arrays
l = sp.linspace(0, 50, 10000) # 10000 element array from 0 to 50 (inclusive)
z = sp.zeros(50)        # an array of 50 zeros
o = sp.ones(50)         # an array of 50 ones
p = sp.pi*sp.ones(50)   # an array of 50 pis


############################# Matrices ########################################
# SciPy arrays also work as matrices:
m1 = sp.array([[1, 2, 3, 4],  # 3 rows and 4 columns
               [4, 3, 2, 1],
                a3 ])
m2 = sp.zeros((4, 5))         # 4 rows and 5 columns of zeros

# Get the shape:
print m2.shape # prints (4, 5)
nrows, ncols = m2.shape
print nrows # prints 4, the number of rows

# To access elements in a matrix:
m2[3,0] = 5   # Changes fourth row and first column to 5, same as m2[3][0]
print m1[1,:] # Prints the entire second row (same as m2[1])
print m1[:,2] # Prints the entire third column
# The other slice operations work as well:
print m1[1:3,1:3] # Prints: [[3 2]  # second row, second and third columns
                  #          [5 5]] # third row, second and third columns



# Matrices support +, *, **, sin, log, ... the same way that arrays do

t = sp.transpose(m2) # switch rows and columns in the array / matrix
t = m2.T # same as above

# Some common matrix functions to look into:
#   reshape and histogram2d

# Note: SciPy actually has something called "matrix" as well, which acts like
# MATLAB matrices where * is the matrix multiplication.


############################# Finding #########################################
# SciPy arrays and matrices can easily be searched. You can use the comparison
# operators we learned before to get an array / matrix of True / False values
# for each element like so:

a = sp.array([-1, 0, 5, -5, 7])
b = sp.array([-2, 4, -1, 0, 8])
print a > 0 # prints [False False True False True]
print b > a # prints [False True False True True]

# To check if any/all are True:
print "Are any negative? "+str(sp.any(a < 0))
print "Are all negative? "+str(sp.all(a < 0))

# If you need the indices, you can use the nonzero function (since False is
# equal to 0, it skips all Falses):
print sp.nonzero(a >= 0)     # prints [1,2,4]

# To get the values you can use the nonzero result as an index:
print a[sp.nonzero(a >= 0)]  # prints [0,5,7]

# These can be used to quickly find spike times (assuming low noise):
# time = some array...
# voltage = some array...
# spikes = time[sp.find(sp.logical_and(voltage[:-1] < 0, voltage[1:] >= 0))]


############################# Files ###########################################
# SciPy arrays and matrices can easily be read from and saved to files.

# Save array / matrix:
sp.save('test.npy', m2)      # binary format (smallest)
sp.savetxt('test.txt', m2)   # text format (easiest to read as text)
sp.savetxt('test.csv', m2, delimiter=',') # csv format (easily usable by Excel)

# Load array / matrix
m3 = sp.load('test.npy')
m3 = sp.genfromtxt('test.txt')
m3 = sp.genfromtxt('test.csv', delimiter=',')

# There is also a npz format that you get with savez that can store multiple
# arrays / matrices and is compressed. Can also load MAT files from MATLAB.


############################# Plotting ########################################
# SciPy includes an entire plotting library called pylab (matplotlib).

import pylab as plt # Import the pylab module and call it plt

x = sp.linspace(-2*sp.pi, 2*sp.pi, 5000) # create a list of numbers
y = sp.sin(x)           # calculate the sin for each point
plt.figure()            # creates a new figure to plot in
plt.plot(x, y)          # plot x vs y
plt.title("sin curve")  # add a title
plt.xlabel("X values")  # add an x label
plt.ylabel("Y values")  # add a y label
plt.show()              # actually shows the graph

# There are an incredible number of options for plotting your data just the way
# you want, and you can have multiple plots at the same time
y2 = sp.cos(x)          # calculate the cos for each point
plt.figure()
plt.plot(x, y, color='red', linestyle='-.', label='sin(x)')
plt.plot(x, y2, color='green', linestyle='--', label='cos(x)')
# Note: instead of doing "color='red', linestyle='-.'" you can just do 'r-.'
# and instead of doing "color='green', linestyle='--'" you can just do 'g--'
plt.title("sine and cosine curves")
plt.xlabel("X values")
plt.ylabel("Y values")
plt.legend(loc='upper right') # uses the 'label' for each
plt.show()

# For a complete list of options see
# http://matplotlib.sourceforge.net/api/pyplot_api.html#matplotlib.pyplot.plot

# You can also do 2D plots:
# Make some interesting data
import matplotlib.mlab as mlab;
delta = 0.025
x = sp.arange(-3.0, 3.0, delta)
y = sp.arange(-2.0, 2.0, delta)
X, Y = sp.meshgrid(x, y)
Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 0.0, 0.0)
Z2 = mlab.bivariate_normal(X, Y, 1.5, 0.5, 1, 1)
Z = 10.0 * (Z2 - Z1)

# Contour plot
plt.figure()
plt.subplot(2, 1, 1) # num rows & cols, then the current subplot number
plt.contour(X, Y, Z)
plt.colorbar() # adds a color bar to the image
plt.title('Contour Plot')

# Image plot
def extent(X, Y): # Calculates the extent of X and Y values
    return sp.amin(X), sp.amax(X), sp.amin(Y), sp.amax(Y)
plt.subplot(2, 1, 2) # same num rows & cols above, then the next subplot number
plt.imshow(Z, extent=extent(X,Y), aspect='auto', origin='lower')
plt.colorbar()
plt.title('Image Plot')
plt.show()

# Other plot types that may be useful:
# line plot:    errorbar, fill, fill_betweenx
# box plots:    bar, barh, hist, boxplot
# vector field: quiver, barbs
# 2D plots:     contourf
# spectral:     specgram, psd, csd
# other:        polar, scatter, acorr, xcorr

# Other functions to perfect the figure:
# annotate, subtitle, clim (color scale limits)
# axis, twinx/twiny (create second axis), xscale/yscale (set log scale)

# See: http://matplotlib.sourceforge.net/


############################# 3D Plotting #####################################
# pylab has 3D plotting built-in, but it takes just a little work to use it

# First you need to import the 3D library:

import mpl_toolkits.mplot3d

# Then you have to set the axes to 3D projections.
# If not using subplots create the figure like this:
#   plt.figure().gca(projection='3d')
# Otherwise create the subplot like this:
#   plt.gcf().add_subplot(1, 2, 1, projection='3d')

# Generate some interesting data
n_mer, n_long = 6, 11
phi = sp.arange(0.0, 2*sp.pi + 0.0005*sp.pi, sp.pi/1000.0)
mu = phi*n_mer
x = sp.cos(mu)*(1+sp.cos(n_long*mu/n_mer)*0.5)
y = sp.sin(mu)*(1+sp.cos(n_long*mu/n_mer)*0.5)
z = sp.sin(n_long*mu/n_mer)*0.5

# Plot the 3D Data
plt.figure().gca(projection='3d')
plt.plot(x, y, z)
plt.show()

# There are a ton more plotting types and options that you can use is. See:
# http://matplotlib.sourceforge.net/mpl_toolkits/mplot3d/tutorial.html


############################# Solving Diff Eqs ################################
# SciPy has an ordinary differential equation solver that we will use for many
# problems in this class. Copy everything from here to the end into a new
# script so that you can play with just this code.

import scipy as sp
import pylab as plt
from scipy.integrate import odeint # alias the ODE integration function

# We will integrate this system of differential equations:
# du/dt = v
# dv/dt = -u
def step(n, t):
    # Calculate a single step of the integration
    # n are the variables
    # t is the current time
    
    u, v = n # n must be 'unpacked'
    
    # Compute the integration step
    dudt = v
    dvdt = -u
    
    return dudt, dvdt # return these values

# Time runs from 0 to 10 in 0.1 increments
t = sp.arange(0.0, 10, 0.1)

# Using the function named 'step' and starting from the initial conditions
# u=0.0 and v=1.0 integrate over time
n = odeint(step, [0.0, 1.0], t)

u = n[:, 0] # Column zero is u values for all times in t
v = n[:, 1] # Column one is v values for all times in t

# Plot the u values as a function of time
plt.figure()
plt.title("du/dt = v, dv/dt = -u")
plt.plot(t, u, label="u")
plt.legend(loc="upper right")
plt.show()


############################# Exercises #######################################
# Run this program, look at the graph, and understand what is going on.
# Then change the function to compute the following system of equations:
# du/dt = v-0.1u
# dv/dt = -u-0.1v
# Also, plot both u and v over time in the same graph instead of just u.

# Now that you have the hang of solving differential equations, recreate the
# Lorenz Attractor (look it up on Wikipedia). Plot the result using a 3D plot.