Type 
rec=record
avtor:string [20];
name:string [50];
god:string[10]
end;
var 
f1:file of rec;
b:rec;
n,i:integer;
begin
assign (f1,'f.txt');
rewrite (f1);
readln(n);
for i:=1 to n do begin
writeln('������� ������� ������');
readln(b.avtor);
writeln('������� �������� ������������');
readln(b.name);

writeln('������� ��� �������');
readln(b.god);
write(f1,b);
end;
close(f1);
end.