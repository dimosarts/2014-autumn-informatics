program n2;

var
  x, eps, x1, x2, sum: real;
  k: longint;

function fact(n: longint): longint;
begin
  if n = 1 then fact := 1
  else fact := fact(n - 1) * n;
end;

begin
  x1 := 0;
  x2 := 1;
  sum := 0;
  k:=0;
  writeln('Введите Х');
  readln(x);
  writeln('Введите Eps');
  readln(eps);
  while abs(x2 - x1) > eps do
  begin
    x1 := (power(-1, k) * power(x, 4 * k + 3)) / (fact(2 * k + 1) * (4 * k + 3));
    k := k + 1;
    sum := sum + x1;
    x2 := (power(-1, k) * power(x, 4 * k + 3)) / (fact(2 * k + 1) * (4 * k + 3));
  end;
  writeln(sum);
end.