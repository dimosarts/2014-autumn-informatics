program Vy4_s_to4_do_eps;
var
  x,x1,x2,eps,k,sum    : real;
  function fact(k:real): real;
  var      i:            integer;
           r:            real;
    begin
    r:=1;
    for i:=1 to trunc(2*k+1) do r:=r*i;
    fact:=r;
    end;
begin
  x1:=0; x2:=1;
  k:=1;
  readln(x,eps);
  while abs(x2-x1)>eps do
    begin
    x1:=power(-1,k)/fact(k)*Power(x/3,4*k+2);
    k:=k+1;
    sum:=sum+x1;
    x2:=power(-1,k)/fact(k)*Power(x/3,4*k+2);
    end;
  writeln(sum);
end.