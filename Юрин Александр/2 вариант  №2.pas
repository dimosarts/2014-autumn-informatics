const n=3;
var a:array [1..n,1..n]of integer;
i,j,min,max:integer;
begin
randomize;
writeln('элементы матрицы ');
for i:=1 to n do begin
for j:=1 to n do begin 
a[i,j]:=random(100);
end;
end;
for i:=1 to n do begin
for j:=1 to n do
write (a[i,j], ' ');
writeln;
end;
 min:=a[1,1];
 max:=a[1,1];
for i:=1 to n do 
 begin
 min:=a[i,1];
 for j:=1 to n do 
  begin
  if (a[i,j]<min) then min:=a[i,j] 
  end; 
  if min>max then  max:=min; 
 end;
  writeln('максимальный элемент из минимальных элементов строки',' ',max);
  end.
   