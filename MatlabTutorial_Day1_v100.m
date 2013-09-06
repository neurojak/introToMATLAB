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

%% ARRAYS, MATRBWCES, and BWNDEXBWNG

% Now that you're fast on your way to being a pro in the MATrix LABratory,
% its about time we saw some matrices.

% most programming languages have ways of handling groups of data as in one
% variable, often refered to as "arrays", "lists", or even "vectors" (not
% to be confused with the physics vector). For numerical data, MATLAB deals
% in matrices. For instance:

my_first_array = [1:1:10]

% is a 1x10 matrix from 1 to 10 increasing by 1. A 1 dimensional matrix is
% often refered to as an "array" or "vector", but its no different from
% other matrices. You'll also notice that:

my_second_array = [1:10]                % is the same thing (we don't have to specify the incriment if it is 1...
my_third_array = [1:2:10]               % ...but we do for other increments...)
my_fourth_array = [1 4 5 2 8 47 1206]   % any numbers within brackets creates a matrix
my_fifth_array = [1; 4; 5; 8; 47; 1206] % notice that this matrix is the same but rotated... more on that later

% Unlike most other programming languages, MATLAB DOES NOT (!!) use a zero
% index; that is, if you want the first element in an array, you use 1:

my_first_array(1)              % the first element
my_first_array(10)             % the last element
my_first_array(end)            % also the last element (neato!)
my_first_array(end-1)          % the second to last element

% ---- !!! A BRIEF FORAY INTO IMAGE PROCESSING !!! ---- 

% MATLAB is as phenomenal at image processing as it is boring to learn
% about matrix manipulation. So before we go any further, lets play with a
% fun matrix: an image.

BW = imread('kristan_bw.pgm');       % reads in an image
imshow(BW);                          % shows our image... er, BW mean, matrix

% So you just made a 1 dimensional matrix (or "array") but instead of
% making some random 2D matrix, this image will let us better visualize
% what exactly we're doing. Each element of this matrix is 1 pixel, with a
% value from 0 (black) to 255 (white). Let's see how big our matrix is:

size(BW)         % the (surprise!) size of the matrix as (row x column)
length(BW)       % length returns the longest dimension (same as max(size))
numel(BW)        % the number of elements in BW

% If we want to index into this matrix, we treat it the same way we would
% an array, just with 2 dimensions.

BW(1,1)      % returns the value in the first the first row and first column (the upper left corner)

% We can assign values in the same manner

new_BW = BW;      % copy BW for the sake of this experiment
new_BW(1,1) = 0;  % reassign row 1 column 1 with the value 0
imshow(new_BW);   % zoom into the upper left hand corner to see the effect

% The colon (:) operate means "the entire ___" where ____ is row or column.
% Check out what happens when we do this...

close all;           % close image
new_BW = BW;         % copy BW for the sake of this experiment
new_BW(50,:) = 0;    % reassign all of row 50 with the value 0
imshow(new_BW);      % let's see what happened...
new_BW(:,50) = 255;  % reassign all of column 50 with the value 255
imshow(new_BW)       % and again...
new_BW(:,:) = 255;   % reassign the whole thing!!!
imshow(new_BW)       % WHAT HAVE YOU DONE WITH BBWLL!!!

% We can also index subportions of a matrix...

close all;                    % close image
left_BW = BW(:,1:50);         % all the rows of the 1st 50 columns
imshow(left_BW);              % take look...
center_BW = BW(50:100,:);     % the middle 50 rows, all columns
imshow(center_BW);            % and again...
middle_BW = BW(50:100,50:100);% right in the middle
imshow(middle_BW);            % peakaboo!

% Matrices can be rotated or, in the lingo, "transposed" with an apostrope

