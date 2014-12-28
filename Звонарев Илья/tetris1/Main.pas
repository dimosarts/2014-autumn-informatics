unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Registry, IniFiles;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mnuGame: TMenuItem;
    mnuNew: TMenuItem;
    mnuS1: TMenuItem;
    mnuExit: TMenuItem;
    Timer1: TTimer;
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure mnuNewClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   type  winners = record
    name: string[10];
    score: Byte;
  end;

  TTetr = Array [1..4, 1..4] of Byte;

const
  tetramino: Array [1..11, 1..4] of TTetr =
  (
  (((1,1,0,0),(0,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,0,0),(1,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,0,0),(1,0,0,0),(0,0,0,0))),
  (((0,1,1,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,1,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0))),
  (((0,1,0,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,0,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0))),
  (((0,0,0,0),(1,1,1,1),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(0,1,0,0),(0,1,0,0)),
   ((0,0,0,0),(1,1,1,1),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(0,1,0,0),(0,1,0,0))),
  (((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0))),
  (((1,1,0,0),(0,1,0,0),(0,1,0,0),(0,0,0,0)),
   ((0,0,1,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,0,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,1,1,0),(1,0,0,0),(0,0,0,0),(0,0,0,0))),
  (((1,1,0,0),(1,0,0,0),(1,0,0,0),(0,0,0,0)),
   ((1,1,1,0),(0,0,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,1,0),(0,0,0,0),(0,0,0,0))),
  (((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0))),
  (((1,1,1,0),(1,0,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,1,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,0,1,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,0,0,0),(1,1,0,0),(0,0,0,0))),
  (((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0))),
  (((1,0,0,0),(1,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)))
  );

  colors : Array [1..12] of Integer = (clAqua, clBlue, clFuchsia, clGreen,
  clLime, clMaroon, clNavy, clOlive, clPurple, clRed, clTeal, clYellow);

  stkw = 10;
  stkh = 20;
  sqrs = 15;

var
  Form1: TForm1;
  tetr, nexttetr : TTetr;
  num, nextnum : Integer;
  gen, nextgen : Integer;
  fcl,nextfcl : Integer;
  x,y : Integer;
  scores : Integer;
  stakan : Array [-3..stkh, 1..stkw] of Integer;
  reg : TRegistry;
  rec :  TIniFile;
  pl: array[1..10] of winners;

implementation

{$R *.DFM}

uses About;

procedure inn;
var a: Byte;
begin
  rec := IniFiles.TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'hi.ini');
  try
    for a := 1 to 10 do
    begin
      pl[a].score := rec.ReadInteger('pl' + inttostr(a), 'score', 0);
      pl[a].name := rec.ReadString('pl' + inttostr(a), 'name', '');
     { strngrd1.Cells[0, a] := pl[a].Name;
      strngrd1.Cells[1, a] := IntToStr(pl[a].score);   }
    end;
  finally
    rec.Free;
  end;
  
end;

procedure fille;
  var
  a, b: Byte;
  label x;
begin


    for a := 1 to 10 do
      if scores > pl[a].score then
      begin

        for b := 10 downto a + 1 do
        begin
          pl[b].score := pl[b - 1].score;
          pl[b].name := pl[b - 1].name;
        end;
        pl[a].name := Form1.edit1.text;
        pl[a].score := scores;
        goto x;
      end;
    x:
    Form1.edit1.Visible := False;
    Form1.Button1.Visible := false;
  rec := IniFiles.TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'hi.ini');
  try
    for a := 1 to 10 do
    begin
      rec.WriteString('pl' + inttostr(a), 'name', pl[a].name);
      rec.WriteInteger('pl' + inttostr(a), 'score', pl[a].score);
    end;
  finally
    rec.Free;
  end;

end;

procedure setspeed(s : Byte);
begin
  Form1.Label2.Caption := 'Speed: ' + IntToStr(s);
  Form1.Timer1.Interval := 500 - (s-1) * 100;
end;

