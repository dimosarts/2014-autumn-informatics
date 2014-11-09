program autoNumberProc;
uses Crt;

type 
  customRecord=record
    model:      string;
    number:     string;
    driverName: string;
    year:       integer;
end;

var
  inputFile:              text;
  autoRecord:             customRecord;
  readlineMas,tempMas:    array of customRecord;
  menuOption:             byte;
  counter, filterYear:    integer;
  counterForMas, temp:    int64;
  approver:               char;
  
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
function parseStr(str: string): customRecord;
  var tempMas:      array[0..3] of string;
      num:          byte;
      counter,i:    integer;
      funcRes:      customRecord;
      flag:         integer;
  begin
    num:= 0;
    counter:= length(str);
    for i:=1 to counter do
      begin
        if(num=4) then
          break;
        if((str[i]<>' ') and (str[i]<>'#9')) then
            tempMas[num]:= tempMas[num] + str[i]            
        else
          if(i<counter) then
            if((str[i+1]<>' ') and (str[i+1]<>'#9')) then
              num:= num + 1;        
    end;
    
    funcRes.model:=       tempMas[0];
    funcRes.number:=      tempMas[1];
    funcRes.driverName:=  tempMas[2];
    val(tempMas[3],funcRes.year,flag);
    parseStr:=funcRes;
end;

function readFile(inputFile: Text): array of customRecord;
  var
    k: integer;
    tempInputString: string;
    readlineMas:  array of customRecord;
  begin
    k:=1;
    reset(inputFile);
  
      while not eof(inputFile) do
        begin
          setlength(readlineMas,k);
          readln(inputFile, tempInputString);
          readlineMas[k-1]:=parseStr(tempInputString);
          k:=k+1;
      end;
      close(inputFile);
      readFile:=readlineMas;
end;

function outputStr(customRec: customRecord):string; 
  var
    s: string;
  begin
    str(customRec.year, s);
    outputStr:= formatStr(customRec.model,15) + formatStr(customRec.number,15) + formatStr(customRec.driverName, 15) + s;
end;

