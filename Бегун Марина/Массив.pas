Const N=10;
Var A: array [1..N] of integer;
i,j:integer;
begin
Writeln('Введите значения элементов массива');
for i:=1 to N do readln(A[i]);
for i:=1 to N do begin
  j:=N-i+1;
  if A[i]<>A[j] then break;
end;
if i=N then writeln('Массив является палиндромом')
else writeln('Массив не является палиндромом');
end.  