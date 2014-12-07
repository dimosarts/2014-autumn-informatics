const n=5;
type mass=array[1..N,1..N] of integer;
var a:mass;
    i,j,max,min:integer;
    
begin

write('Исходный массив:');
writeln;

for i:=1 to N do 
begin
  for j:=1 to N do
    begin
    a[i,j]:=random(100)-50;
    write (a[i,j]:3,' ');
    end;
  writeln;
end;

max:=-50;
min:=50;

for i:=1 to N do 
begin
   for j:=1 to N do 
     begin
     if a[i,j]<min then min:=a[i,j];
     end;
   if min>max then max:=min;
   min:=50;
end;

writeln('Максимальный элемент из множества минимальных элементов каждой строки: ',max);

end.