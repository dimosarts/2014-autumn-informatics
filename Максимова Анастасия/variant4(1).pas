var
  a, b, c: real;

begin
writeln('kolichestvo korney v uravnenii a*x*x+b*x+c=0');
writeln('vvedite a,b,c');
  readln(a, b, c);
  if (a = 0) and (b = 0) then begin
    if c = 0 then writeln('beskonecno mnogo korney')
    else writeln('korney net')
  end
  else 
  if a = 0 then writeln('1 koren')
  else 
  if (b * b - 4 * a * c) > 0 then writeln('2 kornya')
  else 
  if (b * b - 4 * a * c) = 0 then writeln('1 koren')
  else writeln('korney net');
  readln();
end.