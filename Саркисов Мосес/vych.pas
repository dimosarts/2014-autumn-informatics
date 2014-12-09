program vych;
var i,n:  integer;
    x:    real:=1;
begin
  read(n);
  for i:=1 to n do x:=x*(1+1/(i*i));
  writeln(x);
end.