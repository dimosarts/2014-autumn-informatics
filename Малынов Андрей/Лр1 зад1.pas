Program raduga;  {a(a - n)(a � 2*n)...(a - n*n)}
var a,b,n,i,c: integer;
begin
writeln('������� �');
readln(a);
writeln('������� n');
readln(n);
c:=1;
for i:=0 to n do
begin
b:=(a-i*n);
c:=c*b;
if(i=n) then writeln(c);
end;
end.