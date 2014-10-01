const n=100;
var a:array [1..n] of real;
 s,k:real;
 i:integer;
begin
 for i:=1 to n do begin
  a[i]:=random(10);
  write(a[i],' ');
  end;
 for i:=1 to n do
  begin
   if (a[i]=0) then
    s:=s+1
   else begin
   if (s>k) then
     k:=s;
    s:=0;
    end;
  end;
 if (s>k) then k:=s;
 writeln;
 writeln('результат ', k);
end.
 
