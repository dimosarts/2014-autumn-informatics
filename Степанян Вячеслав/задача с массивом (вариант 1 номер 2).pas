const N=5;
var A: array [1..N,1..N] of integer;
    i, j, min: integer;
begin
  randomize;
  writeln ('элементы массива:');
  for i:=1 to N do 
  for j:=1 to N do
    A[i,j]:=random(100);     
     min:=A[1,1];
     A[2,3]:=A[1,1];
  for i:=1 to N do
   for j:=1 to N do 
    if A[i,j]<min then
      min:=A[i,j];
      for i:=1 to N do begin
       for j:=1 to N do
       write (A[i,j], ' ');
       writeln;
      end;
      writeln ('минимальный элемент массива:');
      writeln (min);
      writeln ('индексы элементов массива, равных минимальному');
  for i:=1 to N do 
   for j:=1 to N do    
     if A[i,j]=min then
      writeln (i,', ',j);
end.      