procedure deleteRecord(menuOption: byte; inputFile: Text; var approver: char; readlineMas, tempMas: array of customRecord; counterForMas: int64; model, number, driverName: string; year, counter: integer);
  begin
                  readlineMas:= readFile(inputFile);
                  temp:=0;
                  case menuOption of
                    0:  begin
                      write('Марка автомобиля: ');
                      readln(model);
                      for counterForMas:=0 to (length(readlineMas)-1) do
                        begin
                          if(readlineMas[counterForMas].model = model) then
                            begin                          
                              setlength(tempMas,temp+1);
                              tempMas[temp].model:= readlineMas[counterForMas].model;
                              tempMas[temp].number:= readlineMas[counterForMas].number;
                              tempMas[temp].driverName:= readlineMas[counterForMas].driverName;
                              tempMas[temp].year:= readlineMas[counterForMas].year;
                              readlineMas[counterForMas].model:= '';
                              temp:=temp+1;
                            end;
                      end;   
                      if(temp>0) then
                        begin
                          writeln(temp,' ','записей найдено, соответствующих вашим критериям.');
                          writeln('Данные записи будут удалены:');
                          for counterForMas:=0 to (temp-1) do                            
                              writeln(outputStr(tempMas[counterForMas]));
                          writeln('Нажмите ' + #039 + 'y' + #039 + ' для подтверждения или любую другую клавишу для отмены операции: ');
                          readln(approver);
                          if(approver='y') then
                            begin
                              rewrite(inputFile);
                              for counterForMas:=0 to (length(readlineMas)-1) do
                                if(readlineMas[counterForMas].model<>'') then
                                  writeln(inputFile, outputStr(readlineMas[counterForMas]));                                    
                              close(inputFile);
                              writeln('Записи были успешно удалены.');
                            end;
                          writeln('Нажмите Enter для выхода в главное меню...');
                          readln;
                        end
                      else
                        begin
                          writeln('Не найдено записей, соответствующих вашему запросу');
                          write('Нажмите Enter для выхода в главное меню... ');
                          readln;
                      end;    
                    end;
                    1:  begin
                      write('Номер автомобиля: ');
                      readln(number);
                      for counterForMas:=0 to (length(readlineMas)-1) do
                        begin
                          if(readlineMas[counterForMas].number = number) then
                            begin                               
                              setlength(tempMas,temp+1);
                              tempMas[temp].model:= readlineMas[counterForMas].model;
                              tempMas[temp].number:= readlineMas[counterForMas].number;
                              tempMas[temp].driverName:= readlineMas[counterForMas].driverName;
                              tempMas[temp].year:= readlineMas[counterForMas].year;
                              readlineMas[counterForMas].number:= '';
                              temp:=temp+1;                              
                            end;
                      end;   
                      if(temp>0) then
                        begin
                          writeln(temp,' ','записей найдено, соответствующих вашим критериям.');
                          writeln('Данные записи будут удалены:');
                          for counterForMas:=0 to (temp-1) do                            
                              writeln(outputStr(tempMas[counterForMas]));
                          writeln('Нажмите ' + #039 + 'y' + #039 + ' для подтверждения или любую другую клавишу для отмены операции: ');
                          readln(approver);
                          if(approver='y') then
                            begin
                              rewrite(inputFile);
                              for counterForMas:=0 to (length(readlineMas)-1) do
                                if(readlineMas[counterForMas].number<>'') then
                                  writeln(inputFile, outputStr(readlineMas[counterForMas]));
                              close(inputFile);
                              writeln('Записи были успешно удалены.');
                            end;
                          writeln('Нажмите Enter для выхода в главное меню...');
                          readln;
                        end
                      else
                        begin
                          writeln('Не найдено записей, соответствующих вашему запросу');
                          write('Нажмите Enter для выхода в главное меню...');
                          readln;
                      end;    
                    end;
                    2:  begin
                      write('Фамилия автовладельца: ');
                      readln(driverName);
                      for counterForMas:=0 to (length(readlineMas)-1) do
                        begin
                          if(readlineMas[counterForMas].driverName = driverName) then
                            begin                               
                              setlength(tempMas,temp+1);
                              tempMas[temp].model:= readlineMas[counterForMas].model;
                              tempMas[temp].number:= readlineMas[counterForMas].number;
                              tempMas[temp].driverName:= readlineMas[counterForMas].driverName;
                              tempMas[temp].year:= readlineMas[counterForMas].year;
                              readlineMas[counterForMas].driverName:= '';
                              temp:=temp+1;                              
                            end;
                      end;   
                      if(temp>0) then
                        begin
                          writeln(temp,' ','записей найдено, соответствующих вашим критериям.');
                          writeln('Данные записи будут удалены:');
                          for counterForMas:=0 to (temp-1) do                            
                              writeln(outputStr(tempMas[counterForMas]));
                          writeln('Нажмите ' + #039 + 'y' + #039 + ' для подтверждения или любую другую клавишу для отмены операции: ');
                          readln(approver);
                          if(approver='y') then
                            begin
                              rewrite(inputFile);
                              for counterForMas:=0 to (length(readlineMas)-1) do
                                if(readlineMas[counterForMas].driverName<>'') then
                                  writeln(inputFile, outputStr(readlineMas[counterForMas]));
                              close(inputFile);
                              writeln('Записи были успешно удалены.');
                            end;
                          writeln('Для выхода в главное меню нажмите любую клавишу...');
                          readln;
                        end
                      else
                        begin
                          writeln('Не найдено записей, соответствующих вашему запросу');
                          write('Нажмите Enter для выхода в главное меню...');
                          readln;
                      end;    
                    end;
                    3:  begin
                      write('Год выпуска автомобиля: ');
                      readln(year);
                      for counterForMas:=0 to (length(readlineMas)-1) do
                        begin
                          if(readlineMas[counterForMas].year = year) then
                            begin                               
                              setlength(tempMas,temp+1);
                              tempMas[temp].model:= readlineMas[counterForMas].model;
                              tempMas[temp].number:= readlineMas[counterForMas].number;
                              tempMas[temp].driverName:= readlineMas[counterForMas].driverName;
                              tempMas[temp].year:= readlineMas[counterForMas].year;
                              readlineMas[counterForMas].year:= 0;
                              temp:=temp+1;                              
                            end;
                      end;   
                      if(temp>0) then
                        begin
                          writeln(temp,' ','записей найдено, соответствующих вашим критериям.');
                          writeln('Данные записи будут удалены:');
                          for counterForMas:=0 to (temp-1) do                            
                              writeln(outputStr(tempMas[counterForMas]));
                          writeln('Нажмите ' + #039 + 'y' + #039 + ' для подтверждения или любую другую клавишу для отмены операции: ');
                          readln(approver);
                          if(approver='y') then
                            begin
                              rewrite(inputFile);
                              for counterForMas:=0 to (length(readlineMas)-1) do
                                if(readlineMas[counterForMas].year<>0) then
                                  writeln(inputFile, outputStr(readlineMas[counterForMas]));
                              close(inputFile);
                              writeln('Записи были успешно удалены.');
                            end;
                          writeln('Нажмите Enter для выхода в главное меню...');
                          readln;
                        end
                      else
                        begin
                          writeln('Не найдено записей, соответствующих вашему запросу');
                          write('Нажмите Enter для выхода в главное меню...');
                          readln;
                      end;    
                    end;
                  end;  
end;  
  
begin

  assign(inputFile,'input.txt');
  
  while true do
    begin
        clrscr;
        writeln('*************************************************************');
        writeln('Меню:');
        writeln('0: Вывод списка записей по фильтру');
        writeln('1: Добавить запись');
        writeln('2: Удалить запись');
        writeln('9: Закончить работу с программой');
        writeln('*************************************************************');
        write('Пожалуйста, выберите пункт меню: ');
        readln(menuOption);
       
      case menuOption of
        0:  begin
              clrscr;
                  writeln('*************************************************************');
                  writeln('Вывод списка записей по фильтру.');
                  writeln('0: Вывести полный список записей');
                  writeln('1: Вывести список записей с годом выпуска автомобилей не старше заданной даты');
                  writeln('9: Назад');
                  writeln('*************************************************************');
                  write('Пожалуйста, выберите пункт меню: ');
                  readln(menuOption);
              readlineMas:= readFile(inputFile);
              if(length(readlineMas)>0) then
                begin
                  case menuOption of
                    0:  begin
                      writeln('Полный список записей:');
                      for counterForMas:= 0 to (length(readlineMas)-1) do
                        writeln(outputStr(readlineMas[counterForMas]));
                    end;
                    1:  begin
                      write('Пожалуйста, укажите год выпуска автомобиля: ');
                      readln(filterYear);
                      writeln('Список записей с годом выпуска автомобиля не старше ',filterYear);
                      for counterForMas:= 0 to (length(readlineMas)-1) do
                        if(readlineMas[counterForMas].year>=filterYear) then
                          writeln(outputStr(readlineMas[counterForMas]));                    
                    end;                    
                  end;  
                end
              else
                writeln('Записей не обнаружено.');
              writeln('Нажмите Enter для выхода в главное меню...');
              readln;  
            end;
        1:  begin
              clrscr;
              writeln('Пожалуйста, введите данные новой записи.');
              with autoRecord do
                begin
                  write('Марка автомобиля: ');
                  readln(model);
                  write('Номер автомобиля: ');
                  readln(number);
                  write('Фамилия автовладельца: ');
                  readln(driverName);
                  write('Год выпуска автомобиля: ');
                  readln(year);                  
              end;
              append(inputFile);
              writeln(inputFile, formatStr(autoRecord.model,15),formatStr(autoRecord.number,15),formatStr(autoRecord.driverName,15),autoRecord.year);
              close(inputFile);
              writeln('Запись была успешно добавлена. Нажмите Enter для выхода в главное меню... ');
              readln;
            end;
        2:  begin
                  clrscr;
                  writeln('*************************************************************');
                  writeln('Пожалуйста, введите данные записи, которую вы хотите удалить.');
                  writeln('0: Удалить по марке');
                  writeln('1: Удалить по номеру автомобиля');
                  writeln('2: Удалить по фамилии владельца автомобиля');
                  writeln('3: Удалить по году выпуска автомобиля');
                  writeln('9: Назад');
                  writeln('*************************************************************');
                  write('Пожалуйста, выберите пункт меню: ');
                  readln(menuOption);
                  clrscr;
                  deleteRecord(menuOption, inputFile, approver, readlineMas, tempMas, counterForMas, autoRecord.model, autoRecord.number, autoRecord.driverName, autoRecord.year, counter);
            end;        
        9:  exit;    
      end;
    end;
end.