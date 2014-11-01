const n=20 ;
var
f1,f2:text;
s:string;
a:array [1..n] of integer;
h,x,i:integer;
begin
i:=1;
assign(f1,'C:\Users\1\Desktop\l\f.txt');
reset(f1);
assign(f2,'C:\Users\1\Desktop\l\g.txt');
rewrite(f2);
 while not eof (f1) do
  begin
  readln(f1,s);
  val (s,x,h);
  a[i]:=x;
  inc(i);
  if (i = 21) then
   begin
    for i:=1 to 5 do
     writeln(f2,a[i]);
    for i:=11 to 15 do
     writeln(f2,a[i]);
    for i:=6 to 10 do
     writeln(f2,a[i]);
    for i:=16 to 20 do
     writeln(f2,a[i]);
    i := 1;
   end;
  end;
  close(f1);
  close(f2);
 end.
  

    
 