program var3num2;
var
  n,i,cr1,cr2,num:integer;
begin 
write('������� ���������� ��������� ������������������: ');
readln(n);
writeln('������� ',n,' ������ ������������������: ');
for i:=1 to n do
  begin
  readln(num);
  cr1:=num mod 3;
  if (cr1=0) then
    begin
    cr2:=num div 3;
    if (cr2 mod 2<>0) then writeln('����� ������������� ��������')
    else writeln('����� ��� ������� �� 3 ���� ������ �����');
    end
  else writeln('����� �� ������� �� 3');
  end;
write('��������� ���������, ��� ������ ������� Enter...');
readln;
end.