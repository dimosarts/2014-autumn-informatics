program Stroka;

var
  i,  j, f, n: integer;
  s, s1: string;

begin
  i := 1;
  j := 1;
  Writeln('������� ������ ��������,���������� ��������������� �����');
  readln(s);
  n := length(s);
  s1 := '!';
  
  while i <= n do
  begin
    if s[i] = s1 then
    begin
      f := i;
      writeln('� ������ ������ ������������� ������������ ��������������� ����');
      break;
    end;
    
    if i = n then 
    begin
      writeln('� ������ ������ �� ����������� ��������������� �����');
      break;
    end;
    i := i + 1;
    
  end;
  while j <= f - 1 do
  begin
    if s[j] = s[j + 1] then
    begin
      writeln('����� ��������, �������������� ������� ����������������� �����,���� ���� ������������� ���������� ��������');
      writeln(s[j], s[j + 1]);
      break;
    end;  
    j := j + 1;
  end;
  if j = f then writeln('����� ��������, �������������� ������� ����������������� �����,��� ���� ������������� ���������� ��������');
  
end.