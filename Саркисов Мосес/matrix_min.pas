program matrix;
const
  n=10;
var
  i,j:  integer;
  mtrx: array[1..n,1..n] of real;
  min:  real;
begin
  for i:=1 to n do for j:=1 to n do mtrx[i,j]:=trunc((random-0.5)*100)/10;
  for i:=1 to n do
    begin
    for j:=1 to n do write(mtrx[i,j]: 4,'    ');
    writeln; writeln;
    end;
  writeln; writeln; writeln;
  min:=mtrx[1,1];
  for i:=1 to n do for j:=1 to n do if mtrx[i,j]<min then min:=mtrx[i,j];
  writeln('Минимальный элемент равен ',min,'.');
  for i:=1 to n do for j:=1 to n do if mtrx[i,j]=min then write('(',i,',',j,')    ');
end.