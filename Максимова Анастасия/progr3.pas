var
  s: string; i, k, j: byte;

begin
  writeln('vvedite stroku');
  readln(s);
  i := 0;
  repeat
    i := i + 1;
  until s[i] = ':';
  k := i;
  repeat
    i := i + 1;
  until (s[i] = ':') or (i = length(s) + 1);
  if (i - 1) = length(s) then writeln('simvoly posle pervogo dvoetochia i do konca stroki') 
  else writeln('simvoly posle pervogo dvoetochia i do vtorogo dvoetochia');
  for j := k + 1 to i - 1 do
    write(s[j]);
end.