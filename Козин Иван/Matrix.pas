program var3number2;
var
  a:array [1..1024,1..1024] of integer;
  size,i,j,sum:integer;
begin
write('Введите рамеры квадратной матрицы: ');
readln(size);
writeln('Матрица: ');
for i:=1 to size do
  begin
  for j:=1 to size do
    begin
    a[i,j]:=random(100)-50;
    write(a[i,j],' ');
    if (i=1) or (j=1) or (i=size) or (j=size) then sum:=sum+a[i,j];
    end;
  writeln;
  end;
writeln('Сумма элементов по краям матрицы: ',sum);
end.