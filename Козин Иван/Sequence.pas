program var3num2;
var
  n,i,cr1,cr2,num:integer;
begin 
write('Введите количество элементов последовательности: ');
readln(n);
writeln('Введите ',n,' членов последовательности: ');
for i:=1 to n do
  begin
  readln(num);
  cr1:=num mod 3;
  if (cr1=0) then
    begin
    cr2:=num div 3;
    if (cr2 mod 2<>0) then writeln('Число удовлетворяет условиям')
    else writeln('Число при делении на 3 дает четное число');
    end
  else writeln('Число не делится на 3');
  end;
write('Программа завершена, для выхода нажмите Enter...');
readln;
end.