program text;
procedure yrsearch(f:textfile;year:integer);
  var
    s,s1,s2:string;
    n1,l,k,i:integer;
    found:boolean;
  begin
  writeln('������ �����������, ��������������� �������:');
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
    if not found then write('�� ������� ����� �����������.');
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
  if found=false then writeln('�� ������� ����� �����������.');
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
  writeln('�������� ���������. ����� �� ���������?');
  writeln('1 - ��, �����');
  writeln('2 - ���, ��������� � ����');
  readln(p);
    repeat
    if p=1 then exitcall:=true
    else if p=2 then exitcall:=false
    else writeln('�������� �� �������');
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
writeln('��� ����� ������� � ������?');
writeln('1 - ����� ����������, ���������� �� ������� ������������� ����');
writeln('2 - �������� ����������');
writeln('3 - ������� ����������');
writeln('4 - ����� �� ���������');
readln(purpose);
stand:='����� ����� �������_��������� ���_�������';
if purpose=1 then
  begin
  reset(f);
  writeln('������� ����, �� ������� ������� ������ ���� ������� ����������: ');
  readln(year);
  yrsearch(f,year);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=2 then
  begin
  writeln('������� ����� ���������� � �������:',stand);
  readln(s);
  append(f);
  writeln(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=3 then
  begin
  reset(f);
  writeln('������� ����������, ������� ����� �������, � �������:',stand);
  readln(s);
  cardel(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=4 then
  begin
  exit;
  end
else writeln('�������� �� �������.');
until ext=true;
end.