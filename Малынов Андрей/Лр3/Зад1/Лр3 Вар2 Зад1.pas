program slon;
var  n,k: integer;
s,s1 : string;  {s1-�������� ������ s-�������� ����������� ������ �����������}
begin
  writeln('������� ������');
  readln(s);
  writeln('�� �������������� ',s);
  n := Length(s);
  writeln ('����� ',n);
  s1:='';
  for var i:=1 to n do begin
  if s[i]<>'*' then 
  s1:=s1+s[i]+s[i];
  end;
  if (s1='') then writeln('���������� ������ �� �������� ���������')
  else begin
  writeln ('����� �������������� ',s1);
  k:=Length(s1);
  writeln ('����� ',k);
  end;
  end.
  
  
 