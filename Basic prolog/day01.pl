bigger(elephant,horse). %Elephat is bigger than horse.
bigger(horse,donkey). %Horse is bigger than donkey.
bigger(donkey,dog). %Donkey is bigger than dog.
bigger(donkey,monkey). %Donkey is bigger than monkey.

%Try the following Queries:
%   1. bigger(donkey,dog).
%   2. bigger(elephant,horse).
%   3. bigger(donkey,monkey).
%   4. bigger(horse,X).
%   5. bigger(elephant,X).
%   6. bigger(elephant,dog).

is_bigger(X,Y):-bigger(X,Y).
is_bigger(X,Y):-bigger(X,Z),is_bigger(Z,Y).


