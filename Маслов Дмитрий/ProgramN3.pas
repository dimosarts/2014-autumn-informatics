program n3;

const
  m = 10;

type
  mas = array[1..m, 1..m] of real;

var
  a: mas;
  i, j, k, sum1, sum2, sum3, sum4, sum: integer;






begin
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
  for i := 1 to m do
  begin
    sum1 := sum1 + a[i, 1];
  end;
  for j := 1 to m do
  begin
    sum2 := sum2 + a[1, j];
  end;
  for i := 1 to m do
  begin
    sum3 := sum3 + a[i, m];
  end;
  for j := 1 to m do
  begin
    sum4 := sum4 + a[m, j];
  end;
  sum := sum1 + sum2 + sum3 + sum4 - a[1, 1] - a[1, m] - a[m, 1] - a[m, m];
  writeln(sum);
end.