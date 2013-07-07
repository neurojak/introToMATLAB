%% MATLAB tutorial for UCSD Neurosciences
% MatlabTutorial_Day1_v100
% Kyle Fischer & Jason Keller, heavily based on previous MATLAB and Python tutorials by Jeff Bush and Doug Rubino
% version 1.00, summer 2013
% This scripts is a brief introduction to programming in MATLAB, Day 1 of a 2-day course.  Even if 
% you are already familiar with programming, we recommend that you step through this to make sure 
% that everyone is on the same page. The tutorial is meant to be stepped through in Debug mode,
% by placing a break point on the first executable line (in the editor, click on the blank space
% just to the right of the line # and a red dot should appear). Then press F5 to run, and F10 to 
% advance to the next line of code.  It can be helpful to view the command window at the same time
% as you advance through the code.

% Other learning resources:
% http://www.mathworks.com/academia/student_center/tutorials/launchpad.html

%% COMMENTS and BOOKMARKS
% First, any text after a '%' symbol is a comment and is ignored by MATLAB.
% For example, all of these lines so far are ignored. You should be in the
% practice of commenting your code thoroughly so that someone else will know
% what it is doing and so you will know in a couple months when you go back and
% look at it (you think you'll remember but you won't).

% A line that starts with '%%' creates a block for 'folding' and organizing

%{
   For a large block comment, use '%{'
   That was easy. Or maybe even easier, highlight a large portion of text and press <Ctrl-'r'> to 
   comment, <Ctrl-'t'> to uncomment 
%}

% To set a 'bookmark' in the code, press <Ctrl-'F2'> when the cursor is on that line to toggle the 
% bookmark on/off (a cyan square should appear).  Then just press <F2> to hop between bookmarks.

%% BASICS
% To output to the command window, you use 'disp' or 'display', where a string is enclosed in 
% single quotes like so:
disp('Cajal = God')

% Next copy and paste to above line straight onto the command line and press <Enter>. You can run
% any command at any time while you are debugging.  Next, with the cursor still on the command line,
% press the <up> key to scroll through your list of previous commands.  You can also type partial
% commands and then MATLAB will match every previous command that completes your command when you
% press the <up> key.

% Simple math is pretty straight forward; notice how the semicolon suppresses output to the 
% monitor.  If the semicolon is missing, MATLAB will warn you by default (see the thin orange line 
% to the left of the scroll bar? It would be red if you made a syntax error...) 
2 + 2            % displays 4 (answer is automatically saved into a variable called 'ans')
disp(2 + 2)      % displays 4
3^3              % displays 27 (3^3)
3^3;             % displays nothing b/c of semicolon
7/2              % displays 3.5000 (the default data type in MATLAB is 64-bit double-precision)
int8(7/2)        % displays 4 (because we have forced the output to an 8-bit integer)
rem(7,2)         % displays 1 (the remainder after dividing 7 by 2)
mod(7,2)         % displays 1 (the modulo/remainder after dividing 7 by 2)
abs(-5)          % displays 5
round(5.53)      % displays 6
floor(5.53)      % displays 5

% You can create variables to hold values:
x = 2 + 2   % assigns 4 to the variable x
y = x * 3   % assigns 12 to the variable y
y / 2       % disps 6

%Everything in MATLAB is case-sensitive:
% disp(Y)

% One of MATLAB's greatest strengths as a programming language is its documentation.
% At any time if you want to know what a function does you can use the help function like so:
help floor
help elfun
% Also, don't be afraid to open the help browser and search for commands.  Often there will be links
% to other useful functions at the bottom of the help file in the 'See Also' section.

%% ERRORS
% explain that the whole function stack is shown, with links
% another big plus of MATLAB

% % It is invetible that you will run into errors in your code so you need to
% % understand the common errors, what they mean, and how to work on fixing them.
% 
% % Probably the most common error is a "SyntaxError". This basically means that
% % you tried to run a program that doesn't follow the rules of the Python
% % language. For example, if you type in the shell "x = [5, 6, 7)" you will get
% % a syntax error (the list must end with ]). Depending on your version of IDLE
% % it will either sa highlight the error or print an message in the shell like:
% 
% """
%  File "<pyshell%1>", line 1, in <module>
%    x = [5, 6, 7)
%                ^
% """
% 
% % The little ^ indicates where the problem is.
% 
% % Other errors give a traceback where it tells you all the functions being
% % called with the second to last being the line that caused the error at the
% % and the last line being a description of the problem.
% 
% % For example, create the following function, and then call it like divZero(8)
% 
% def divZero(x):
%   return x / 0;
% 
% % You should see an error like:
% """
% Traceback (most recent call last):
%  File "<pyshell%2>", line 1, in <module>
%    divZero(6)
%  File "D:\Desktop\complab\week0\PythonTutorial.py", line 383, in divZero
%    return x / 0;
% ZeroDivisionError: integer division or modulo by zero
% """
% % It tells you that you divided by zero, which is not allowed.
% 
% % Other common errors:
% 
% """NameError: name 'spam' is not defined"""
% % You tried to use a variable named "spam" but it does not exists yet.
% 
% """IndexError: list index out of range"""
% % You tried to access an element in a list or array that is <0 or >=len(list)
% % For example
% %x = [1, 2, 3]
% %print x[5]   % generates error
% %print x[-1]  % generates error
% 
% """TypeError: cannot concatenate 'str' and 'int' objects"""
% % You tried to "add" a string and a number like so: "hello" + 5
% % To do this properly you must do: "hello" + str(5)
% 
% """TypeError: divZero() takes exactly 1 argument (0 given)"""
% % You called a function with the wrong number of inputs. This is the error you
% % would get if you called divZero with no inputs.
% 
% """ImportError: No module named foo"""
% % You tried to import the module named foo but it doesn't exist. Either you
% % typed the name wrong or you haven't properly installed the module.
% 
% """IOError: [Errno 2] No such file or directory: 'x.txt'"""
% % All IOErrors deal with problems with files. In this case we tried to open the
% % file 'x.txt' which doesn't exist.
% 
% """AttributeError: 'list' object has no attribute 'bar'"""
% % You tried to access an attribute or function that doesn't exist. The above
% % example is what you would get if you did:
% %x = [1, 2, 3]
% %x.foo()
% % Since lists have no foo function, this causes an error.
% 
% """ValueError: list.remove(x): x not in list"""
% % A ValueError means that a function recieved an unexpected value. The above
% % example is generated when you do:
% %x = [1, 2, 3]
% %x.remove(6)
% % Since there is no "6" in the list it causes an error.
% 
% % There are many other errors, but these are the most common ones. Hopefully
% % you won't see them too often, and never see the less common ones.
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Advanced %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % There are tons of other advanced things Python offers. Ask us and we may be
% % able to help you use them. Here is a brief list of things you may use:
% %   * classes / namespaces
% %   * complex numbers
% %   * lambda fucntions
% %   * sets, queues, and stacks
% %   * list comprehensions
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% SciPy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % SciPy provides advanced math and scientific functions for Python. It provides
% % nearly all of the functionality of Matlab for Python.
% 
% % The SciPy module (aka library) needs to be imported to use it. The next line
% % imports the SciPy library.
% import scipy
% 
% % From now on you can use all of the SciPy functions by doing scipy.function()
% % You can get help for these functions by doing help(scipy.function), e.g.
% help(scipy.sin)
% 
% % If you use one function a lot then you may want to make an 'alias' for it:
% from scipy import sin
% % Now the function 'scipy.sin' can be used just as 'sin'.
% 
% % You can also import a module and give it a new name, for example:
% import scipy as sp
% % Now you can use sp anywhere you would have used scipy.
% % If you use 'import scipy as sp' there is no need to use 'import scipy'

