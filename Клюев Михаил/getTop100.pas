program getTop100;
type 
  customRecord=record
    unicWord:         string;
    wordQuantity:     integer;
end; 

function formatStr(str: string; totalNum: byte):string;
  var i,spaceBarNum: byte;
      temp: string;
begin
  temp:= str;
  spaceBarNum:=totalNum - length(str);
  for i:=0 to spaceBarNum-1 do 
      temp:= temp + ' ';
  formatStr:=temp;    
end;

var
  inputFile:      text;
  sortedMas:      array of customRecord;
  tempRec:        customRecord;
  baseMas:        array of string;
  charOfFile:     char;  
  customSet:      set of char;
  tempStr:        string;
  i,j,k:          int64;
  counter:        integer;
  flag:           boolean;
begin
  customSet := ['a'..'я', 'А'..'Я', 'A'..'Z', 'a'..'z', '-'];
  assign(inputFile, 'input.txt');
  reset(inputFile);
  tempStr:='';
  counter:=1;
  while not eof(inputFile) do 
    begin      
      setlength(baseMas,counter);
      read(inputFile, charOfFile);
      if(charOfFile in customSet) then
        begin
          tempStr:= tempStr + charOfFile;
          flag:=true;
        end  
      else
        begin
          if(flag) then
            begin              
              baseMas[counter-1]:=tempStr;
              counter:=counter+1;
              tempStr:='';
              flag:=false;
            end;  
        end;   
   end;
  writeln('Массив разбит на слова...');
  counter:=1;
  setlength(sortedMas,counter);
  
   for i:=0 to (length(baseMas)-2) do
      begin
        flag:=false;
        for k:=0 to length(sortedMas)-1 do
          if(lowerCase(baseMas[i])=sortedMas[k].unicWord) then
            begin          
              sortedMas[k].wordQuantity:=sortedMas[k].wordQuantity+1;
              flag:=true;  
            end;  
        if(Not(flag)) then
          begin
            sortedMas[length(sortedMas)-1].unicWord:=lowerCase(baseMas[i]);
            sortedMas[length(sortedMas)-1].wordQuantity:=1;
            counter:=counter+1;
            setlength(sortedMas,counter);
          end;
      end;     
   writeln('Завершено формирование уникального массива слов...');
   for i:=0 to (length(sortedMas)-2) do
      for j:=(i+1) to (length(sortedMas)-1) do
        if(sortedMas[j].wordQuantity>sortedMas[i].wordQuantity) then
          begin
            tempRec:=sortedMas[j];
            sortedMas[j]:=sortedMas[i];
            sortedMas[i]:=tempRec;
          end;
   writeln('Массив отсортирован по убыванию...');
   for i:=0 to (length(sortedMas)-1) do
    begin
      str(i+1,tempStr);
      writeln(formatStr(tempStr,5),formatStr((sortedMas[i].unicWord),20),sortedMas[i].wordQuantity);
      if(i=99) then
        break;
    end;
   writeln('Вывод первых 100 элементов массива слов по частоте включений завершен...');
end.