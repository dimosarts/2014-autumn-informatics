object Form1: TForm1
  Left = 158
  Top = 309
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #210#229#242#240#232#241
  ClientHeight = 240
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 96
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #206#247#234#232': 0'
  end
  object Label2: TLabel
    Left = 208
    Top = 120
    Width = 89
    Height = 17
    AutoSize = False
    Caption = #209#234#238#240#238#241#242#252': 1'
  end
  object Label3: TLabel
    Left = 187
    Top = 200
    Width = 77
    Height = 17
    AutoSize = False
  end
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 153
    Height = 217
    BevelInner = bvLowered
    TabOrder = 0
    object Image1: TImage
      Left = 13
      Top = 9
      Width = 124
      Height = 192
    end
  end
  object Panel2: TPanel
    Left = 200
    Top = 0
    Width = 89
    Height = 89
    BevelInner = bvLowered
    TabOrder = 1
    object Image2: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 73
    end
  end
  object Edit1: TEdit
    Left = 176
    Top = 144
    Width = 81
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 184
    Top = 168
    Width = 33
    Height = 25
    Caption = 'ok'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 152
    object mnuGame: TMenuItem
      Caption = '&'#200#227#240#224
      object mnuNew: TMenuItem
        Caption = '&'#205#238#226#224#255
        ShortCut = 113
        OnClick = mnuNewClick
      end
      object mnuS1: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = #194#251'&'#245#238#228
        OnClick = mnuExitClick
      end
    end
    object mnuHelp: TMenuItem
      Caption = '&'#209#239#240#224#226#234#224
      object mnuAbout: TMenuItem
        Caption = '&'#206' '#239#240#238#227#240#224#236#236#229
        OnClick = mnuAboutClick
      end
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 264
    Top = 144
  end
end
