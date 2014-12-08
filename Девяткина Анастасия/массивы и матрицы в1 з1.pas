const
  n = 10;

var
  i, j, kol: integer;
  a: array[1..n] of integer;

begin
  Randomize;
  for i := 1 to n do 
  begin
    a[i] := Random(5);
    write(a[i], ' ');
  end;
  kol := n;
  for i := 1 to n - 1 do 
    for j := i + 1 to n do
      if a[i] = a[j] then begin
        kol := kol - 1; 
        break;
      end;
  writeln;
  writeln('Количество различных элементов в массиве ', kol);
end.