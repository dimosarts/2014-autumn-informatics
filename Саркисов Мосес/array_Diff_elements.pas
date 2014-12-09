program a2;
const n=10;
var a: array[1..n] of real;
    i,j,x:  integer;
    last_occurrence:    boolean;
begin
for i:=1 to n do a[i]:=random(10-5);
for i:=1 to n do write(a[i],' ');
writeln;
for i:=1 to n-1 do
  begin
  for x:=i+1 to n do if a[x]=a[i] then last_occurrence:=true;
  if not last_occurrence then j:=j+1;
  last_occurrence:=false;
  end;
writeln(j+1);
end.