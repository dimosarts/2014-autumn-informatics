program var3num3;
const
  n=8;
var
  a,b,x,y:integer;
begin
writeln('���������� �� ��������� � �� ����������� ������������ �������, �� 1 �� 8. ��������, ���� D2 ������� ��� 4 2');
write('������� ���������� ���� 1: ');
readln(a,b);
write('������� ���������� ���� 2: ');
readln(x,y);
if (a>8) or (b>8) or (x>8) or (y>8) or (a<=0) or (b<=0) or (x<=0) or (y<=0) then writeln('��� ������ ������ � ���� ���!')
else
  begin
  if (a=x) and (b=y) then writeln('������ ������� �� �����')
  else
    begin
    if (abs(a-x)<=1) and (abs(b-y)<=1) then writeln('������ �������� �� ���� 2')
    else writeln('������ �� �������� �� ���� 2');
    end;
  end;
write('��������� ���������, ��� ������ ������� Enter...');
readln;
end.