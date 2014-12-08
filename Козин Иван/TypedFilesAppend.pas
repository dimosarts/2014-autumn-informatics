program AppendTypedFiles; 
var 
  f:file of integer; 
  i,k:integer; 
  str:string; 
begin 
assign(f,'fileOfInt.dat'); 
rewrite(f); 
writeln('Äëÿ âûõîäà èç ïðîãðàììû âìåñòî ââîäà ÷èñëà íàæìèòå Enter.');
writeln('Ââîäèòå ÷èñëà â ôàéë:'); 
repeat 
  begin 
  readln(str);
  if str=#18 then break;
  val(str,i,k);
  write(f,i); 
  end; 
until k<>0; 
seek(f,filesize(f)-1);
truncate(f);
close(f); 
end. 
