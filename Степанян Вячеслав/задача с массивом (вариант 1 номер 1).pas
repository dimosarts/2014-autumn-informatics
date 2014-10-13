const N=10;
var
    A: array [1..N] of integer;
    i, j, k: integer;
    f: boolean;
begin
 writeln ('введите эллементы массива');
 for i:=1 to N do 
   readln (A[i]);
 k:=1;
 f:=true;
 for i:=2 to N do begin
   for j:=1 to (i-1) do 
     if A[i]=A[j] then 
       f:=false;
   if f=true then 
     k2:=k+1;
   f:=true;
 end;
 writeln ('кол-во различных элементов массива:');
 writeln (k);
end. 
