program arrays1;
var
  a,b:array [1..1024] of integer;
  i,j,n,ex,count,mostfreq,mfel,t:integer;
begin
write('Ââåäèòå ÷èñëî ýëåìåíòîâ ìàññèâà: ');
readln(n);
write('Ââåäèòå ýëåìåíòû ìàññèâà ïî âîçðàñòàíèþ: ');
for i:=1 to (n-1) do
  begin
  read(a[i]);
  write(', ');
  end;
readln(a[n]);
write('Ñàìûé ÷àñòî âñòðå÷àþùèéñÿ ýëåìåíò :');
for i:=1 to n do
  begin
  ex:=a[i];
  j:=i;
  while (a[j]=ex) do
    begin
    count:=count+1;
    j:=j+1;
    end;
  if count>mostfreq then
    begin
    mostfreq:=count;
    t:=1;
    b[t]:=ex;
    end
  else if count=mostfreq then
    begin
    t:=t+1;
    b[t]:=ex;
    end;
  count:=0;
  end;
for i:=1 to (t-1) do
  begin
  write(b[i],', ');
  end;
writeln(b[t]);
writeln('Äëÿ âûõîäà èç ïðîãðàììû íàæìèòå êëàâèøó Enter...');
readln;
end.
    
  
