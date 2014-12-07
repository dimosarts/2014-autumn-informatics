uses crt;
var f,g,h:file of integer;
    n,a,i:integer;

begin
clrscr;
assign(f,'f.txt');
rewrite(f);

write('Введите кол-во чисел в исходном файле: ');
readln(n);

for i:=1 to n do
   begin
   a:=random(100)-50;
   write(f,a);
   end;

write('Исходный файл: ');
reset(f);
while not eof(f) do
    begin
    read(f,a);
    write(a,' ');
    end;

close(f);

assign(g,'g.txt');
assign(h,'h.txt');
rewrite(g);
rewrite(h);

reset(f);
while not eof(f) do
    begin
    read(f,a);
    if a mod 2=0 then
    write(h,a)
    else write(g,a);
    end;
        
writeln;
write('Файл g, содержащий нечетные числа: ');
reset(g);
while not eof(g) do
    begin
    read(g,a);
    write(a,' ');
    end;

writeln;
write('Файл h, содержащий четные числа: ');
reset(h);
while not eof(h) do
    begin
    read(h,a);
    write(a,' ');
    end;
    
close(f);
close(g);
close(h);

end.