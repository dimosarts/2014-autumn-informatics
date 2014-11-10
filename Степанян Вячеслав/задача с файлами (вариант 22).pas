var
 ish, f1, f2: text;
 n, x, i:integer;
 s:string;
begin
 assign (ish,'C:\Vya4ik\ishod.txt');
 assign (f1, 'C:\Vya4ik\111.txt');
 assign (f2, 'C:\Vya4ik\222.txt');
 {readln (n);
 append (ish);
 for i:=1 to n do begin
   readln (s);
   writeln (ish, s);
 end;}
 rewrite (f1);
 rewrite (f2);
 reset (ish);
 while not eof (ish) do begin
   readln (ish, s);
   val (s, x, n); 
   if (x mod 2)=1 then
     writeln (f1, s)
   else
     writeln (f2, s);
 end;
 close(ish);
 close(f1);
 close(f2);
end.