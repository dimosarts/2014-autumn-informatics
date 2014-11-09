program z2;
const n=10;
var 
    i,j,k,l:integer;
    a:array[1..n,1..n]of integer;
begin
Writeln('Матрица генерирутся...');
writeln('Поиск минимальных элементов строки матрицы...');
writeln('Поиск максимального элемента среди минимальных элементов строки матрицы...');
  k:=0;
  for i:=1 to n do 
    for j:=1 to n do 
      a[i,j]:=random(200)-100;
 { for i:=1 to n do begin 
 for j:=1 to n do
 write(a[i,j]:4);
 writeln;
end;}{check}
  for i:=1 to n do begin
   for l:=1 to n-1 do
    for j:=1 to n-l do begin
      if a[i,j]>a[i,j+1] 
        then begin
          k:=a[i,j];
          a[i,j]:=a[i,j+1];
          a[i,j+1]:=k;
          end;
    end;
  end;
  {for i:=1 to n do begin 
 for j:=1 to n do
 write(a[i,j]:4);
 writeln;
 end;
 writeln;}{check}
  for l:=1 to n-1 do
    for j:=1 to n-l do begin
      if a[j,1]>a[j+1,1] 
        then begin
          k:=a[j,1];
          a[j,1]:=a[1+j,1];
          a[j+1,1]:=k;
          end;
    end;
    Write('Элемент найден: ');
    write(a[n,1]);
end.