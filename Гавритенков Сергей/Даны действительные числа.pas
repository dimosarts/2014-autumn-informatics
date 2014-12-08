var
a,b,c,d:real;
  begin
  read(a,b,c,d);
  if (a<=b) and (b<=c) and (c<=d) then
    begin
    b:=a*a;c:a*a;d:=a*a;a:a*a;
    writeln(a,b,c,d);
    end
  else
  writln(a,b,c,d);
  end.
 
