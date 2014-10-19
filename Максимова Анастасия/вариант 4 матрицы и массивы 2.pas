const
  lim = 100;

var
  a: array[1..lim, 1..lim] of integer;
  i, j, s, n, k: integer;

begin
  randomize;
  writeln('vvedite razmer kvadratnoy matricy');
  readln(n);
  s := 0;
  for j := 1 to n do 
  begin
    for i := 1 to n do 
    begin
      a[i, j] := random(100) - 50;
      write(a[i, j], '  ');
      if (i = j) or (j = n - i + 1) then s := s + a[i, j];
    end;
    writeln();
  end;
  if n mod 2 = 1 then begin
    k := (n div 2) + 1;
    s := s - a[k, k];
  end;
  writeln('summa', s);
end.