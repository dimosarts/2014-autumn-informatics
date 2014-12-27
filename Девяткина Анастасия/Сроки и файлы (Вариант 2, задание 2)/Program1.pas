var f,g,h:textfile;
    a,b:integer;
Begin
 assign(f,'file.txt'); reset(f);
 assign(g,'file1.txt');reset(g);
 assign(h,'result.txt');rewrite(h);
 readln(f,a);
 readln(g,b);
 while not (eof(f) or eof(g)) do begin
 if a<=b then 
 begin
 writeln(h,a);
 readln(f,a)
 end
 else 
 begin
 writeln(h,b);
 readln(g,b);
 end;
 end;
 if eof(f) and not eof(g) then begin 
 writeln(h,b);
 while not eof(g) do begin
 readln(g,b);
 writeln(h,b);
 end;
 end;
 if eof(g) and not eof(f) then begin 
 writeln(h,a);
 while not eof(f) do begin
 readln(f,a);
 writeln(h,a);
 end;
 end;
 close(f);
 close(g);
 close(h);
 end.