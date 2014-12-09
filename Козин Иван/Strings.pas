program strings;
var
  str:string;
  l,k,i,del:integer;
begin
write('Ââåäèòå ñòðîêó ñèìâîëîâ, â êîòîðîé åñòü õîòÿ áû îäíà òî÷êà: ');
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
writeln('Ïîëó÷åííàÿ ñòðîêà: ',str);
writeln('Äëÿ âûõîäà èç ïðîãðàììû íàæìèòå êëàâèøó Enter...');
readln;
end.