%% STRINGS
% You can concatenate strings to each other:
longer_str = ['How ','are you?'] % How are you?

% You can easily convert numbers to a str:
num_str = num2str(2+2)  % the string "4"

% You can even concatenate numbers to a string by first converting:
disp(['2 + 2 equals ', num2str(2+2)]) % prints '2+2 equals: 4'
% search 'string' in help browser

%% BOOLEANS
a=5

% Booleans are values that are either True or False. They are typically used in 
% conditional tests (which we will get to in the very soon section). When using
% a value as a boolean, any of the following are considered False:
% None, False, 0, and empty strings, lists, and tuples : "" [] ()
% Everything else is True

% Boolean operations:
t = true;
f = not(t)    % False (not switches True to False and False to True)
b = t&t  % True  (and is True only if both are True)
b = t&f  % False (this and is False if either is False)
b = f&f  % False
b = t|t   % True  (or is True if either is True)
b = t|f   % True
b = f|f   % False

% You can also make booleans by comparisons:
x = 5
b = x > 4  % true (greater than)
b = x >= 4 % true (greater than or equal to)
b = x < 4  % false (less than)
b = x <= 4 % false (less than or equal to)
b = x == 4 % false (equals)
b = x ~= 4 % true (not equals), can also be written 5 <> 4
b = 4 < x < 6  % true, same as 4 < x and x < 6
b = 4 < x == 6 % false, same as 4 < x and x == 6

