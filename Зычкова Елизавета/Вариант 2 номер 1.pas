var s:string;
    i:integer;
begin
write('������� ������,���������� ������ "*":  '); read(s);

for i:=length(s) downto 1 do
   if s[i]='*' then delete(s,i,1)
   else insert(s[i],s,i);

writeln('�������� ������ ����� ��������������:  ',s);
end.