procedure drawsquare(i,j,c : Integer; cnv : TCanvas);
var
  x,y : Integer;
begin
  x := (j-1)*sqrs;
  y := (i-1)*sqrs;
  with cnv do
  begin
    Brush.Color := c;
    FillRect(Bounds(x+2,y+2,sqrs-4,sqrs-4));
    Pen.Color := clLtGray;
    MoveTo(x,y);
    LineTo(x+sqrs,y);
    MoveTo(x,y);
    LineTo(x,y+sqrs);
    Pen.Color := clWhite;
    MoveTo(x+1,y+1);
    LineTo(x+sqrs-2,y+1);
    MoveTo(x+1,y+1);
    LineTo(x+1,y+sqrs-2);
    Pen.Color := clBlack;
    MoveTo(x+sqrs-1,y+sqrs-1);
    LineTo(x,y+sqrs-1);
    MoveTo(x+sqrs-1,y+sqrs-1);
    LineTo(x+sqrs-1,y);
    MoveTo(x+sqrs-2,y+sqrs-2);
    LineTo(x+1,y+sqrs-2);
    MoveTo(x+sqrs-2,y+sqrs-2);
    LineTo(x+sqrs-2,y+1);
  end;
end;

procedure showfigure;
var
  i,j : Integer;
begin
  for i:=1 to 4 do
    for j:=1 to 4 do
      if tetr[i,j]=1 then drawsquare(i+y-1,j+x-1,fcl,Form1.Image1.Canvas);
end;

procedure erasesquare(i,j : Integer);
var x,y : Integer;
begin
  Form1.Image1.Canvas.Brush.Color := clGray;
  x := (j-1)*sqrs;
  y := (i-1)*sqrs;
  Form1.Image1.Canvas.FillRect(Bounds(x,y,sqrs,sqrs));
end;

procedure hidefigure;
var
  i,j: Integer;
begin
  for i:=1 to 4 do
    for j:=1 to 4 do
      if tetr[i,j]=1 then erasesquare(i+y-1,j+x-1);
end;

function canrotate : Boolean;
var i,j,k : Integer; t : TTetr;
begin
  result := true;
  k := num;
  if k < 4 then inc(k) else k := 1;
  t := tetramino[gen,k];
  for i := 1 to 4 do
    for j := 1 to 4 do
      if (t[i,j]=1) and ((stakan[i+y-1,j+x-1]>0)
      or (j-1+x-1<0) or (j+x>stkw+1) or (i+y>stkh+1)) then
      begin
        result := false;
        exit;
      end;
end;

procedure rotatefigure;
begin
  hidefigure;
  if num < 4 then inc(num) else num := 1;
  tetr := tetramino[gen,num];
  showfigure;
end;

procedure gennextfigure;
begin
  nextgen := random(11)+1;
  nextnum := random(4)+1;
  nexttetr := tetramino[nextgen,nextnum];
  nextfcl := colors[random(12)+1];
end;

procedure nextfigure;
var i,j : Integer;
label go;
begin
  gen := nextgen;
  num := nextnum;
  tetr := nexttetr;
  fcl := nextfcl;
  for i := 4 downto 1 do
    for j := 1 to 4 do
      if tetr[i,j]=1 then begin y := -3+(4-i); goto go; end;
  go:
  x := 4;
  gennextfigure;
  Form1.Image2.Canvas.Brush.Color := clGray;
  Form1.Image2.Canvas.FillRect(Bounds(0,0,sqrs*4,sqrs*4));
  for i := 1 to 4 do
    for j := 1 to 4 do
      if nexttetr[i,j]=1 then drawsquare(i,j,nextfcl,Form1.Image2.Canvas);
end;

