program n4;

const
  m = 10;

type
  mas = array[1..m] of integer;

var
  f,i, j, k, l: integer;
  a: mas;

begin
  l := 0;
  writeln('Введите диапазон чисел в массиве');
  readln(k);
  randomize;
  for i := 1 to m do
  begin
    a[i] := random(k);
  end;
  for i := 1 to m do
  begin
    write(a[i]:5);
    write(' ');
  end;
  for i := 1 to m  do
     begin
      if a[i] = a[m-i+1] then
        l := l + 1;
           end;
    writeln(l);
  if l< m then writeln('Данный массив-не палиндром')
  else writeln('Данный массив-палиндром');
  
end.