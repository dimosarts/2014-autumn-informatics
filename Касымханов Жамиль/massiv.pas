const
  nmax=100;
var
  a: array[1..nmax] of integer;
  i,n,c: integer;
begin
  repeat
    write('Vvedite chislo n (razmer massiva): ');
    readln(n);
  until n>0;
  for i:=1 to n do
  begin
    write('Vvedite ',i,'element massiva: ');
    readln(a[i]);
  end;
  c:=0;
  for i:=1 to n div 2 do
  if a[i]<>a[n+1-i] then c:=1;
  if c=0 then writeln('Massiv yavlyaetsya palindromom')
  else writeln('Massiv ne yavlyaetsya palindromom');
  readln;
end.