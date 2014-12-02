program n1;

const
  n = 8;

var
  a, b, a1, b1, sum1, sum2: integer;


begin
  writeln('Введите целочисленные координаты поля 1(Напоминание:Размер поля- 8x8)');
  readln(a, b);
  writeln('Введите целочисленные координаты поля 2(Напоминание:Размер поля- 8x8)');
  readln(a1, b1);
  if ((a > 8) or (b > 8) or (a1 > 8) or (b1 > 8) or (a < 0) or (b < 0) or (a1 < 0) or (b1 < 0)) then 
    writeln('Введеные координаты не соответствуют размерам шахматного стола.')
  else
  begin
    sum1 := abs(a1 - a);
    sum2 := abs(b1 - b);
    if (sum1 = sum2) then writeln('Слон может перейти из поля 1 в поле 2')
    else
      writeln('Слон не может перейти из поля 1 в поле 2');
  end;
end.