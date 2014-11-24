program a2;
const n=10;
var a: array[1..n] of real;
    i,j,x:  integer;
    b:    boolean;
begin
b:=false;
for i:=1 to n do a[i]:=random(10-5);
for i:=1 to n do write(a[i],' ');
writeln;
for i:=1 to n-1 do
  begin
  for x:=i+1 to n do if a[x]=a[i] then b:=true;
  if not b then j:=j+1;
  b:=false;
  end;
writeln(j+1);
end.