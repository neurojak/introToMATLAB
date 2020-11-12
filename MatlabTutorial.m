%% MATLAB tutorial for UCSD Neurosciences
% MatlabTutorial_Day1_v100
% Kyle Fischer, Jason Keller, Marvin Thielk
% heavily based on previous MATLAB and Python tutorials by Jeff Bush and Doug Rubino
% version 1.00, Fall 2013
%
% This script (a 'script' is just a piece of code that doesn't require any inputs, as opposed to a
% 'function', which does) is a brief introduction to programming in MATLAB, which is intended to be
% completed in a few hours, possibly a over couple evenings.
%
% Even if you are already familiar with programming, we recommend that you step through this to make 
% sure that everyone is on the same page. The tutorial is meant to be stepped through in Debug mode,
% by placing a breakpoint on the first executable line (in the editor, click on the blank space
% just to the right of the line # and a red dot should appear). Then press F5 to run until the next 
% breakpoint, and F10 to execute only the next line of code (or F11 to 'step into' that line if it 
% contains a function). It can be helpful to view the main (i.e. '>>') command window at the same 
% time as you advance through the code.

% Other learning resources from MathWorks:
% http://www.mathworks.com/academia/student_center/tutorials/launchpad.html

%% COMMENTS and BOOKMARKS
% First, any text after a '%' symbol is a comment and is ignored by MATLAB.
% For example, all of these lines so far are ignored. You should be in the
% practice of commenting your code thoroughly so that someone else will know
% what it is doing and so you will know in a couple months when you go back and
% look at it (you think you'll remember but you won't).

% A line that starts with '%%' creates a block for 'folding' and organizing (try <Ctrl-Shift-=> 
% to expand all folded sections

%{
For a large block comment, use '%{'
That was easy. Or maybe even easier, highlight a large portion of text and press <Ctrl-'r'> to
comment, <Ctrl-'t'> to uncomment
%}

% To set a 'bookmark' in the code, press <Ctrl-'F2'> when the cursor is on that line to toggle the
% bookmark on/off (a cyan square should appear). Then just press <F2> to hop between bookmarks.

%% BASICS
% To output characters to the command window, you use 'disp' or 'display', where a string is 
% enclosed in single quotes like so:
disp('Cajal = God')

% Next copy and paste to above line straight onto the command line and press <Enter>. You can run
% any command at any time while you are debugging. Next, with the cursor still on the command line,
% press the <up> key to scroll through your list of previous commands. You can also type partial
% commands and then MATLAB will match every previous command that completes your command when you
% press the <up> key.

% Simple math is pretty straight forward; notice how the semicolon suppresses output to the
% monitor. If the semicolon is missing, MATLAB will warn you by default (see the thin orange line
% to the left of the scroll bar? It would be red if you made a syntax error...)
2 + 2 % displays 4 (answer is automatically saved into a variable called 'ans')
disp(2 + 2) % displays 4
3^3 % displays 27
3^3; % displays nothing b/c of semicolon
7/2 % displays 3.5000 (the default data type in MATLAB is 64-bit double-precision - what a memory hog)
int8(7/2) % displays 4 (because we have forced the output to an 8-bit integer)
rem(7,2) % displays 1 (the remainder after dividing 7 by 2)
mod(7,2) % displays 1 (the modulo/remainder after dividing 7 by 2)
abs(-5) % displays 5
round(5.53) % displays 6
floor(5.53) % displays 5

% You can create variables to hold values:
x = 2 + 2 % assigns 4 to the variable x
y = x * 3 % assigns 12 to the variable y
y / 2 % disps 6

%Everything in MATLAB is case-sensitive; uncomment and run this to create an error:
% disp(Y)

% Ellipses can be used if you want to keep code neat and confined to a certain width on the screen:
x =...
    x^2;

clear x; % delete variable x from your workspace
clear all; % clear the workspace of all variables to free up memory and organize yourself
clc; % clears the command window

% One of MATLAB's greatest strengths as a programming language is its documentation.
% At any time if you want to know what a function does you can use the help function like so:
help floor
help elfun
% Also, don't be afraid to open the help browser and search for commands. Often there will be links
% to other useful functions at the bottom of the help file in the 'See Also' section.

%% ERRORS
% It is inevitable that you will run into errors in your code so you need to understand the common 
% errors, what they mean, and how to work on fixing them. In general, MATLAB does a decent job of 
% explaining what goes wrong.  When an error occurs, it will show you the file and line it occured 
% in, and provide a link to that line. 

% For example, uncomment and run the line below to get the DREADED MACHINE ERROR SOUND and 
% accompanying RED TEXT:
% x = [5, 6, 7);

% this should produce a RED TEXT like
%{
Error: File: MatlabTutorial.m Line: 96 Column: 13
Unbalanced or unexpected parenthesis or bracket.
%}

% Additionally, if the error-causing line is in a file that is a function called by another 
% function or script, it will show the entire 'breadcrumbs' of function calls that led to the error.  
% Thus an error that may seem obscure at first because it's not in YOUR code can be easily traced
% because you can see how the input that you passed to a certain function was invalid.

% For example, let's try to find the least common multiple of 0 and 1 (uncomment next line):
% y = lcm(0,1);
% this should produce a RED TEXT like
%{
Error using lcm (line 17)
Input arguments must contain positive integers.

Error in MatlabTutorial (line 106)
y = lcm(0,1);.
%}

% Some other common errors:
% (1) Undefined function or variable 'x'.
%       - you tried to use a variable/name that you haven't defined yet
% (2) Index exceeds matrix dimensions.
%       - e.g. you tried to access the 10th value in a list of 9 numbers 
% (3) Undefined function 'foo' for input arguments of type 'double'.
%       - you tried to use a function called 'foo', but MATLAB doesn't know where it is
%       - Maybe you just spelled 'foo' wrong, but this is part of a larger lesson about the MATLAB 
%       - 'path', which is basically an ordered list of locations in which to look for functions 
%       - like 'foo(x)'.  
%       - To see your MATLAB path, access it from the main file menu or ribbon in MATLAB (depends 
%       - on version) by clicking on something like [File->Set Path] or just a [Set Path] button.
%       - OR just type "help path" in the main command line.  Adding locations is self-explanatory.

% There are many other errors that you will run into (hopefully not too often), but just remember
% to use the breadcrumbs and help menus to figure out what went wrong.

%% ARRAYS, MATRICES, and INDEXING
% Now that you're fast on your way to being a pro in the MATrix LABratory,
% its about time we get to some matrices.

% Most programming languages have ways of handling groups of data/values as one
% variable, often refered to as "arrays", "lists", or even "vectors" (not
% to be confused with the physics vector). Everything in MATLAB is based on
% arrays, and if there are multiple dimensions we can call them "matrices". Let's start simple:

my_first_array = [1:1:10] % 
% is a 1x10 matrix from 1 to 10 increasing by 1. A 1 dimensional matrix is
% often refered to as an "array" or "vector", but its no different from
% other matrices. You'll also notice that:
my_second_array = [1:10] % is the same thing (we don't have to specify the incriment if it is 1...
my_third_array = [1:2:10] % ...but we do for other increments...the colon operator also allows you 
                          % to create an equally spaced vector of values using the more general form 
                          % "start:step:end"
my_fourth_array = [1 4 5 2 8 47 1206] % any numbers within brackets creates a matrix
my_fifth_array = [1; 4; 5; 8; 47; 1206] % notice that this matrix is the same but rotated... more on that later

% Some basic functions to perform on arrays:
min(my_first_array)
max(my_first_array)
sum(my_first_array)
length(my_first_array)
mean(my_first_array)
std(my_first_array) % standard deviation - MATLAB has a lot of statistics functions built in, but aficionados use the "statistics toolbox" (more $)

% Unlike most other programming languages, MATLAB DOES NOT (BEWARE!!!) use a zero
% index; that is, if you want the first element in an array, you use 1:
my_first_array(1) % the first element
my_first_array(10) % the last element
my_first_array(end) % also the last element (neato!)
my_first_array(end-1) % the second to last element

% More useful ways to make a an array:
l = linspace(0, 2*pi, 10000); % 10000 element array from 0 to 2*pi (inclusive); how easy is it to plot a sine wave using these linearly spaced values? -> plot(l,sin(l))
z = zeros(50); % an array of 50 zeros, this function is often used for "preallocation" discussed later
o = ones(50); % an array of 50 ones
p = pi*ones(50); % an array of 50 pi's


% ---- !!! A BRIEF FORAY INTO IMAGE PROCESSING !!! ------------------------------------------
% MATLAB is as phenomenal for image processing as it is boring for learning
% about matrix manipulation. So before we go any further, lets play with a
% fun matrix: an image.

BW = imread('kristan_bw.pgm'); % reads in an image
imshow(BW); % shows our image... er, I mean, matrix

% So you just made a 2-dimensional array (or "matrix") but instead of
% making some random 2D matrix, this image will let us visualize
% exactly what we're doing instead of looking at a bunch of numbers.
% Each element of this matrix is 1 pixel, with a value from 0 (black) to 255 (white).
% Let's see how big our matrix is:

size(BW) % the (surprise!) size of the matrix as (row x column)
length(BW) % length returns the longest dimension (same as max(size))
numel(BW) % the number of elements in BW

% If we want to index into this matrix, we treat it the same way we would
% an array, just with 2 dimensions:
firstPixel = BW(1,1) % returns the value in the first the first row and first column (the upper left corner)

% If you only include a single index value for a multidimensional array, then MATLAB uses "linear
% indexing". For more information, search help for 'ind2sub'
midPixel = BW(floor(numel(BW)/2))  %returns the value of the ~middle pixel

% We can assign values in the same manner:
new_BW = BW; % copy BW for the sake of this experiment
new_BW(1,1) = 0; % reassign row 1 column 1 with the value 0
imshow(new_BW); % zoom into the upper left hand corner to see the effect

% The colon (:) operate means "the entire ___" where ____ is row or column.
% Check out what happens when we do this...
close all; % close image
new_BW = BW; % copy BW for the sake of this experiment
new_BW(50,:) = 0; % reassign all of row 50 with the value 0
imshow(new_BW); % let's see what happened...
new_BW(:,50) = 255; % reassign all of column 50 with the value 255
imshow(new_BW) % and again...
new_BW(:,:) = 255; % reassign the whole thing!!!
imshow(new_BW) % WHAT HAVE YOU DONE WITH BILL!!!

% We can also index subportions of a matrix...
close all; % close image
left_BW = BW(:,1:50); % all the rows of the 1st 50 columns
imshow(left_BW); % take look...
center_BW = BW(50:100,:); % the middle 50 rows, all columns
imshow(center_BW); % and again...
middle_BW = BW(50:100,50:100);% right in the middle
imshow(middle_BW); % peakaboo!

% Matrices can be rotated or, in the lingo, "transposed" with an apostrope
close all; % close image
imshow(BW); % bill upright
imshow(BW'); % bill laying down

% This may see obvious, but the above is true for 1-dimensional matrices/arrays.
% You'll notice that the code below has the same effect as when we formed an array using
% spaces and semicolons, which you may remember from my_fourth_array and
% my_fifth_array above...
my_first_array % as we created it
my_first_array' % transposed

% We can also join, or "concatenate", 2 matrices together so long as they
% share the same length along the dimension we wish to concatenate. This is
% as simple as using brackets and spaces or semicolons.
close all; % close image
bill_next_to_bill = [BW BW]; % concatenates matrices along rows
imshow(bill_next_to_bill); % twinsies!

bill_on_top_of_bill = [BW; BW]; % concatenates matrices along columns
imshow(bill_on_top_of_bill); % Bill, get down from there!
bill_laying_next_to_bill = [BW' BW];% concatenates a transposed matrix along rows
imshow(bill_laying_next_to_bill); % does Kathy know?!

% Let's go a dimension further...
RGB = imread('kristan_rgb.ppm'); % RGB image of Bill
imshow(RGB); % never looked better

% RGB images are comprise of Red, Green, and Blue components
size(RGB)

% You'll notice that the first 2 dimensions of this matrix are the same as
% our BW image of Bill; in RGB there are of 3 of these matrices, each one
% specifying the amount of Red, Green, and Blue in each pixel of Bill:
close all; % close all images
red = RGB(:,:,1); % the red component...
green = RGB(:,:,2); % the green...
blue = RGB(:,:,3); % and the blue.
RGB_next_to_each_other = [red green blue]; % for ease of viewing
imshow(RGB_next_to_each_other); % Bill, you look pale!

% Most MATLAB functions will treat matrices in an element-by-element
% nature, but for certain basic operands (*,/,^,etc...) you need to specify
% you want to act on each element specifically. This is a common source of RED ERRORS and NASTY SOUNDS:
close all; % close all images
imshow(red.^2); % the square of each element of red (try red^2 in the command line...)
imshow(red.*blue); % multiplies each element in red by the element in the same position in blue (NOT the same as red*blue)
close all;

%% STRINGS
% Strings are just arrays of characters!
% You can concatenate strings to each other:
str1 = 'How ';
str2 = 'are you?';
longer_str = [str1 str2] % How are you?

% You can easily convert numbers to a str:
num_str = num2str(2+2) % the string "4"

% This can be very useful for outputting to the screen or figures:
disp(['2 + 2 = ', num2str(2+2)]) % prints '2 + 2 = 4'

%% BOOLEANS or LOGICALS
% Booleans or Logicals as MATLAB calls them are values that are either True
% or False. They are typically used in conditional tests which we will get
% to very soon or logical indexing which is also covered later. MATLAB
% represents true and false by a 1 and 0 respectively, although if you
% apply a boolean operator to a double, any non-zero number (except NaN) is
% considered true.

% Boolean operations:
t = true;
f = not(t) % False (not switches True to False and False to True)
f = ~t % False (~ is shorthand for not())
result = t && t % True (and is True only if both are True)
result = t && f % False (this and is False if either is False)
result = f && f % False
result = t || t % True (or is True if either is True)
result = t || f % True
result = f || f % False

% You can also make booleans by comparisons:
x = 5
x > 4 % true (greater than)
x >= 4 % true (greater than or equal to)
x < 4 % false (less than)
x <= 4 % false (less than or equal to)
x == 4 % false (equals)
x ~= 4 % true (not equals), can also be written 5 <> 4
4 < x < 6 % true, although not the same as 4 < x and x < 6
                % evaluates 4 < x which is true, then whether true (1) < 6
4 < x == 5 % false, not the same as 4 < x and x == 5
4 < x && x == 5 % true, same as 4 < x and x == 5

% To compare strings you use strcmp or regexp if thats the way you swing:
b = strcmp('aardvark', 'zebra') % false
b = strcmp('zebra', 'zebra') % true
b = strcmp('zebra', 'Zebra') % false (capitalization matters)
b = strcmpi('zebra', 'Zebra') % true (ignores capitalization)

% A very useful technique is utilizing logical arrays. Above we used &&
% and || as and and or, however, those only apply to single boolean values.
% Too compare an array of logicals bitwise we use | and &.
a = [t, f, f, t, f, f, t, t]
b = [t, t, f, t, t, f, f, t]

a & b
a | b

% There are many functions that return logical arrays such as the set operation 'ismember':
fib = [0 1 1 2 3 5 8 13 21 34 55 89 144];
ismember(1:50, fib) % which of the first 50 numbers are fibbonacci numbers
~ismember(1:50, fib) % which aren't

%% FINDING and LOGICAL INDEXING
% One of MATLAB's strengths is it has a great GUI and debugger (which you should
% be using now if you are stepping through this code). Anytime you are programming you 
% can look at the Workspace (often on the top right column in MATLAB), which list all 
% of the variables that you've created. If you have created a large variable whose
% value doesn't display in the workspace window you can double click on the
% variable name to open the Variable Editor to look at the variable in its
% entirety, or even edit it directly there.

large_mat = round(magic(10) .* rand(10)); % suppressed so it doesn't fill up our command window

% Now find large_mat in the Workspace window and view it in the Variable Editor
large_mat(3,5)

% Notice how this is the value in the 3rd row and 5th column. You can also
% try all the nifty indexing and slicing techniques you learned above.
% Now, what if you didn't know where you needed to look, but instead knew
% what you were looking for. Lets say we wanted to find all the even
% numbers in our matrix larger than 60.

large_bool = large_mat > 60 & mod(large_mat, 2) == 0;

% This creates a matrix that is true where ever large_mat is both greater
% than 60 and even (i.e. where the value mod 2 equals 0).
% You can look at this in the Variable Editor if you'd like.

% If we want to know how many even numbers larger than 60 there are you can
% use sum. An interesting note about sum, min and max is that they default
% to find the sum/min/max for each column. To work around this you can use
% (:) or reshape(X, numel(X), 1). RESHAPE(X,M,N) returns the M-by-N matrix
% that contains the elements of X taken columnwise.
sum(large_bool(:))
sum(reshape(large_bool, numel(large_bool), 1))

% If you would like the indices of the positions instead of a boolean
% matrix you can use the 'find' function:
large_indx = find(large_bool);

% If you would like to get the actual values instead of a boolean matrix or
% the indices you can use the boolean matrix to directly index large_mat,
% or you can use the indices:
large_mat(large_bool)
large_mat(large_indx)

% Astute programmers will notice that to count the number of elements that
% match your criteria one could also use:
numel(large_mat(large_bool))

% So if you were actually only looking for the smallest even element larger
% than 80 you could use:
min(large_mat(large_bool))

% Also note that for simplicity we have separately defined large_bool but
% for any of these commands you could explicitly include the definition of
% large_bool instead:
min(large_mat(large_mat > 60 & mod(large_mat, 2) == 0))

% What is the largest number in your matrix that is less than 70 and divisible by both 3 and 5?

% In neuroscience, you can use these techniques to quickly find spike times(assuming low noise):
% time = some array ...
% voltage = some array ...
% spikes = time(find(voltage(1:end-1) < 0 & voltage(2:end) > 0) + 1)
% spikes = time([0, voltage(1:end-1) < 0 & voltage(2:end) > 0])
% This finds all times that the voltages pass from <0 to >0. Note the +1
% for the indices and added 0 at the beginning of the logical indexing to
% account for the fact that you are looking at the change between two
% adjacent positions.

%% IF STATEMENTS
% So now we get into the interesting topic of program control. 'If statements' let you run a chunk
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

% More complicated control can be built with 'switch statments:
help switch

% NOTE ABOUT PYTHON:
% Python is somewhat strange in that indentation controls the nesting in 'if statements'
% and other control, but MATLAB does not require any specific spacing or indentation, it 
% is only aesthetic

%% WHILE LOOPS
% So now that we have conditional statements down, lets tackle loops. The
% simplest loop is a 'while loop'. An example is:

a = 0;
b = 1;
while b < 20
    disp(b)
    a = b;
    b = a + b;
end
pause  % require user input in Command Window to continue
% Put a breakpoint on the end statement and runthe whole loop at once. Do you recongnize the 
% pattern of numbers? The while loop will repeatedly run the code inside it until it's
% conditional statement is False. So you can compute more of this series by
% changing "b < 20" to "b < 2000".

% You can also conditionally break out of any loop, depending on a calculation, using a 'break':
a = 0;
b = 1;
while b < 20
    disp(b)
    a = b;
    b = a + b;
    if b == 8
        break % anything but 8 - let's quit this BS now
    end
end
pause 

% Finally, in case you get yourself into an infinite loop, 
% note that you can stop most MATLAB operations using <Ctrl-C>

%% FOR LOOPS, PREALLOCATION, and VECTORIZATION
% The truth is that you probably won't use the "while loop" too much, because its
% brother the "for loop" is much more convenient.
a = {'cat', 'window', 'defenestrate'};
for x = a % For loops can take any 'iterable' object
  disp(x)
end

for letter = 'cat'
  disp(letter)
end

% More commonly, we will be using the array techniques we learned above with our loops:
for x = 0:2:10
    disp(['cat ' num2str(x)])
end

% Often you will make for loops to construct data. For instance, you
% might be tempted to do something like this:

% find the squares of each element in cat
cat = [1 59 47 122 909];
dog = [];  % declare an empty matrix
for i = 1:numel(cat);
    dog = [dog cat(i)^2]; % add the new value to the existing matrix dog
end

% MATLAB will often scold you with orange warnings, saying something like "this matrix changes
% size" or "it is faster to preallocate". If you already know the size of
% the matrix you are forming, it is always faster to "preallocate" by making
% your matrix beforehand:
cat = [1 59 47 122 909];
dog = zeros(size(cat)); % a matrix of zeros that is the same size as cat
for i = 1:numel(cat);
    dog(i) = cat(i)^2;
end

% You could really use anything to preallocate so long as it is the same size, such as:
ones(size(cat)) % matrix of 1s that is the same size as cat
linspace(pi,sqrt(13),numel(cat)) % a matrix with the same number of elements as cat from pi to the sqrt(13)
rand(size(cat)) % pseudorandom numbers of the same size of cat

% Since MATLAB is all about matrices, you'll often hear all the
% coolest MATLABers (oxymoron?) talking about "vectorization" (not to be
% confused with either 1 dimensional arrays or physics vectors). This is a
% more advanced subject, but suffice it to say that when one "vectorizes their
% code" they simplify their code by removing unnecessary for loops. For
% instance the above for loop could be written as:
dog = cat.^2; % look how much faster!

% Actually, we can measure how much faster on a particular processor using 'tic' and 'toc':
tic
cat = [1 59 47 122 909];
dog = [];  % declare an empty matrix
for i = 1:numel(cat);
    dog = [dog cat(i)^2]; % add the new value to the existing matrix dog
end
notPreallocatedNotVectorized = toc

tic
cat = [1 59 47 122 909];
dog = zeros(size(cat)); % a matrix of zeros that is the same size as cat
for i = 1:numel(cat);
    dog(i) = cat(i)^2;
end
preallocatedButNotVectorized = toc

tic
dog = cat.^2; 
vectorizedShazam = toc
pause
% There's always more than one way to square a cat...

%% FUNCTIONS
% Up until now our little matlab tutorial has been a "script"; it starts at
% the top and runs line-by-line down to the bottom where it stops and every
% variable is visible in the workspace. This is all well and good, but
% maybe you're writing a bigger script that then goes to ANOTHER script
% which feeds into ANOTHER. You could copy and paste them all together, but
% Before long you've got 3000 lines of code and are naming variables things
% like zebra_cincinatti_pharmacy because you've run out of usable variable
% names.

% Functions make code neater, more compact, and easier to debug. A function
% is basically a script in a suit in tie; you pick a script up off its
% feet, give it a name, tell it what it gets and what to give in return.

% Lets say you're trying to find the (euclidean) distance between 2 points.
% You could write:
point_1 = rand(1,2); % 2 random x,y coordinates
point_2 = rand(1,2); % 2 random x,y coordinates

distance = sqrt((point_1(1) - point_2(1))^2 + (point_1(2) - point_2(2))^2); % the distance formula

% Now maybe this is only 1 line of code and writing it makes you consider
% what a cute couple Euclid and Pythagoras would have made, but this can
% get annoying after a while (not the hypothetical mathematician-toga-love
% part, the writing part). Plus, maybe you want to calculate the distance
% between points in 3,3,5...N dimensions! Think of the time you'll save!

% This is where things get awkward: unlike other programming languages, you
% cannot write a function within another script or function in MATLAB.
% Instead, every function is saved as a .m file, with the filename being the same
% as the function call. Ours is called "euclidean_distance.m" Open it up, and keep 
% following along.

% The first line of all functions look like this (without the comment):

% [output] = function_name(input)

% the function's last line is an "end". Functions can have multiple inputs
% and outputs

% [output_1, output_2] = function_name(input_1, input_2, input_3)

% When you write a function, the input variable names in the first line
% MUST match those in the script below it, but when you "call" the function
% in one of your other scripts or functions, you can use whatever you want
% so long as it follows the same pattern. For instance, in our distance
% function:
lou_ferrigno = rand(5,1); % a random 5 dimensional point
a_french_baguette = rand(5,1); % and another random 5 dimensional point

sasquatch_felony = euclidean_distance(lou_ferrigno,a_french_baguette);

% And as any schoolchild would tell you, sasquatch_felony is the
% euclidean distance between lou_ferrigno and a_french_baguette. It's basic math.

% The variable you output does not have to be the last variable in your
% function. Whatever the value of your defined output variable is at the
% end of the function will be returned.

% You'll notice that when you write a script, all of the variables will show
% up in the "workspace". When you call a function, you don't see any of the
% variable values within the function, only those that you specify as
% output. This has to do with a variable being "local". As matlab progesses
% through your script, all the variables shown in the workspace are
% accessible. However, only those variables passed to or calculated within
% a function are accessible inside that function.

% Try putting a debugging stop in any line of the euclidean_distance.m file
% (click the little dash next to the line of code once). Now run the next
% line (using F11 to 'step into' the function) and keep an eye on your variable workspace:

sasquatch_felony = euclidean_distance(lou_ferrigno,a_french_baguette);

% The function runs and stops at your debug point (a K shows up before >>
% in the command window to show you are in debug mode) and you can now view
% the workspace within the function. This is useful to debug problems
% within the function: you can type anything into the command window using
% the variables in the workspace to see what your problem might be.

% One last thing on functions: commented lines put directly below the first
% line of the function are returned when you type "help function_name" in
% the command window. Like:

help euclidean_distance

% Its good practice to include a discription of your function and who and
% when it was made with all your functions, lest you forget how or why you
% made it.

% Every function that comes built-in with matlab (sum, mean, kmeans, max,
% etc.) has its own .m file. It is customary to give your .m file the same
% name as your function: weird things can happen if you don't. And trust
% us, as with variables, give the function a name you can understand:
% you'll save yourself hours of reading or rewriting code to figure out
% what super_func.m does a few months from now...

% Congrats! Now you can add to an already stellar set of functions:
% As an exercise, try writing a function that computes the
% Fibonacci series up to a given value. It should store every value in a list
% and return that list.

% To make sure it works, print out that list by doing something like:
% fib(20) % should print [1, 1, 2, 3, 5, 8, 13]
% fib(2000) % should print [1, 1, 2, 3, 5, 8, 13, ... 610, 987, 1597]

% Tip: the example for while loops printed the Fibonacci series, so you have
% the algorithm.

%% FILE I/O
% TO DO: example with .mat files and maybe spreadsheets

%% PLOTTING
% One of MATLAB's greatest attributes is its powerful plotting cababilities. Let's take a look:

% first lets generates some data:
x = linspace(-2*pi, 2*pi, 50); % creates a list of numbers
y_sin = sin(x); % calculates the sin of each number in x
plot(x,y_sin); % plot it!

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

close all; % close all open figures
figure; % creates a new figure
plot(x,y_sin); % plots our sin data
figure; % creates another figure
plot(x,y_cos); % plots our cos data

% This is great but produces lots of figures: what if we want to use only
% one axis and "hold" our first dataset so that it isn't overwritten by
% the second...?

close all; % close all open figures
figure; % make a new figure;
plot(x,y_sin); % plot sin data
hold on; % hold all the data on the current axis
plot(x,y_cos,'r'); % plot cos data in red (more on this later)

% so long as hold is left "on" more data can be added...
y_line = linspace(-1,1,numel(x)); % just a line
plot(x,y_line,'g'); % plot tan data in green

% ...but once we turn hold "off" on the current axis, all previous plots
% are lost
y_mod = mod(x,2)-1; % modulo 2 of all values of x (normalized)
hold off; % turn off "hold" on the current axis
plot(x,y_mod,'k'); % plot mod data in black. bye-bye previous data!

% SUBPLOTTING: ----------------------------------------------------------------
% You'll notice that like having multiple figures, having multiple lines on the
% same plot begins to get cluttered. Luckily you can put multiple axes on
% the same figure with subplot(m,n,p). Subplot(m,n,p) creates m rows and n
% columns of axis on your figure and defines p as the current axis.

close all; % close all open figures
figure; % new figure
subplot(2,2,1); % 2x2 axes with #1 (top left) as the current axis
plot(x,y_sin); % plot sin data
subplot(2,2,2); % same setup, now on axis #2
plot(x,y_cos,'r'); % plot cos data in red
subplot(2,2,3); % and so on...
plot(x,y_line,'g');
subplot(2,2,4);
plot(x,y_mod,'k');

% PIZZAZZ!!---------------------------------------------------------------------
% In previous plots we used a string as a third argument to plot() to
% create plots of different colors. We can use these strings to define
% color, marker, and line type:

close all; % close all open figures
figure('color','k'); % new figure, with a black background
plot(x,y_sin,'ro:'); % plot sin data in red with circles at the points and a dotted line
hold on;

% These style shortcuts can be found by typing "help plot" in the command
% line, or here:

% b blue . point - solid
% g green o circle : dotted
% r red x x-mark -. dashdot
% c cyan + plus -- dashed
% m magenta * star (none) no line
% y yellow s square
% k black d diamond
% w white v triangle (down)
% ^ triangle (up)
% < triangle (left)
% > triangle (right)
% p pentagram
% h hexagram

% Not enough colors for you? You can also specify any color directly using
% RGB levels
plot(x,y_cos,'color',[1 0.5 0.2],'marker','*','line','-.');
hold off;

% There are many additional ways beyond these simple commands to edit the
% layout and style of plots and figures. Here are a few useful ones,
% working with the figure we just made:

xlabel('this is the x-axis label','FontSize',14,'color','w'); % label the x axis
ylabel('this is the y-axis label','FontSize',14,'color','w'); % label the y axis
axis tight; % sometimes matlab makes the axis too big; this fits the plot snug
grid on; % what the hell! slap a grid on there! you only live once!
legend('sine','cosine'); % a legend describing each data set
title('THIS PLOT ROCKS!!!','FontSize',20,'Color','y'); % plot title

% This is a very small subset of tools one can use to modify plots; if you
% can imagine it, there is probably a way to do it...

%% ADVANCED PLOTTING
% SET, GET, & HANDLES ----------------------------------------------------------
% MATLAB identifies figures and axes using "handles" which the programmer
% can use to selectively target specific figures or parts of figures using
% the set() function

close all;
f_handle = figure; % create new figure with handle "f_handle"
p_handle = plot(x,y_sin); % plot sin data with handle "p_handle"
set(f_handle,'color','k'); % change figure color to black using its handle
set(p_handle,'color','r'); % change line color to red

% What if you didn't define a handle when creating a plot? MATLAB
% automatically stores the current handles: gca ("get current axis") and
% gcf ("get current figure").

% A good way to understand how gca works is through subplotting:

close all; % close all open figures
figure; % new figure
subplot(3,1,1); % 2x2 axes with #1 (top left) as the current axis
plot(x,y_sin); % plot sin data
subplot(3,1,2); % same setup, now on axis #2
plot(x,y_cos,'r'); % plot cos data in red
subplot(3,1,3); % and so on...
plot(x,y_line,'g');

% what happens if we make an additional plot? Where will it be placed?
hold on;
plot(x,y_mod,'k'); % plot mod data
title('this is the gca!'); % make a title showing which is the current axis

% now look at the figure and click on a different axis. Now repeat:
hold on;
plot(x,y_mod,'k'); % plot mod data
title('this is the NEW gca!'); % make a title showing which is the current axis

% Even if you have not specified a handle, you can use 'gca' to target the
% most recently modified axis.

% Using handles in conjunction with the functions set() and get() we can
% modify parts of plots. For instance, say we want to make the axes of a
% plot have the same limits:
close all;
figure;
plot(x,y_sin);
x_lim = get(gca,'xlim'); % get the limits of the x axis
set(gca,'ylim',x_lim); % set the y limits to be the same as the x limits

% There are tons of attributes to set in plots.  For examples, search MATLAB help for "line properties"

% FIGURE EDITOR ---------------------------------------------------------------------------
% TO DO: example with modifying a plot and then creating code from your GUI input

% GRADUATING FROM PLOT(): OTHER PLOTTING FUNCTIONS -----------------------------------------
% MATLAB comes with several plotting functions designed for specific uses.
% Here are a few favorites:
close all;
figure;
subplot(3,1,1);
plot(x,y_sin); % old faithful: the plot function of our sine data
subplot(3,1,2);
bar(x,y_sin); % a bar chart of the same data...
subplot(3,1,3);
scatter(x,y_sin); % and a scatter plot of the same

% MATLAB is also great for plotting 3 dimensional data, such as
% scatter3()...
close all;
figure;
scatter3(x,y_sin,y_cos); % 3D scatter plot. Use the rotate tool to move the plot!

% ...and surf(), which can matrices as surfaces:
P = peaks(40); % make some funky surface data
close all;
figure;
surf(P);

% By assigning the viewing angle with view(), one can use surf to make
% heatplots:
view(90,90); % view plot directly from above
axis tight; % fit axis to surface (remove white space)

%% LIGHTS, CAMERA, ANIMATION!!
% What's more badass than a killer MATLAB figure? One that moves...
% overkill? perhaps... but MATLAB makes it easy, so let's take a look!

close all;
figure; % make a new figure
surf(P); % plot surface
axis off; % turn off axis visibility
axis vis3d; % this locks the aspect ratio in 3D plots
for i = 1:360;
    camorbit(1,0); % rotate the camera 1 degree
    F(i) = getframe(gcf); % grab the current figure and save it as a movie frame
end

movie(gcf,F); % play your movie! (abort a movie by typing <Ctrl-C>)

% how bout a corkscrew for good measure?
close all;
figure; % make a new figure
scatter3(y_sin,y_cos,x); % plot surface
% view(90,90); % start viewing directly from above
axis off; % turn off axis visibility
axis vis3d; % this locks the aspect ratio in 3D plots
for i = 1:360;
    camorbit(1,0); % rotate the camera 1 degree
    F(i) = getframe(gcf); % grab the current figure and save it as a movie frame
end

movie(gcf,F); % play your movie!

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
% % Calculate a single step of the integration
% % n are the variables
% % t is the current time
%
% u, v = n % n must be 'unpacked'
%
% % Compute the integration step
% dudt = v
% dvdt = -u
%
% return dudt, dvdt % return these values
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
help specfun % specialized math functions
help datafun % data analysis and Fourier transforms
help stats % help overview for statistics toolbox (if you have it installed)
help elfun
help elmat
help syntax

which + %which function '+' are you using? (can be used with any function)
clc % clear command window
why(1000) % a primitive Siri
% eval % useful for automated data input
% pack % memory defrag. might help if ?out of memory? errors are getting you down
% squeeze % get rid of empty dimensions
% sparse % converts a full matrix to sparse form
% data input functions?
% dbstop if error
% keyboard %for debugging within functions; type 'return' to exit
% stats %needs stats toolbox

%From KyleF
% bsxfun
% nargin
% ginput
% diary(?)
% cbrewer (not a function, but file with better colormaps)
% mod

%% USEFUL KEYBOARD SHORTCUTS
% < shift + '[' > for decrease indent
% < Ctrl + 'R' > for comment line or selection
% < Ctrl + 'T' > for uncomment line or selection

%% FUTURE TOPICS
% (1)Object Oriented Programming:
% http://www.mathworks.com/help/matlab/object-oriented-programming.html?s_tid=doc_12b
% TO DO: put a short example of MATLAB class definition file here, much like function example

% (2) MEX files - interfacing with C

% (3) Cells and Structs and indexing with them

% end of tutorial
