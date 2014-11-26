program vych2;
var i,x,res:  real;
begin
    read(x);
    i:=1; res:=1;
    while i<=63 do
      begin
      res:=res/(x-i);
      i:=i+2;
      end;    
    i:=2;
    while i<=64 do
      begin
      res:=res*(x-i);
      i:=i+2;
      end;
   writeln(res);
end.