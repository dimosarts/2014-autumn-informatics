program n3_po_fay;
const n=510;
var i:             integer;
    f:             text;
    c:             char;
    s:             string;
    a:             array [1..n] of integer;
    b:             array [1..n] of string;
begin
assign(f, 'debfile.txt');   //�������� ���������� ����
rewrite(f);
for i:=1 to n do
  begin
  write(f,chr(random(97,122)),chr(random(97,122)));
  if random>0.66 then write(f,', ') else write(f,' ');
  end;
close(f);     //������
reset(f);
while not eof(f) do 
  s:='';    
  begin                         //�� ������
  while (not eof(f)) or (c<>' ') do  //����� �����
    begin
    read(f,c);
    if c=',' then continue;
    s:=s+c;
    writeln(s);
    writeln;
    end;          //����� �����
  i:=1;
  while 1=1 do
    begin         //�������� ������
    if b[i]=s then
      begin       //�������� �� ����������
      a[i]:=a[i]+1;
      break;
      end         //��������� �� ����������
              else
      begin
      if a[i]=0 then
        begin     //�������� �� ����������
        b[i]:=s;
        break;
        end;      //��������� �� ����������
     end;
     i:=i+1;
     end;        //��������� ������
  end;          //�� �����
for i:=1 to n do write(a[i]:3);
writeln;
i:=1;
while b[i]<>'' do
  begin
  write(b[i]:4);
  i:=i+1;
  end;
end.