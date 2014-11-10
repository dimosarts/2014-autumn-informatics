program Stroka;

var
  i,  j, f, n: integer;
  s, s1: string;

begin
  i := 1;
  j := 1;
  Writeln('Введите строку символов,содержащую восклицательные знаки');
  readln(s);
  n := length(s);
  s1 := '!';
  
  while i <= n do
  begin
    if s[i] = s1 then
    begin
      f := i;
      writeln('В данной строке действительно присутствует восклицательный знак');
      break;
    end;
    
    if i = n then 
    begin
      writeln('В данной строке не присутсвуют восклицательные знаки');
      break;
    end;
    i := i + 1;
    
  end;
  while j <= f - 1 do
  begin
    if s[j] = s[j + 1] then
    begin
      writeln('среди символов, предшествующих первому восклицатель¬ному знаку,есть пара соседствующих одинаковых символов');
      writeln(s[j], s[j + 1]);
      break;
    end;  
    j := j + 1;
  end;
  if j = f then writeln('среди символов, предшествующих первому восклицатель¬ному знаку,нет пары соседствующих одинаковых символов');
  
end.