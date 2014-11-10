var
s:string;
k:integer;
begin
k:=1;
read(s);
while k>0 do
 begin
 k:=pos('..',s);
 delete(s,k,1);
 end;
writeln(s);
end.
