var
  S: String;
  I, P: Integer;
begin
  WriteLn('Введите строку:');
  ReadLn(S);
  for I:=1 to Length(S) do
    if Ord(S[I]) = 44 then
      P := I;
  WriteLn('Позиция последней запятой:', P);
  ReadLn;
end.