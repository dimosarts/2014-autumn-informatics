var
x1, x2, y1, y2:integer;
begin
writeln ('������� ���������� ���������� ��������� �����');
read (x1); 
read (y1);  
writeln ('������� ���������� ��������� ��������� �����');
read (x2);
read (y2);
if (x1=x2) or (y1=y2)
  then writeln ('����� ����� ������� ����� ���')
  else writeln ('����� �� ����� ������� ����� ���')
end.