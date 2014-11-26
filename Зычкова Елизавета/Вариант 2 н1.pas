var s,k:string;
    i:integer;
begin
write('Введите строку,содержащую символ "*":  '); read(s);

k:='';
for i:=1 to length(s) do
   if s[i]<>'*' then 
   k:=k+s[i]+s[i];
   
writeln('Исходная строка после преобразования:  ',k);
end.