program aa;{программа высчитывает корни уравнения}

var
  a, b, c: integer;
  D, x1, x2: real;
  label 1;
begin
  writeln('введите а');
  readln(a);
  writeln('введите b');
  readln(b);
  writeln('введите с');
  readln(c);
  writeln('ваше уравнение имеет вид : ', a, 'x^2+(', b, 'x)+(', c, ')=0');
  if a+b=0 then goto 1;
  D := b * b - 4 * a * c;
  if D < 0 then
    writeln('оно не имеет корней');
  if D > 0 then
  begin
    x1 := (-b + sqrt(D)) / 2;
    x2 := (-b - sqrt(D)) / 2;
    writeln('оно имеет два корня x1=', x1, '   x2=', x2);
  end;
  if D = 0 then
  begin
    x1 := (-b / 2);
    writeln('оно имеет один корень равный ', x1);
  end;
  1: if a+b=0 then writeln('нет корней или их бесконечно много');
end.