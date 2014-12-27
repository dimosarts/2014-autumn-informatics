uses Timers;

var
  S: String;
  I, P, x: Integer;

begin
  WriteLn('Vvedite stroku:');
  ReadLn(S);

    var start:=System.DateTime.Now;

  for x := 1 to 1000000000 do
  p:=0;
  For I:= Length(S) downto 1 do
  If S[I] = ',' then begin p:=I; break;  end;
  WriteLn('Poziciya poslednei zapyatoi:', P);

    var finish:=System.DateTime.Now;
    writeln((finish-start).TotalMilliseconds);
end.