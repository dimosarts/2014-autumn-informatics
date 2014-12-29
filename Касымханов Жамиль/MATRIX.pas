program ololo;

var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
{randomize;
L:=random(10); 
   FOR I := 1 to L do
      A[I] := random(10);
     begin
   FOR I := 1 to L do
       Write(A[I],' ');
          Writeln; end;}
  WriteLn('Vvedite razmernost');
  ReadLn(L);
  WriteLn('Vvedite matricu');
  S := 0;
  for I := 1 to L do
    for J := 1 to L do
    begin
      Read(A[I, J]);

      S := S + A[I, J];

      S := S + A[I, J]; 

    end;
  ReadLn;
  for I := 2 to L-1 do
     for J := 2 to L-1 do
      S := S - A[I, J];
  WriteLn('Summa: ',S);

  readln;


end.
