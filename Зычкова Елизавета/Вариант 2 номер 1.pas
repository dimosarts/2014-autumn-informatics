var s:string;
    i:integer;
begin
write('Введите строку,содержащую символ "*":  '); read(s);

for i:=length(s) downto 1 do
   if s[i]='*' then delete(s,i,1)
   else insert(s[i],s,i);

writeln('Исходная строка после преобразования:  ',s);
end.