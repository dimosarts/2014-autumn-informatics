program AppendTypedFilesV22; 
var 
  f:file of integer; 
  i,k:integer; 
  str:string; 
begin 
assign(f,'fileOfInt.dat'); 
rewrite(f); 
writeln('ƒл€ выхода из программы вместо ввода числа нажмите Enter.');
writeln('¬водите числа в файл:'); 
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
