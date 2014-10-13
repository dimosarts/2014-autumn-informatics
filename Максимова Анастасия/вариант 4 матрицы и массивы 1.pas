const lim=100;
var a:array[1..lim] of integer;
i, n, max, min,k1,k2,s:integer;
begin
randomize;
writeln('vvedite razmer massiva');
readln(n);
a[1]:=random(100)-50;
writeln(a[1]);
max:=a[1];
min:=a[1];
for i:=2 to n do begin
a[i]:=random(100)-50;
writeln(a[i]);
if a[i]>max then begin 
max:=a[i];
k1:=i;
end
else if a[i]<min then begin
min:=a[i];
k2:=i;
end;
end;
s:=0;
if k1>k2 then 
for i:=k2+1 to k1-1 do
s:=s+a[i]
else
for i:=k1+1 to k2-1 do
s:=s+a[i];
writeln('summa elemenov mezdu max i min ',s);
readln();
end.