% Comparisons work for strings as well:
% b = 'aardvark' < 'zebra' % true
% b = 'aardvark' < 'Zebra' % false (capitals come before lowercase letters)
% b = 'Yes' == 'Yes' % true

% There are special comparisons for lists (also work for strings and tuples):
L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
% b = x in l     % true  (the list contains 5)
% b = x not in l % false

%% ARRAYS
% % So you know how we learned about lists? Well it turns out that for the most
% % part you want to use a SciPy array and not a list. They are much faster and
% % when used with SciPy the benefits are amazing. The good news is that they
% % act almost the same as the normal Python lists.
% 
% % Some simple 1-dimension array examples
% a1 = sp.array([1, 2, 3, 4])
% a2 = sp.array([4, 3, 2, 1])
% a3 = a1 + a2  % add array element-wise (normal Python lists would concatenate)
% print a3      % prints [5, 5, 5, 5]
% print a1[0]   % prints [1]
% print a2[1:3] % prints [3, 2] (all the other slice operations work as well)
% a4 = a1 * a2  % multiply arrays element-wise
% a5 = sp.sin(a1); % takes sin of all elements
% a6 = sp.log(a2); % takes natrual log of all elements
% a7 = sp.exp(a6); % computes e^(x) for each x in the array
% a8 = 10**a1;  % computes 10^(x) for each x in the array
% py_list = a4.tolist() % converts to a Python list
% 
% % There are many more available functions, commonly used ones are:
% %   sum, mean, std, cumsum, append, concatenate, amin, amax, argmin, argmax,
% %   histogram, round, sign, unique
% % For a complete list with examples see (just pretend "numpy" is "scipy"):
% %   http://www.scipy.org/Numpy_Example_List_With_Doc
% 
% % More ways to make a 1-D array
% r = sp.arange(0, 50, 1) % like Python range but with real-valued SciPy arrays
% l = sp.linspace(0, 50, 10000) % 10000 element array from 0 to 50 (inclusive)
% z = sp.zeros(50)        % an array of 50 zeros
% o = sp.ones(50)         % an array of 50 ones
% p = sp.pi*sp.ones(50)   % an array of 50 pis

%% MATRICES
% % SciPy also supports matrices in a very similar way to arrays:
% m1 = sp.matrix([[1, 2, 3, 4],  % 3 rows and 4 columns
%                 [4, 3, 2, 1],
%                 a3 ])
% m2 = sp.zeros((4, 5))          % 4 rows and 5 columns of zeros
% 
% % To access elements in a matrix:
% m2[3,0] = 5   % Changes fourth row and first column to 5, same as m2[3][0]
% print m1[1,:] % Prints the entire second row (same as m2[1])
% print m1[:,2] % Prints the entire third column
% % The other slice operations work as well:
% print m1[1:3,1:3] % Prints: [[3 2]  % second row, second and third columns
%                   %          [5 5]] % third row, second and third columns
% 
% % Matrices support +, *, **, sin, log, ... the same way that arrays do
% 
% t = sp.transpose(m2) % switch rows and columns in the array / matrix
% t = m2.T % same as above
% 
% % Some common matrix functions to look into:
% %   reshape, histogram2d, histogramdd



