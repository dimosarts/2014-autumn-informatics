program matrix;
var
  a:array [1..1024,1..1024] of integer;
  size,i,j,sum:integer;
begin
write('Ââåäèòå ðàìåðû êâàäðàòíîé ìàòðèöû: ');
readln(size);
writeln('Ìàòðèöà: ');
for i:=1 to size do
  begin
  for j:=1 to size do
    begin
    a[i,j]:=random(100)-50;
    write(a[i,j],' ');
    if (i=1) or (j=1) or (i=size) or (j=size) then sum:=sum+a[i,j];
    end;
  writeln;
  end;
writeln('Ñóììà ýëåìåíòîâ ïî êðàÿì ìàòðèöû: ',sum);
end.
