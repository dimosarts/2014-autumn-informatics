var
  x, s, p: real; i: byte;

begin
writeln('vychislenie vyrazhenia 1+2*x+...+11*x^10');
writeln('vvedite x');
  readln(x);
  s := 1; p := 1;
  for i := 1 to 10 do 
  begin
    p := p * x;
    s := s + (i + 1) * p;
  end;
  writeln('znachenie:');
  writeln(s);
  readln();
end.