Const N=5;
var T: array [1..100,1..100] of integer;
S: array [1..100] of integer;
i, j, A: integer;
begin
Writeln('Введите элементы массива');
for i:=1 to N do 
 for j:=1 to N do readln(T[i,j]);
For i:=1 to N do begin
 S[i]:=T[i,1];
 for j:=1 to N do 
 if T[i,j]<S[i] then S[i]:=T[i,j];
 end;
A:=S[1];
For i:=1 to N do
 if S[i]>A then A:=S[i];
Writeln('Максимальный элемент массива из множества минимальных элементов строк=',A);
end.
