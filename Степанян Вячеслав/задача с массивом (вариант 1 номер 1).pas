const N=10;
var
    A: array [1..N] of integer;
    i, j, k, f: integer;
begin
 writeln ('введите эллементы массива');
 for i:=1 to N do 
   readln (A[i]);
 k:=1;
 f:=0;
 for i:=2 to N do begin
   for j:=1 to (i-1) do 
     if A[i]<>A[j] then 
       f:=f+1;
   if f=i-1 then 
     k:=k+1;
   f:=0;
 end;
 writeln ('кол-во различных элементов массива:');
 writeln (k);
end. 