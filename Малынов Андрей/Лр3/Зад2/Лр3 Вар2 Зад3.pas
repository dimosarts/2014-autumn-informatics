var
h,k: integer;
F1, F2: text;
a: array[1..100] of integer;
b: array[1..100] of integer;
begin
assign(F1,'F1.txt');
assign(F2,'F2.txt');
reset(F1);reset(F2);
read(F1,a); read(F2,b);
write(a+b);
end.