procedure newgame;
var i,j : Integer;
begin
  for i := -3 to stkh do
    for j := 1 to stkw do
      stakan[i,j] := 0;
  Form1.Image1.Canvas.Brush.Color := clGray;
  Form1.Image1.Canvas.FillRect(Bounds(0,0,sqrs*stkw,sqrs*stkh));
  scores := 0;
  Form1.Label1.Caption := '����: ' + IntToStr(scores);
  setspeed(1);
  randomize;
  gennextfigure;
  nextfigure;
  showfigure;
  Form1.Label3.Caption := '';
  Form1.Timer1.Enabled := True;
end;

function canmoveleft : Boolean;
var i,j : Integer;
begin
  result := true;
  for i := 1 to 4 do
    for j := 1 to 4 do
      if (tetr[i,j]=1) and ((stakan[i+y-1,j-1+x-1]>0) or (j-1+x-1=0)) then
      begin
        result := false;
        exit;
      end;
end;

function canmoveright : Boolean;
var i,j : Integer;
begin
  result := true;
  for i := 1 to 4 do
    for j := 1 to 4 do
      if (tetr[i,j]=1) and ((stakan[i+y-1,j+x]>0) or (j+x=stkw+1)) then
      begin
        result := false;
        exit;
      end;
end;

function canmovedown : Boolean;
var i,j : Integer;
begin
  result := true;
  for i := 4 downto 1 do
    for j := 1 to 4 do
      if (tetr[i,j]=1) and ((stakan[i+y,j+x-1]>0) or (i+y=stkh+1)) then
      begin
        result := false;
        exit;
      end;
end;

function gameover : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 1 to stkw do
    if stakan[0,i]>0 then
    begin
      Result := True;
      Exit;
    end;

end;

procedure checkstakan;
var i,j,k,l,c : Integer;
begin
  with Form1.Image1.Canvas do
  begin
    l := 0;
    for i := 1 to stkh do
    begin
      c := 0;
      for j := 1 to stkw do if stakan[i,j]>0 then inc(c);
      if c = stkw then
      begin
        Inc(l);
        for k := 1 to stkw do erasesquare(i,k);
        for k := 1 to i-1 do
          for j := 1 to stkw do
          begin
            stakan[i-k+1,j] := stakan[i-k,j];
            if stakan[i-k+1,j]>0 then
              drawsquare(i-k+1,j,stakan[i-k+1,j],Form1.Image1.Canvas);
            stakan[i-k,j] := 0;
            erasesquare(i-k,j);
          end;
      end;
    end;
    scores := scores + l * 10;
    if (scores >= 300)  and (scores < 1000)  then setspeed(2);
    if (scores >= 1000) and (scores < 3000)  then setspeed(3);
    if (scores >= 3000) and (scores < 10000) then setspeed(4);
    if (scores >= 10000) then setspeed(5);
    Form1.Label1.Caption := '����: '+IntToStr(scores);
  end;
end;

procedure fixfigure;
var i,j : Integer;
begin
  for i := 1 to 4 do
    for j := 1 to 4 do
      if tetr[i,j]=1 then stakan[y+i-1,x+j-1] := fcl;
end;

