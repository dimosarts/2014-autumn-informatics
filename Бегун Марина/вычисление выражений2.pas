const n=10;
var T: array[1..n] of integer;
i:integer;
begin
Writeln('введите последовательность чисел');
for i:=1 to n do read(T[i]);
Writeln('Ответ:');
for i:=1 to n do
if (T[i]mod 3=0) and ((T[i] div 3)mod 2 <>
0) then writeln(T[i]);
end.