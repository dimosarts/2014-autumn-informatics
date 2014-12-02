const N=10;
type mas=array[1..N] of integer;
var a:mas;
    i,k:integer;
begin

writeln('Введите элементы массива:');
for i:=1 to N do
   begin
   read(a[i]);
   end;
   
k:=0;
i:=1;
repeat
   if a[i]<>a[N-i+1] then
   k:=1;
   i:=i+1;
until (k=1) or (i=n div 2);
 
if k=0 then 
   writeln('Массив является палиндромом')
else 
   writeln('Массив не является палиндромом');

end.