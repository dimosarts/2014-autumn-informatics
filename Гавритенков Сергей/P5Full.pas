uses sysutils;
var s:string;
procedure filegen;
  var f:file of integer;
    i,a:integer;
  begin
  assign(f,'f.txt');
  rewrite(f);
  for i:=0 to (random(20)+1)*5-1 do
    begin
    if i mod 20 < 10
      then a:=random(32000)-32000
      else a:=random(32000);
    if a=0 then inc(a);
    write(f,a);
    end;
  close(f);
  writeln('������஢�� 䠩� f.txt, �ᥣ� ����⮢ - ',i+1);
  end;
procedure fileread(var s:string);
  var f:file of integer;
    i,a:integer;
  begin
  assign(f,s);
  reset(f);
  while eof(f)=false do
    begin
    read(f,a);
    writeln(a);
    end;
  close(f);
  writeln('�⥭�� 䠩�� �����襭�');
  end;
procedure fileproc;
  var f,g:file of integer;
    i,a:integer;
  begin
  assign(f,'f.txt');
  reset(f);
  i:=0;
  assign(g,'g.txt');
  rewrite(g);
  while eof(f)=false do
    begin
    read(f,a);
    if (i mod 20>4) and (i mod 20<15)
    then
      if i mod 20<10
      then
        begin
        seek(g,i+5);
        write(g,a);
        end
      else
        begin
        seek(g,i-5);
        write(g,a);
        end
    else
      begin
      seek(g,i);
      write(g,a);
      end;
    inc(i);
    end;
  close(f);
  close(g);
  writeln('����� 䠩�� f.txt ��ࠡ�⠭�. ���� 䠩� g.txt');
  end;

begin
randomize();
writeln('�������� �����');
Writeln('�������: file gen, file read, file proc');
readln(s);
if s='file gen'
then
  filegen
else if s='file read'
then
  begin
  writeln('����?');
  readln(s);
  if fileexists(s)=false
  then
    writeln('�� ⠪�� 䠩�')
  else
    fileread(s);
  end
else if s='file proc'
then
  fileproc
else
  writeln('�������⭠� �������');
writeln('��� �����襭�� ������ ���, � ��砥 ����室����� ��१������ �ணࠬ��');
readln();
end.
