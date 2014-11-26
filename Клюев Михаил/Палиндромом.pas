program z1;

const n=10;
var k:boolean;
    i:integer;
    a:array[1..n]of integer;
begin
  writeln('massiv wedi');
  writeln(' wedi elementi massiva');
  k:=false;
  for i:=1 to n do begin 
    a[i]:=random(200)-100;
    write(a[i]:3);
    end;
  writeln;
  for i:=1 to n div 2 do
    if a[i]<>a[n+1-i] 
      then 
        begin
        k:=true;
        break
        end;
  if k=false 
    then writeln('polidrom')
    else writeln('ne polidrom');
end.