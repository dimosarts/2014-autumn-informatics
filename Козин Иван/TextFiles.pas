program textfiles;
procedure yrsearch(f:textfile;year:integer);
  var
    s,s1,s2:string;
    n1,l,k,i:integer;
    found:boolean;
  begin
  writeln('Ñïèñîê àâòîìîáèëåé, óäîâëåòâîðÿþùèõ óñëîâèþ:');
  while not eof(f) do
    begin
    readln(f, s);
      l:=length(s);
      i:=1;
      while s[i]<>' ' do
        begin
        i:=i+1;
        end;
      s1:=copy(s, l-4, l);
      s2:=copy(s, i+1, l-(5+i));
      val(s1,n1,k);
      if n1>=year then
        begin
        writeln(s2);
        found:=true;
        end;
    end;
    if not found then write('Íå íàéäåíî òàêèõ àâòîìîáèëåé.');
 end;
procedure cardel(f:textfile;s:string);
  var
    temp:textfile;
    str,s1:string;
    found:boolean;
    j,l:integer;
  begin
  assign(temp, 'C:\Users\k01-221\temp.txt');
  rewrite(temp);
  found:=false;
  while not eof(f) do
    begin
    readln(f,str);
    l:=length(str);
    j:=1;
    while str[j]<>' ' do
      begin
      j:=j+1;
      end;
    s1:=copy(str,j+1,6);
    if s1=s then found:=true
    else writeln(temp,str);
    end;
  if found=false then writeln('Íå íàéäåíî òàêèõ àâòîìîáèëåé.');
  close(f);
  close(temp);
  rewrite(f);
  reset(temp);
  while not eof(temp) do
    begin
    readln(temp,str);
    writeln(f,str);
    end;
  close(temp);
  erase(temp);
  end;
function exitcall(p:integer):boolean;
  begin
  writeln('Îïåðàöèÿ çàâåðøåíà. Âûéòè èç ïðîãðàììû?');
  writeln('1 - Äà, âûéòè');
  writeln('2 - Íåò, âåðíóòüñÿ â ìåíþ');
  readln(p);
    repeat
    if p=1 then exitcall:=true
    else if p=2 then exitcall:=false
    else writeln('Äåéñòâèå íå âûáðàíî');
    until (p=1) or (p=2);
  end;
var
  f:textfile;
  purpose,year,p:integer;
  s,stand:string;
  ext:boolean;
begin
assign(f, 'C:\Users\k01-221\carlist.txt');
repeat
writeln('×òî íóæíî ñäåëàòü ñ ôàéëîì?');
writeln('1 - Íàéòè àâòîìîáèëè, âûïóùåííûå íå ïîçäíåå îïðåäåëåííîãî ãîäà');
writeln('2 - Äîáàâèòü àâòîìîáèëü');
writeln('3 - Óäàëèòü àâòîìîáèëü');
writeln('4 - Âûõîä èç ïðîãðàììû');
readln(purpose);
stand:='ÌÀÐÊÀ ÍÎÌÅÐ ÔÀÌÈËÈß_ÂËÀÄÅËÜÖÀ ÃÎÄ_ÂÛÏÓÑÊÀ';
if purpose=1 then
  begin
  reset(f);
  writeln('Ââåäèòå äàòó, íå ïîçäíåå êîòîðîé äîëæåí áûòü âûïóùåí àâòîìîáèëü: ');
  readln(year);
  yrsearch(f,year);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=2 then
  begin
  writeln('Ââåäèòå íîâûé àâòîìîáèëü â ôîðìàòå:',stand);
  readln(s);
  append(f);
  writeln(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=3 then
  begin
  reset(f);
  writeln('Ââåäèòå àâòîìîáèëü, êîòîðûé íóæíî óäàëèòü, â ôîðìàòå:',stand);
  readln(s);
  cardel(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=4 then
  begin
  exit;
  end
else writeln('Äåéñòâèå íå âûáðàíî.');
until ext=true;
end.
