var
  str: string;
  len, i, a: byte;
begin
  assign(input, '1.bin');
  reset(input);
  assign(output, '2.bin');
  rewrite(output);
  read(str, input);
  len := length(str);
  a := 0;
  for i := len downto 1 do 
  begin
    if str[i] = ' ' then begin
      write(copy(str, i + 1, a), ' ', output);
      a := 0;
    end
    else 
      a := a + 1;
  end;
  write(copy(str, i, a), output);
  close(output);
end.