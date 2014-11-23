program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

label M;

var

  A: array [1..2] of Integer;
  S: String;
  I, L: Integer;

begin
  WriteLn('Введите строку:');
  ReadLn(S);
  for I := 1 to Length(S)  do
    if Ord(S[I]) = 58  then
      begin
        L := L + 1;
        A[L] := I;
      end;
  if L = 0  then
    begin
      WriteLn('В строке нет двоеточий');
      goto M;
    end;
  if L = 1  then
    for I := A[1]+1 to Length(S) do
      Write(S[I]);
  if L = 2  then
    for I:= A[1]+1 to A[2]-1 do
      Write(S[I]);
  M:
  ReadLn;

  { TODO -oUser -cConsole Main : Insert code here }
end.
