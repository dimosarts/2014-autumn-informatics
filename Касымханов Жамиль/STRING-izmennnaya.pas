uses Timers;

var
  S: String;
  I, P, x, J, O, y: Integer;
  k, m, z: real;
begin
  WriteLn('Vvedite stroku:');
  Read(S);

    var start:=System.DateTime.Now;

  for x := 1 to 1000000000 do
  P:=0;
  For I:= Length(S) downto 1 do
      If S[I] = ',' then begin P:=I; break;  end;
  WriteLn('Poziciya poslednei zapyatoi: ', P);

    var finish:=System.DateTime.Now;
<<<<<<< HEAD
    writeln('Vremya s ciklom DOWNTO: ', (finish-start).TotalMilliseconds);
k:=((finish-start).TotalMilliseconds);

    var start1:=System.DateTime.Now;

  for y := 1 to 1000000000 do
  O:=0;
  for J:=1 to Length(S) do
      if S[J]=',' then O:= J;
  WriteLn('Poziciya poslednei zapyatoi: ', O);

    var finish1:=System.DateTime.Now;
    writeln('Vremya s ciklom TO: ', (finish1-start1).TotalMilliseconds);
m:=(finish1-start1).TotalMilliseconds;
z:=abs(k-m);

Writeln('Raznica vypolneniya 2-uh ciklov: ',z);
end.
=======
    writeln((finish-start).TotalMilliseconds);
 
    readln;
end.
>>>>>>> 8e9af6ca833b34c3ec25a2a7d681a64139845daf
