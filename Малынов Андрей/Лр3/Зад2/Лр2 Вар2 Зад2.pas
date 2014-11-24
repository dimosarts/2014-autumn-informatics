var
a,b,c: text;
a1,b1,c1: string;
begin
assign(a,'a1.txt');
reset(a);
readln(a,a1);
writeln(a1);
assign(b,'b1.txt');
reset(b);
readln(b,b1);
writeln(b1);
c1:=a1+b1;
assign(c,'ñ1.txt');
rewrite(c);
write(c,c1);
close(c);
end.