procedure stopmove;
var a: Byte;
label x;
begin
  fixfigure;
  checkstakan;
  if not gameover then
  begin
    nextfigure;
    showfigure;
  end
  else
  begin
    Form1.Timer1.Enabled := False;
    Application.MessageBox(PChar('Game Over!'),PChar('Tetris'),
    MB_ICONINFORMATION+MB_OK);
     for a := 1 to 10 do
      if scores > pl[a].score then  begin
       Application.MessageBox(PChar('New record!'+#13+ 'Enter your nick!'),PChar('Tetris'),
    MB_ICONINFORMATION+MB_OK);
    Form1.Button1.Visible:=True;
    Form1.Edit1.Visible:=True;

    goto x;
      end;
     x:

  end;
end;

procedure moveleft;
begin
  hidefigure;
  dec(x);
  showfigure;
end;

procedure moveright;
begin
  hidefigure;
  inc(x);
  showfigure;
end;

procedure movedown;
begin
  hidefigure;
  inc(y);
  showfigure;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not gameover then
  case key of
    37: if Timer1.Enabled and canmoveleft then moveleft;
    38: if Timer1.Enabled and canrotate then rotatefigure;
    39: if Timer1.Enabled and canmoveright then moveright;
    40: if Timer1.Enabled and canmovedown then movedown else stopmove;
    {49..53: setspeed(Key - 48);}
    32: if Timer1.Enabled then
        begin
          while canmovedown do movedown;
          stopmove;
        end;
    19: begin
          if Timer1.Enabled then
          begin
            Label3.Caption := 'Pause!';
            Timer1.Enabled := False;
          end
          else
          begin
            Label3.Caption := '';
            Timer1.Enabled := True;
          end;
        end;
  end;
end;

procedure TForm1.mnuNewClick(Sender: TObject);
var te : Boolean;
begin
  te := Timer1.Enabled;
  if te then Timer1.Enabled := False;
  if Application.MessageBox(PChar('Are you sure to start a new game?'),
  PChar('Tetris'), MB_ICONQUESTION+MB_YESNO) = IDYES then
  newgame
  else
  Timer1.Enabled := te;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if canmovedown then movedown else stopmove;
end;

procedure TForm1.FormCreate(Sender: TObject);
var mh : String;
begin
  {HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics, MenuHeight}
  ModifyMenu(MainMenu1.Handle, 1, mf_ByPosition or mf_Popup
  or mf_Help, mnuHelp.Handle, '&About');
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey('\Control Panel\Desktop\WindowMetrics', True);
  mh := reg.ReadString('MenuHeight');
  reg.CloseKey;
  reg.Free;
  Image1.Top := 2;
  Image1.Left := 2;
  Image1.Width := stkw * sqrs;
  Image1.Height := stkh * sqrs;
  Panel1.Top := 5;
  Panel1.Left := 5;
  Panel1.Width := Image1.Width + 4;
  Panel1.Height := Image1.Height + 4;
  Image2.Top := 2;
  Image2.Left := 2;
  Image2.Width := sqrs * 4;
  Image2.Height := Image2.Width;
  Panel2.Top := 5;
  Panel2.Left := Panel1.Left + Panel1.Width + 10;
  Panel2.Width := Image2.Width + 4;
  Panel2.Height := Panel2.Width;
  Label1.Top := Panel2.Top + Panel2.Height + 10;
  Label2.Top := Label1.Top + Label1.Height + 10;
  Label3.Top := Label2.Top + Label2.Height + 10;
  Label1.Left := Panel2.Left;
  Label2.Left := Panel2.Left;
  Label3.Left := Panel2.Left;
  Form1.Height := Panel1.Height + Panel1.Top - (StrToInt(mh) div 15) + 30;
  Form1.Width := Panel2.Left + Panel2.Width + 15;
  Image1.Parent.DoubleBuffered := True; 
  newgame;
  inn;
end;

procedure TForm1.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Button2Click(Sender: TObject);
var f:textfile; x,x1,a,fname:string; k,l,i:integer;
begin
  assignfile(f,'hi.ini');
  reset(f);
  k:=4;
  while not EOF(f) do
  begin
    readln(f, a);
    if k mod 3=1 then x:=x+a+'  ';
    if k mod 3=2 then
    begin
    x:=x+a+'    ';
    l:=Length(a);
    for i:=1 to 17-l do x:=x+'  ';
    l:=0;
    end;
    if k mod 3=0 then x:=x+a+#13;
    k:=k+1;
  end;
  closefile(f);
   l:=Length(x);
  for i:=1 to l do if (x[i]='s')  or (x[i]='c') or (x[i]='o') or (x[i]='r') or (x[i]='e') or (x[i]='n') or (x[i]='a') or (x[i]='m') or (x[i]='=') then x[i]:=' ';
   x1:='�           Name                   Score'+#13+x;
   showmessage(x1);
   Form1.Button2.Visible:=False;
   Form1.Button2.Visible:=True;
  end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Action:=ca
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   if (Length(Edit1.Text)>0) then fille;
end;

end.