% in the workspace, show how to use the variable viewer while debugging (this can be useful for 
% cell array indexing)

help elmat

%% FINDING and INDEXING
% % SciPy arrays and matrices can easily be searched. You can use the comparison
% % operators we learned before to get an array / matrix of True / False values
% % for each element like so:
% 
% a = sp.array([-1, 0, 5, -5, 7])
% print a > 0
% 
% % To check if any are True:
% print "Are any negative? "+str(sp.any(a < 0))
% 
% % If you need the indices, you can use the nonzero function (since False is
% % equal to 0, it skips all Falses):
% print sp.nonzero(a >= 0)     % prints [1,2,4]
% 
% % To get the values you can use the nonzero result as an index:
% print a[sp.nonzero(a >= 0)]  % prints [0,5,7]
% 
% % These can be used to quickly find spike times (assuming low noise):
% % time = some array...
% % voltage = some array...
% % spikes = time[sp.nonzero(voltage[:-1] < 0) && sp.nonzero(voltage[1:] >= 0)]

%% IF STATEMENTS
% So now we get into the interesting stuff. If statements let you run a chunk
% of run code if and only if something is True. Let's see an example:
x=5;
if x > 0
    disp('x is positive')
end

% This will only print "x is positive" if x is positive. Your value of x could
% come from many places, maybe a file, maybe from the user, maybe from some
% really complicated calculations.

% You can also execute code in the case the if statement was False:
if x > 0
  disp('x is positive')
else
  disp('x is not positive')
end
% And you can also chain multiple if statements together:
if x > 0
  disp('x is positive')
elseif (x < 0)
 disp('x is negative')
else % at this point x cannot be positive or negative
  disp('x is zero')
end

% also switch statements, etc
% maybe include a note about indentation in other languages such as Python

%% WHILE LOOPS
% So now that we have conditional statements down, lets add on loops. The
% simplest loop is a while loop. An example is:

a = 0;
b = 1;
while b < 20
    disp(b)
    a = b;
    b = a + b;
end

% Put that loop into a script and run it. Do you recongnize the pattern of
% numbers? The while loop will repeatedly run the code inside it until it's
% conditional statement is False. So you can compute more of this series by
% change "b < 20" to "b < 2000".

%% FOR LOOPS
% The truth is that you probably won't use while loops too much because their
% big brother the "for loop" is much more convient.

a = {'cat', 'window', 'defenestrate'};
for x = a % For loops can take any 'iterable' object
  disp(x)
end

for letter = 'cat'
  disp(letter)
end

% If you need to cover a range of values, then you use the conviently named
% 'range' function:

% for i = range(length(a)): % Goes from i = 0 to len(a)-1 (so 0, 1, 2 in this case)
%   print i, a[i]
% end

% A range creates a list of numbers based on what you give it. Range doesn't
% just go from 0 up by 1 at a time, it can create fancy lists as well:

0:5              % [0, 1, 2, 3, 4]
5:10          % [5, 6, 7, 8, 9]
0:3:10       % [0, 3, 6, 9]
-10:-30:-100% [-10, -40, -70]

% Basically, range(start, end, increment) with start and increment as optional

%% FUNCTIONS
% If you find yourself writing the same lines of code over and over, or if you
% just need to organize your code (always a good thing), you can create
% functions. Functions are mini-programs that take a set of inputs and
% give a set of outputs. Here is a basic example:

% def minimum(a, b): % takes two inputs, 'a' and 'b'
%   if (a < b)
%     return a % the return function gives the outputs, in this case just 1
%   else
%     return b
%   end

% The above function finds the minimum of two values. You can use it like so:
% min_value = minimum(5, 10) % min_value is now 5

% Since the return function immediately stops the function, the above function
% could be simplified to:

% def minimum(a, b):
%   if (a < b):
%     return a
%   return b

% You can also return more than one value. The function below returns both
% the minumum and maximum value.
% def min_max(a, b):
%   if (a < b):
%     return a, b
%   return b, a
% 
% min_value, max_value = min_max(10, 5)
% 
% help syntax

