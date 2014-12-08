var 
counter,j:integer;
pairs,input:text;
Many:set of char;
littleWord:char;
bigWord:string;
groupWord:array[1..400] of string;
counterChek:boolean;

begin


assign(input,'input.txt');
reset(input);
assign(pairs,'pairs.txt');
reset(pairs);
Many:=[' ','`','!','@','#','$','%','^','&','*','(',')','=','"','№',';','%',':','?','*','(',')','_','+',',','.','{','}','<','>','?','/'];

while not Eof(pairs) do//создаем массив из пар 
    if littleWord<>',' 
      then
        begin
          read(pairs,littleWord);
          bigWord:=bigWord+littleWord;
        end
      else
        begin
          groupWord[counter]:=bigWord;
          counter:=counter+1;
        end;
        
        
groupWord[counter]:=bigWord;
assign(output,'output.txt');
rewrite(output);

 
while not Eof(input) do 
  if not(littleWord in Many) {Идея  следущая:Парсим текст,получаем слово,сравниваем с массивом слов,в случаем необходимости меняем} 
      then
        begin
          read(input,littleWord);
          bigWord:=bigWord+littleWord;
        end
      else
        begin
          j:=1;
          if j<counter 
            then
              if groupWord[j]=bigWord 
                then
                  begin
                    write(output,bigWord,littleword);{NewText:=NewText+groupWord[j+1]+littleWord;}
                    counterChek:=true;
                  end
               else j:=j+2;
          if counterChek=false then write(output,bigWord,littleword);{NewText:=NewText+bigWord+littleWord;}
          counterChek:=false;
          littleWord:=chr(0);
          bigWord:=chr(0);
        end;
close(output);
end.