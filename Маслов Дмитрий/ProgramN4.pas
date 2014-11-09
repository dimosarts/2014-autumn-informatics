program n4;

const
  m = 10;

type
  mas = array[1..m] of integer;//fff

var
  i, k, l, c: integer;
  a: mas;

begin
  
  c := 0;
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
  for i := 1 to m div 2 do
  begin
    if a[i] <> a[m - i + 1] then
      c := c + 1;
  end;
  
  if c > 0 then writeln('Данный массив-не палиндром')
  else writeln('Данный массив-палиндром');
end.