%% FILE I/O
% % SciPy arrays and matrices can easily be read from and saved to files.
% 
% % Save array / matrix:
% sp.save('test.npy', m2)      % binary format (smallest)
% sp.savetxt('test.txt', m2)   % text format (easiest to read as text)
% sp.savetxt('test.csv', m2, delimiter=',') % csv format (easily usable by Excel)
% 
% % Load array / matrix
% m3 = sp.load('test.npy')
% m3 = sp.genfromtxt('test.txt')
% m3 = sp.genfromtxt('test.csv', delimiter=',')
% 
% % There is also a npz format that you get with savez that can store multiple
% % arrays / matrices and is compressed.

%% PLOTTING
% One of MATLAB's greatest attributes is its powerful plotting cababilities.  Let's take a look:

% % SciPy includes an entire plotting library called pylab (matplotlib).
% 
% import pylab as plt % Import the pylab module and call it plt
% 
% x = sp.linspace(-2*sp.pi, 2*sp.pi, 5000) % create a list of numbers
% y = sp.sin(x)           % calculate the sin for each point
% plt.figure()            % creates a new figure to plot in
% plt.plot(x, y)          % plot x vs y
% plt.title("sin curve")  % add a title
% plt.xlabel("X values")  % add an x label
% plt.ylabel("Y values")  % add a y label
% plt.show()              % actually shows the graph
% 
% % There are an incredible number of options for plotting your data just the way
% % you want, and you can have multiple plots at the same time
% y2 = sp.cos(x)          % calculate the cos for each point
% plt.figure()
% plt.plot(x, y, color='red', linestyle='-.', label='sin(x)')
% plt.plot(x, y2, color='green', linestyle='--', label='cos(x)')
% % Note: instead of doing "color='red', linestyle='-.'" you can just do 'r-.'
% % and instead of doing "color='green', linestyle='--'" you can just do 'g--'
% plt.title("sine and cosine curves")
% plt.xlabel("X values")
% plt.ylabel("Y values")
% plt.legend(loc='upper right') % uses the 'label' for each
% plt.show()
% 
% % For a complete list of options see
% % http://matplotlib.sourceforge.net/api/pyplot_api.html%matplotlib.pyplot.plot
% 
% % You can also do 2D plots:
% % Make some interesting data
% import matplotlib.mlab as mlab;
% delta = 0.025
% x = sp.arange(-3.0, 3.0, delta)
% y = sp.arange(-2.0, 2.0, delta)
% X, Y = sp.meshgrid(x, y)
% Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 0.0, 0.0)
% Z2 = mlab.bivariate_normal(X, Y, 1.5, 0.5, 1, 1)
% Z = 10.0 * (Z2 - Z1)
% 
% % Contour plot
% plt.figure()
% plt.subplot(2, 1, 1) % num rows & cols, then the current subplot number
% plt.contour(X, Y, Z)
% plt.colorbar() % adds a color bar to the image
% plt.title('Contour Plot')
% 
% % Image plot
% def extent(X, Y): % Calculates the extent of X and Y values
%   return sp.amin(X), sp.amax(X), sp.amin(Y), sp.amax(Y)
% plt.subplot(2, 1, 2) % same num rows & cols above, then the next subplot number
% plt.imshow(Z, extent=extent(X,Y), aspect='auto', origin='lower')
% plt.colorbar()
% plt.title('Image Plot')
% plt.show()
% 
% % Other plot types that may be useful:
% % line plot:    errorbar, fill, fill_betweenx
% % box plots:    bar, barh, hist, boxplot
% % vector field: quiver, barbs
% % 2D plots:     contourf
% % spectral:     specgram, psd, csd
% % other:        polar, scatter, acorr, xcorr
% 
% % Other functions to perfect the figure:
% % annotate, subtitle, clim (color scale limits)
% % axis, twinx/twiny (create second axis), xscale/yscale (set log scale)
% 
% % See: http://matplotlib.sourceforge.net/
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3D Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % pylab has 3D plotting built-in, but it takes just a little work to use it
% 
% % First you need to import the 3D library:
% 
% import mpl_toolkits.mplot3d
% 
% % Then you have to set the axes to 3D projections.
% % If not using subplots create the figure like this:
% %   plt.figure().gca(projection='3d')
% % Otherwise create the subplot like this:
% %   plt.gcf().add_subplot(1, 2, 1, projection='3d')
% 
% % Generate some interesting data
% n_mer, n_long = 6, 11
% phi = sp.arange(0.0, 2*sp.pi + 0.0005*sp.pi, sp.pi/1000.0)
% mu = phi*n_mer
% x = sp.cos(mu)*(1+sp.cos(n_long*mu/n_mer)*0.5)
% y = sp.sin(mu)*(1+sp.cos(n_long*mu/n_mer)*0.5)
% z = sp.sin(n_long*mu/n_mer)*0.5
% 
% % Plot the 3D Data
% plt.figure().gca(projection='3d')
% plt.plot(x, y, z)
% plt.show()
% 
% % There are a ton more plotting types and options that you can use is. See:
% % http://matplotlib.sourceforge.net/mpl_toolkits/mplot3d/tutorial.html


