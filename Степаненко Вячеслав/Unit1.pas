unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, IniFiles;

type
  TForm1 = class(TForm)
    img1: TImage;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    btn3: TButton;
    strngrd1: TStringGrid;
    edt1: TEdit;
    lbl3: TLabel;
    btn2: TButton;
    lbl4: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  snake = record
    x_s, y_s: Byte;
  end;

  winners = record
    name: string[10];
    score: Byte;
  end;

var
  Form1: TForm1;
  ingame: Boolean;
  fld: array[1..20, 1..20] of Boolean;
  snk: array[1..50] of snake;
  pl: array[1..5] of winners;
  Len, nap, balls: Byte;
  x_f, y_f: Byte;
  slp: Word;
  rec: TIniFile;

implementation

{$R *.dfm}

procedure setprize;
var
  a, b: Byte;
label
  v;
begin
  Form1.lbl1.Caption := 'ОЧКИ:' + inttostr(balls);
  Randomize;
  v:
  x_f := Random(19) + 1;
  y_f := Random(19) + 1;
  if fld[x_f, y_f] = True then
    goto v;
  for a := 1 to 10 do
    for b := 1 to 10 do
      Form1.img1.Canvas.Pixels[x_f * 10 + a, y_f * 10 + b] := clBlue;
end;

procedure newgame;
var
  a, b: Byte;
begin
  Form1.img1.Canvas.Brush.Color := clBlack;
  Form1.img1.Canvas.Rectangle(0, 0, Form1.img1.Width, Form1.img1.Height);
  Form1.img1.Canvas.Brush.Color := clWhite;
  form1.img1.Canvas.Rectangle(10, 10, 212, 212);
  len := 1;
  snk[1].x_s := Random(10) + 5;
  snk[1].y_s := Random(10) + 5;
  nap := Random(3);
  ingame := True;
  for a := 1 to 10 do
    for b := 1 to 10 do
    begin
      fld[a, b] := False;
      Form1.img1.Canvas.Pixels[(snk[1].x_s * 10) + a, (snk[1].y_s * 10) + b] :=
        clRed;
    end;
  for a := 10 to 20 do
    for b := 10 to 20 do
      fld[a, b] := False;
  balls := 0;
  setprize;
  slp := 300;
end;

procedure lose;
begin
  ingame := False;
  form1.btn1.Enabled := True;
  MessageBox(0, 'вы проиграли', '', 0);
  form1.strngrd1.Visible := True;
  form1.img1.Visible := False;
  form1.lbl4.Visible := True;
  if balls > pl[5].score then
  begin
    form1.edt1.Clear;
    form1.lbl3.Visible := True;
    Form1.edt1.Visible := True;
    Form1.btn1.Enabled := False;
    form1.btn2.Visible := True;
  end;
end;

procedure mov;
var
  a, b, x_h, y_h: Byte;
begin
  Application.ProcessMessages;
  x_h := snk[Len].x_s;
  y_h := snk[Len].y_s;
  for a := len downto 2 do
  begin
    snk[a].x_s := snk[a - 1].x_s;
    snk[a].y_s := snk[a - 1].y_s;
  end;

  case nap of
    0: inc(snk[1].x_s);
    1: Inc(snk[1].y_s);
    2: Dec(snk[1].x_s);
    3: Dec(snk[1].y_s);
  end;
  if (snk[1].x_s = 0) or (snk[1].x_s = 21) or (snk[1].y_s = 0) or (snk[1].y_s =
    21) or (fld[snk[1].x_s, snk[1].y_s] = true) then
  begin
    lose;
    Exit;
  end;
  if (snk[1].x_s = x_f) and (snk[1].y_s = y_f) then
  begin
    inc(balls);
    inc(Len);
    snk[Len].x_s := x_h;
    snk[Len].y_s := y_h;
    setprize;
    Dec(slp, 50);
    if slp < 100 then
      slp := 50;
  end
  else
  begin
    for a := 1 to 10 do
      for b := 1 to 10 do
        Form1.img1.Canvas.Pixels[x_h * 10 + a, y_h * 10 + b] := clwhite;
    fld[x_h, y_h] := False;
  end;

  for a := 1 to 10 do
    for b := 1 to 10 do
      Form1.img1.Canvas.Pixels[(snk[1].x_s * 10) + a, (snk[1].y_s * 10) + b] :=
        clRed;
  fld[snk[1].x_s, snk[1].y_s] := True;
  Application.ProcessMessages;
  Sleep(slp);
end;

procedure TForm1.btn1Click(Sender: TObject);

begin
  lbl4.Visible := False;
  strngrd1.Visible := False;
  img1.Visible := True;
  btn1.Enabled := False;
  newgame;
  while ingame do
    mov;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  a: Byte;
begin
  Randomize;
  with strngrd1 do
  begin
    Cells[0, 0] := 'ник';
    Cells[1, 0] := 'счет';
    ColWidths[0] := 90;
    ColWidths[1] := 90;
  end;
  rec := IniFiles.TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'hi.ini');
  try
    for a := 1 to 5 do
    begin
      pl[a].score := rec.ReadInteger('pl' + inttostr(a), 'score', 0);
      pl[a].name := rec.ReadString('pl' + inttostr(a), 'name', '');
      strngrd1.Cells[0, a] := pl[a].Name;
      strngrd1.Cells[1, a] := IntToStr(pl[a].score);
    end;
  finally
    rec.Free;
  end;

end;

procedure TForm1.btn2Click(Sender: TObject);
var
  a, b: Byte;
label
  x;
begin
  if Length(edt1.Text) > 0 then
  begin
    for a := 1 to 5 do
      if balls > pl[a].score then
      begin
        for b := 5 downto a + 1 do
        begin
          pl[b].score := pl[b - 1].score;
          pl[b].name := pl[b - 1].name;
        end;
        pl[a].name := Form1.edt1.text;
        pl[a].score := balls;
        goto x;
      end;
    x:
    for a := 1 to 5 do
    begin
      strngrd1.Cells[0, a] := pl[a].Name;
      strngrd1.Cells[1, a] := IntToStr(pl[a].score);
    end;
    edt1.Visible := False;
    lbl3.Visible := false;
    btn2.Visible := False;
    btn1.Enabled := True;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = ord(vk_up) then
    nap := 3;
  if Key = ord(vk_down) then
    nap := 1;
  if Key = ord(vk_left) then
    nap := 2;
  if Key = ord(vk_right) then
    nap := 0;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  a: Byte;
begin
  ingame := False;
  rec := IniFiles.TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'hi.ini');
  try
    for a := 1 to 5 do
    begin
      rec.WriteString('pl' + inttostr(a), 'name', pl[a].name);
      rec.WriteInteger('pl' + inttostr(a), 'score', pl[a].score);
    end;
  finally
    rec.Free;
  end;
  Form1.Close;
end;

end.

