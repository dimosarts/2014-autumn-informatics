var s,k:string;
    i:integer;
begin
write('������� ������,���������� ������ "*":  '); read(s);

k:='';
for i:=1 to length(s) do
   if s[i]<>'*' then 
   k:=k+s[i]+s[i];
   
writeln('�������� ������ ����� ��������������:  ',k);
end.