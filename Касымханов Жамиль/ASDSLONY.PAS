var a1,b1,a2,b2,x,y:integer;
begin
 writeln('vvedite koordinaty polya 1');
 readln(a1,b1);
 writeln('vvedite koordinaty polya 2');
 readln(a2,b2);
 if ((a1>8) or (b1>8) or (a2>8) or (b2>8) or (a1<0) or (b1<0) or (a2<0) or (b2<0)) then writeln('vvedite vernye koordinaty')
 else
 begin
  x:=abs(a2-a1);
  y:=abs(b2-b1);
  if (x=y) then writeln('slon mojet pereiti iz polya 1 v pole 2')
  else
  writeln('slon ne mojet pereiti iz polya v polya v 2');
  end;
readln
end.