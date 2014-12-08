var
  counter, j: integer;
  pairs, input: text;
  Many: set of char;
  littleWord: char;
  bigWord: string;
  groupWord: array[1..400] of string;
  counterChek: boolean;

begin
  
  
  assign(input, 'input.txt');
  reset(input);
  assign(pairs, 'pairs.txt');
  reset(pairs);
  Many := [' ', '`', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '=', '"', '№', ';', '%', ':', '?', '*', '(', ')', '_', '+', ',', '.', '{', '}', '<', '>', '?', '/'];
  counter := 1;
  
  while not Eof(pairs) do 
    begin
      read(pairs, littleWord);//создаем массив из пар
      if littleWord <> ',' 
        then
          begin
            bigWord := bigWord + littleWord;
          end
        else
          begin
            groupWord[counter] := bigWord;
            bigWord := '';
            counter := counter + 1;
          end;
      end;   
  
  groupWord[counter] := bigWord;
  littleWord := chr(0);
  bigWord := '';
  counterChek := false;
  assign(output, 'output.txt');
  rewrite(output);
  
  
  while not Eof(input) do 
  begin
    read(input, littleWord);
    if not (littleWord in Many) {Идея  следущая:Парсим текст,получаем слово,сравниваем с массивом слов,в случаем необходимости меняем} 
      then
    begin
      bigWord := bigWord + littleWord;
    end
      else
    begin
      j := 1;
      while j > counter 
            do
        if groupWord[j] = bigWord 
                then
        begin
          write(output, groupWord[j + 1], littleword);{NewText:=NewText+groupWord[j+1]+littleWord;}
          counterChek := true;
        end
        else j := j + 2;
      if counterChek = false then write(output, bigWord, littleword);{NewText:=NewText+bigWord+littleWord;}
      counterChek := false;
      littleWord := chr(0);
      bigWord := '';
    end;
  end;
  close(output);
end.