var
  i, n,j: integer;
   s0,s1 : string;

begin
  writeln('������� ������');
  readln(s0);
  n := Length(s0);
  writeln ('����� �������� ������ ����� ',n);
  s1:=' ';
  for i:=1 to n do begin
  if s0[i]<>'*' then 
  s1:=s1+s0[i]+s0[i];
  end;
  if (s1=' ') then writeln('���������� ������ �� �������� ���������')
  else begin
  writeln ('���������� ������ ����� ���', s1);
   j:=length (s1)-1;
  writeln ('����� ���������� ������ ', j);
  end;
  end.
  
  
 