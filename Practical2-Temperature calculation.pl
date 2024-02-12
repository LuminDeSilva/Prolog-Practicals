avg(berlin,49).
avg(karlsruhe,60).
avg(paris,55).
avg(belgrade,52).
avg(chicago,50).
avg(boston,48).
avg(johannesburg,55).

%calculate the average temperture
avg_temp(X,Y):-
    avg(X,Temp),
    Y is round((Temp-32)*5/9).

play_outside(City):-
    avg_temp(City,Temp),
    Temp<15.


colder(City1,City2):-
    avg_temp(City1,Temp1),
    avg_temp(City2,Temp2),
    Temp1<Temp2.


same(City1,City2):-
    avg_temp(City1,Temp),
    avg_temp(City2,Temp),
    City1\=City2.