close all;          % close image
imshow(BW);         % bill upright
imshow(BW');        % bill laying down

% This may see obvious, but the same is true for 1 dimensional matrices.
% You'll notice this is the same effect as when we formed an array using
% spaces and semicolons, which you may remember from my_fourth_array and 
% my_fifth_array above...

my_first_array      % as we created it
my_first_array'     % transposed

% We can also join, or "concatenate", 2 matrices together so long as they
% share the same length along the dimension we wish to concatenate. This is
% as simple as using brackets and spaces or semicolons.

close all;                          % close image
bill_next_to_bill = [BW BW];        % concatenates matrices along rows
imshow(bill_next_to_bill);          % twinsies!

bill_on_top_of_bill = [BW; BW];     % concatenates matrices along columns
imshow(bill_on_top_of_bill);        % bill get down from there!

bill_laying_next_to_bill = [BW' BW];% concatenates a transposed matrix along rows
imshow(bill_laying_next_to_bill);   % does kathy know?!

% Let's enter a dimension further...

RGB = imread('kristan_rgb.ppm');    % RGB image of bill
imshow(RGB);                        % never looked better

% RGB images are comprise of Red, Green, and Blue components...

size(RGB)

% you'll notice that the first 2 dimensions of this matrix are the same as
% our BW image of bill; in RGB there are of 3 of these matrices, each one
% making up the Red, Green, and Blue components of bill:

close all;              % close all images
red = RGB(:,:,1);       % the red component...
green = RGB(:,:,2);     % the green...
blue = RGB(:,:,3);      % and the blue.
RGB_next_to_each_other  = [red green blue];     % for ease of viewing
imshow(RGB_next_to_each_other);                 % bill you look pale!

% Most MATLAB functions will treat matrices in an element-by-element
% nature, but for certain basic operands (*,/,^,etc...) you need to specify
% you want to act on each element specifically. This is a common source of
% errors:

close all;              % close all images
imshow(red.^2);         % the square of each element of red (try red^2 in the command line...)
imshow(red.*blue);      % multiplies each element in red by the element in the same position in blue (NOT the same as red*blue)

% ------------------- %

% PS: often you will make for loops to construct data. For instance, you
% might be tempted to do something like this:

% find the squares of each element in cat

cat = [1 59 47 122 909];
dog = [];
for i = 1:numel(cat);
    dog = [dog cat(i)^2];    % add the new value to the existing matrix dog
end

% MATLAB will often scold you, saying something like "this matrix changes
% size" or "it is faster to preallocate". If you already know the size of
% the matrix you are forming, it is always faster to "preallocate" by making
% your matrix beforehand:

% find the squares of each element in cat

cat = [1 59 47 122 909];
dog = zeros(size(cat));     % a matrix of zeros that is the same size as cat
for i = 1:numel(cat);
    dog(i) = cat(i)^2;
end

% you could really use anything to preallocate so long as it is the same
% size, such as:

ones(size(cat))                   % matrix of 1s that is the same size as cat
linspace(pi,sqrt(13),numel(cat))  % a matrix with the same number of elements as cat from pi to the sqrt(13)
rand(size(cat))                   % pseudorandom numbers of the same size of cat

% --------------- %

% PPS: since MATLAB is all about matrices, you'll often hear all the
% coolest MATLABers (oxymoron?) talking about "vectorization" (not to be
% confused with either 1 dimensional arrays or physics vectors). This is a
% more advanced subject, suffice it to say that when one "vectorizes their 
% code" they simplify their code by removing unnecessary for loops. For
% instance the above for loop could be written as:

dog = cat.^2;       % look how much faster!

% There's always more than one way to square a cat...

%% ------ MAY WANT TO INCLUDE COMMON ARRAY/MAT FUNCTIONS (SUM, MAX, MIN, RESHAPE, etc...) ----- %%%

% in the workspace, show how to use the variable viewer while debugging (this can be useful for 
% cell array indexing)

help elmat

%% FINDING and BOOLEAN INDEXING

% One of Matlab's strengths is it has a great gui and debugger (more on the
% debugger later).  Anytime you are programming you can look at the
% Workspace (often on the top right column in matlab), which list all the
% variables you've created.  If you have created a large variable whose
% value doesn't display in the workspace window you can double click on the
% variable name to open the Variable Editor to look at the variable in its
% entirety.

large_mat = round(magic(10) .* rand(10));      % supressed so it doesn't fill up our command window

% Now find large_mat in the Workspace window and view it in the Variable
% Editor.

large_mat(3,5)

% Notice how this is the value in the 3rd row and 5th column.  You can also
% try all the nifty indexing and slicing techniques you learned above.
% Now, what if you didn't know where you needed to look, but instead knew
% what you were looking for.  Lets say we wanted to find all the even
% numbers in our matrix larger than 60.

large_bool = large_mat > 60 & mod(large_mat, 2) == 0;

% This creates a matrix that is true where ever large_mat is both greater
% than 60 and even (i.e. where the value mod 2 equals 0).
% You can look at this in the Variable Editor if you'd like.

% If we want to know how many even numbers larger than 60 there are you can
% use sum.  An interesting note about sum, min and max is that they default
% to find the sum/min/max for each column.  To work around this you can use
% (:) or reshape(X, numel(X), 1).  RESHAPE(X,M,N) returns the M-by-N matrix
% that contains the elements of X taken columnwise.

sum(large_bool(:))
sum(reshape(large_bool, numel(large_bool), 1))

% If you would like the indices of the positions instead of a boolean
% matrix you can use find
large_indx = find(large_bool);

% If you would like to get the actual values instead of a boolean matrix or
% the indices you can use the boolean matrix to directly index large_mat,
% or you can use the indices

large_mat(large_bool)
large_mat(large_indx)

% Astute programmers will notice that to count the number of elements that
% match your criteria one could also use

numel(large_mat(large_bool))

% So if you were actually only looking for the smallest even element larger
% than 80 you could use

min(large_mat(large_bool))

% Also note that for simplicity we have separately defined large_bool but
% for any of these commands you could explicitly include the definition of
% large_bool instead.

min(large_mat(large_mat > 60 & mod(large_mat, 2) == 0))

% What is the largest number in your matrix that is less than 70 and
% divisible by both 3 and 5?

% In neuro, you can use these techniques to quickly find spike times
% (assuming low noise):
%       time = some array ...
%       voltage = some array ...
%       spikes = time(find(voltage(1:end-1) < 0 & voltage(2:end) > 0) + 1)
%       spikes = time([0, voltage(1:end-1) < 0 & voltage(2:end) > 0])
% This finds all times that the voltages pass from <0 to >0.  Note the +1
% for the indices and added 0 at the beginning of the logical indexing to
% account for the fact that you are looking at the change between two
% adjacent positions.

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

%%%%%%%%%%%%%%%%%%%% PLOTTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% One of MATLAB's greatest attributes is its powerful plotting cababilities.  Let's take a look:

% first lets generates some data:
x = linspace(-2*pi, 2*pi, 50);        % creates a list of numbers
y_sin = sin(x);                       % calculates the sin of each number in x
plot(x,y_sin);                        % plot it!

% NOTE: plot() also accepts a single argument, as in plot(y), but if used
% in this fashion y will be plotted against its position in y. In other
% words, plot(y) is equivalent to plot(1:numel(y),y)

% but let's say you've got some more data you want to plot...
y_cos = cos(x);
plot(x,y_cos);

% you'll notice that y_cos replaced y_sin on the axis of our first figure.
% Unless specified, MATLAB plots on the current axis. It is good practice
% to create a new figure before plotting unless you want to overwrite the
% current axis.

% lets plot our data on two seperate figures

close all;      % close all open figures
figure;         % creates a new figure
plot(x,y_sin);  % plots our sin data
figure;         % creates another figure
plot(x,y_cos);  % plots our cos data

% This is great but produces lots of figures: what if we want to use only  
% one axis and "hold" our first dataset so that it isn't overwritten by 
% the second...?

close all;          % close all open figures
figure;             % make a new figure;
plot(x,y_sin);      % plot sin data
hold on;            % hold all the data on the current axis
plot(x,y_cos,'r');  % plot cos data in red (more on this later)

% so long as hold is left "on" more data can be added...

y_line = linspace(-1,1,numel(x));         % just a line
plot(x,y_line,'g');     % plot tan data in green

% ...but once we turn hold "off" on the current axis, all previous plots
% are lost

y_mod = mod(x,2)-1;    % modulo 2 of all values of x (normalized)
hold off;               % turn off "hold" on the current axis
plot(x,y_mod,'k');      % plot mod data in black. bye-bye previous data!

%% SUBPLOT

% You'll notice that like having multiple figures, having multiple lines on the
% same plot begins to get cluttered. Luckily you can put multiple axes on
% the same figure with subplot(m,n,p). Subplot(m,n,p) creates m rows and n
% columns of axis on your figure and defines p as the current axis.

close all;          % close all open figures
figure;             % new figure
subplot(2,2,1);     % 2x2 axes with #1 (top left) as the current axis
plot(x,y_sin);      % plot sin data
subplot(2,2,2);     % same setup, now on axis #2
plot(x,y_cos,'r');  % plot cos data in red
subplot(2,2,3);     % and so on...
plot(x,y_line,'g');
subplot(2,2,4);
plot(x,y_mod,'k');

%% PIZZAZZ!!

% In previous plots we used a string as a third argument to plot() to 
% create plots of different colors. We can use these strings to define
% color, marker, and line type:

close all;              % close all open figures
figure('color','k');    % new figure, with a black background
plot(x,y_sin,'ro:');    % plot sin data in red with circles at the points and a dotted line
hold on;

% These style shortcuts can be found by typing "help plot" in the command
% line, or here: 

%            b     blue          .     point              -     solid
%            g     green         o     circle             :     dotted
%            r     red           x     x-mark             -.    dashdot 
%            c     cyan          +     plus               --    dashed   
%            m     magenta       *     star             (none)  no line
%            y     yellow        s     square
%            k     black         d     diamond
%            w     white         v     triangle (down)
%                                ^     triangle (up)
%                                <     triangle (left)
%                                >     triangle (right)
%                                p     pentagram
%                                h     hexagram

% Not enough colors for you? You can also specify any color directly using
% RGB levels
plot(x,y_cos,'color',[1 0.5 0.2],'marker','*','line','-.');
hold off;

% There are many additional ways beyond these simple commands to edit the
% layout and style of plots and figures. Here are a few useful ones,
% working with the figure we just made:

xlabel('this is the x-axis label','FontSize',14,'color','w');       % label the x axis
ylabel('this is the y-axis label','FontSize',14,'color','w');       % label the y axis
axis tight;     % sometimes matlab makes the axis too big; this fits the plot snug
grid on;        % what the hell! slap a grid on there! you only live once!
legend('sine','cosine');    % a legend describing each data set
title('THIS PLOT ROCKS!!!','FontSize',20,'Color','y');  % plot title

% this is a very small subset of tools one can use to modify plots; if you 
% can imagine it, there is probably a way to do it...

%% SET, GET, & HANDLES

% MATLAB identifies figures and axes using "handles" which the programmer
% can use to selectively target specific figures or parts of figures using
% the set() function

close all;
f_handle = figure;              % create new figure with handle "f_handle"
p_handle = plot(x,y_sin);       % plot sin data with handle "p_handle"
set(f_handle,'color','k');      % change figure color to black using its handle
set(p_handle,'color','r');      % change line color to red

% What if you didn't define a handle when creating a plot? MATLAB
% automatically stores the current handles: gca ("get current axis") and
% gcf ("get current figure").

% a good way to understand how gca works is through subplotting:

close all;          % close all open figures
figure;             % new figure
subplot(3,1,1);     % 2x2 axes with #1 (top left) as the current axis
plot(x,y_sin);      % plot sin data
subplot(3,1,2);     % same setup, now on axis #2
plot(x,y_cos,'r');  % plot cos data in red
subplot(3,1,3);     % and so on...
plot(x,y_line,'g');

% what happens if we make an additional plot? Where will it be placed?
hold on;
plot(x,y_mod,'k');          % plot mod data
title('this is the gca!');  % make a title showing which is the current axis

% now look at the figure and click on a different axis. Now repeat:
hold on;
plot(x,y_mod,'k');              % plot mod data
title('this is the NEW gca!');  % make a title showing which is the current axis

% even if you have not specified a handle, you can use 'gca' to target the
% most recently modified axis.

% using handles in conjunction with the functions set() and get() we can
% modify parts of plots. For instance, say we want to make the axes of a
% plot have the same limits:

close all;
figure;
plot(x,y_sin);
x_lim = get(gca,'xlim');    % get the limits of the x axis
set(gca,'ylim',x_lim);      % set the y limits to be the same as the x limits

%% FIGURE EDITOR
% ??? need to add this ???

%% GRADUATING FROM PLOT(): OTHER PLOTTING FUNCTIONS

% MATLAB comes with several plotting functions designed for specific uses.
% Here are a few favorites:

close all;
figure;
subplot(3,1,1);
plot(x,y_sin);      % old faithful: the plot function of our sine data
subplot(3,1,2);
bar(x,y_sin);       % a bar chart of the same data...
subplot(3,1,3);
scatter(x,y_sin);   % and a scatter plot of the same

% MATLAB is also great for plotting 3 dimensional data, such as
% scatter3()...

close all;
figure;
scatter3(x,y_sin,y_cos);    % 3D scatter plot. Use the rotate tool to move the plot!

% ...and surf(), which can matrices as surfaces:

P = peaks(40);      % make some funky surface data
close all;
figure;
surf(P);

% By assigning the viewing angle with view(), one can use surf to make
% heatplots

view(90,90);        % view plot directly from above
axis tight;         % fit axis to surface (remove white space)

%% LIGHTS, CAMERA, ANIMATION!!

% What's more badass than a killer MATLAB figure? One that moves...
% overkill? perhaps... but MATLAB makes it easy, so let's take a look!

close all;
figure;             % make a new figure
surf(P);            % plot surface
axis off;           % turn off axis visibility
axis vis3d;         % this locks the aspect ratio in 3D plots
for i = 1:360;
    camorbit(1,0);           % rotate the camera 1 degree
    F(i) = getframe(gcf);    % grab the current figure and save it as a movie frame
end

movie(gcf,F);         % play your movie!

% how bout a corkscrew for good measure?

close all;
figure;                 % make a new figure
scatter3(y_sin,y_cos,x); % plot surface
% view(90,90);            % start viewing directly from above
axis off;               % turn off axis visibility
axis vis3d;             % this locks the aspect ratio in 3D plots
for i = 1:360;
    camorbit(1,0);       % rotate the camera 1 degree
    F(i) = getframe(gcf);    % grab the current figure and save it as a movie frame
end

movie(gcf,F);         % play your movie!


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
%pack % memory defrag. might help if �out of memory� errors are getting you down
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
