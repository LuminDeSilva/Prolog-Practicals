%Atoms
%---------
%Variation of constants
%Any names or objects
%Rules
%   Strings of letters, digits and _ (underscore)
%   Start with lower case letters
%   If start with capital letters , use ‘’(quotes)

%Eg:- tom,pat,x100,x_45
cat(tom).
man(pat).
house(no_10).


%Numbers
%----------
%Integer numbers can represent
%Normal range of integers -16383 to 16383
%Support for real numbers
%Eg:-1,2,100,25,...
even(2).
odd(3).


%Variables
%-----------
%String of letters, digits and underscore
%Start with an upper-case letter or underscoreEx:-X
%_:- use for anonymous variable
%Eg:-X,Y,Xval,_X
sum(100,200,X):- X is 100+200.


%Structures
%------------
%Objects that have several components.
day(01,february,2023).
point(10,25).