%% EXERCISES
% To see that you understand the basics, write a function that computes the
% Fibonacci series up to a given value. It should store every value in a list
% and return that list.

% To make sure it works, print out that list by doing something like:
%print fib(20)   % should print [1, 1, 2, 3, 5, 8, 13]
%print fib(2000) % should print [1, 1, 2, 3, 5, 8, 13, ... 610, 987, 1597]

% Tip: the example for while loops printed the Fibonacci series, so you have
% the algorithm.

%% CHALLENGE


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Solving Diff Eqs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % SciPy has an ordinary differential equation solver that we will use for many
% % problems in this class. Copy everything from here to the end into a new
% % script so that you can play with just this code.
% 
% import scipy as sp
% import pylab as plt
% from scipy.integrate import odeint % alias the ODE integration function
% 
% % We will integrate this system of differential equations:
% % du/dt = v
% % dv/dt = -u
% def step(n, t):
%   % Calculate a single step of the integration
%   % n are the variables
%   % t is the current time
%   
%   u, v = n % n must be 'unpacked'
% 
%   % Compute the integration step
%   dudt = v
%   dvdt = -u
% 
%   return dudt, dvdt % return these values
% 
% % Time runs from 0 to 10 in 0.1 increments
% t = sp.arange(0.0, 10, 0.1)
% 
% % Using the function named 'step' and starting from the initial conditions
% % u=0.0 and v=1.0 integrate over time
% n = odeint(step, [0.0, 1.0], t)
% 
% u = n[:, 0] % Column zero is u values for all times in t
% v = n[:, 1] % Column one is v values for all times in t
% 
% % Plot the u values as a function of time
% plt.figure()
% plt.title("du/dt = v, dv/dt = -u")
% plt.plot(t, u, label="u")
% plt.legend(loc="upper right")
% plt.show()
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercises %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Run this program, look at the graph, and understand what is going on.
% % Then change the function to compute the following system of equations:
% % du/dt = v-0.1u
% % dv/dt = -u-0.1v
% % Also, plot both u and v over time in the same graph instead of just u.
% 
% % Now that you have the hang of solving differential equations, recreate the
% % Lorenz Attractor (look it up on Wikipedia). Plot the result using a 3D plot.

%% OTHER FAVORITE FUNCTIONS
% this is a list of [perhaps more exotic] MATLAB functions/commands with brief explanations compiled by 
% other students:

%From JasonK
help specfun  % specialized math functions
help datafun  % data analysis and Fourier transforms
help stats    % help overview for statistics toolbox (if you have it installed)

which + %which function '+' are you using? (can be used with any function)
clc % clear command window
why(1000) % a primitive Siri
%eval % useful for automated data input
%pack % memory defrag. might help if “out of memory” errors are getting you down
%squeeze % get rid of empty dimensions
%sparse % converts a full matrix to sparse form 
% data input functions?
% dbstop if error
% break

%From KyleF
% bsxfun
% nargin
% ginput
% diary(?)
% cbrewer (not a function, but file with better colormaps)
% mod

%% USEFUL KEYBOARD SHORTCUTS
% <shift + '['> for decrease indent



% end of tutorial