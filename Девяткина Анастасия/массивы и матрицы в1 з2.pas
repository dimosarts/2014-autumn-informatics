const
  n = 10;

type
  m = array[1..n, 1..n] of integer; 

var
  i, j, min: integer;
  a: m;

begin
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      a[i, j] := random(75) - 25;
      write(a[i, j]:10);
    end;
    writeln;
  end;
  min := a[1, 1];
  for i := 1 to n do 
  begin
    for j := 1 to n do 
      if a[i, j] < min then min := a[i, j];
  end;
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      if a[i, j] = min then 
        writeln('элемент матрицы а[', i, ',', j, ']=', min, ' является минимальным');
    end;
  end;
end.