//��� ��������� ���� f. �������� � ������������ ���� ������ ����� f � ���� g. 
 
procedure perevorot(var str:string); 
var 
 temp_str: string; 
 k: integer; 
begin 
 temp_str := str; 
 for k := length(str) downto 1 do 
 str [ length(str) - k + 1 ] := temp_str [ k ]; 
end; 
 
var 
 str: string; 
 f,g: TextFile; 
 
begin 
 assign(f,'f.txt'); 
 assign(g,'g.txt'); 
 reset(f); 
 rewrite(g); 
 while not eof(f) do 
 begin 
 readln(f,str); 
 perevorot(str); 
 writeln(g, str); 
 end; 
 writeln('�������� ���� g');
 close(f); 
 close(g); 
end.