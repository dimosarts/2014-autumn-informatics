uses crt;
var b:array[0..17, 0..17] of byte;
    i,j,n:byte;
begin
n:=random(15)+2;
for i:=1 to n do
  b[1,i]:=random(256);
  
for i:=2 to n do
  for j:=1 to n do
    if j=n then b[i,j]:=b[i-1,1] else b[i,j]:=b[i-1,j+1];
  
for i:=1 to n do
  begin
  write ('| ');
  for j:=1 to n do
    begin
    write (b[i,j],' ');
    if b[i,j]<100 then write (' ');
    if b[i,j]<10 then write (' ');
    end;
  writeln(' |');
  end;
end.