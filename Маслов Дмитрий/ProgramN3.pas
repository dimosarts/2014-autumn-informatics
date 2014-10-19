program n3;

const
  m = 10;

type
  mas = array[1..m, 1..m] of integer;//ffff

var
  a: mas;
  i, j, k, sum1, sum2, sum3, sum4, sum: integer;







begin
  writeln('¬ведите диапазон чисел в массиве');
  readln(k);
  randomize;
  for i := 1 to m do
  begin
    for j := 1 to m do
      a[i, j] := random(k);
  end;
  for i := 1 to m do
  begin
    for j := 1 to m do
      write(a[i, j]:5);
    writeln(' ');
  end;
  for i := 2 to m do
  begin
    sum := sum + a[i, 1];
  end;
  for j := 1 to m do
  begin
    sum := sum + a[1, j];
  end;
  for i := 2 to m do
  begin
    sum := sum + a[i, m];
  end;
  for j := 2 to m-1 do
  begin
    sum := sum + a[m, j];
  end;
    writeln(sum);
end.