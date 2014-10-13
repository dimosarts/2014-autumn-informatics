const n=10;
var a:array [1..n]of integer;
i,s:integer;
begin
 writeln('Введите массив из n чисел');
 for i:=1 to n do 
  read(a[i]);
 for i:=1 to ((n div 2) +1) do 
  if a[i]=a[n-i+1] then  s:=1
  else 
   begin
   s:=0;
   break;
   end;
 if (s=1) then
  writeln('Является палиндромом ') 
 else 
  writeln('Не является полиндромом ');
end.  
