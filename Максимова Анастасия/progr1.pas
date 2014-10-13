const lim=100;
var x,y:array[1..lim] of real;
i,j,k,n:byte;
max:real;
begin
writeln('vvedite razmer massiva');
readln(n);
randomize;
x[1]:=random(100)-50;
max:=x[1];
for i:=2 to n do begin
x[i]:=random(100)-50;
if x[i]>max then begin
max:=x[i];
k:=i;
end;
end;
i:=1; j:=1;
writeln('massiv x');
repeat
if k<>i then begin
writeln(x[i]);
y[j]:=x[i];
j:=j+1;
end
else
writeln(x[k]);
i:=i+1;
until i=n+1;
readln();
end.