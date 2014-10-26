program var3num3;
const
  n=8;
var
  a,b,x,y:integer;
begin
writeln('Координаты по вертикали и по горизонтали обозначаются цифрами, от 1 до 8. Например, поле D2 вводить как 4 2');
write('Введите координаты поля 1: ');
readln(a,b);
write('Введите координаты поля 2: ');
readln(x,y);
if (a>8) or (b>8) or (x>8) or (y>8) or (a<=0) or (b<=0) or (x<=0) or (y<=0) then writeln('Ваш король сбежал с поля боя!')
else
  begin
  if (a=x) and (b=y) then writeln('Король остался на месте')
  else
    begin
    if (abs(a-x)<=1) and (abs(b-y)<=1) then writeln('Король перейдет на поле 2')
    else writeln('Король не перейдет на поле 2');
    end;
  end;
write('Программа завершена, для выхода нажмите Enter...');
readln;
end.