program vych2;
var i,x,res:  real;
begin
    read(x);
    i:=1; res:=1;
    while i<=32 do
      begin
      res:=res/(x-i)*(x-i-1);
      i:=i+2;
      end; 
   writeln(res);
end.