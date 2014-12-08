program var10;
var
  str:string;
  l,k,i,del:integer;
begin
write('Введите строку символов, в которой есть хотя бы одна точка: ');
readln(str);
l:=length(str);
k:=1;
while str[k]<>'.' do
  begin
  if str[k]=',' then
    begin
    delete(str,k,1);
    del:=del+1;
    k:=k-1;
    end;
  k:=k+1;
  end;
for i:=(k) to (l-del) do
  begin
  if str[i]='3' then str[i]:='+';
  end;
writeln('Полученная строка: ',str);
writeln('Для выхода из программы нажмите клавишу Enter...');
readln;
end.
