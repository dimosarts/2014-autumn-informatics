object Form1: TForm1
  Left = 150
  Top = 138
  BorderStyle = bsNone
  Caption = #1079#1084#1077#1081#1082#1072
  ClientHeight = 359
  ClientWidth = 441
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 24
    Top = 72
    Width = 225
    Height = 225
    Align = alCustom
  end
  object lbl1: TLabel
    Left = 136
    Top = 24
    Width = 5
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 376
    Top = 336
    Width = 58
    Height = 13
    Caption = 'by we v.1.0'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 48
    Top = 260
    Width = 73
    Height = 19
    Caption = #1074#1074#1077#1076#1080' '#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = 0
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl4: TLabel
    Left = 88
    Top = 60
    Width = 63
    Height = 19
    Caption = #1088#1077#1082#1086#1088#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = 19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 296
    Top = 72
    Width = 89
    Height = 25
    Caption = #1085#1086#1074#1072#1103' '#1080#1075#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn3: TButton
    Left = 296
    Top = 120
    Width = 89
    Height = 25
    Caption = #1074#1099#1081#1090#1080' '#1080#1079' '#1080#1075#1088#1099
    TabOrder = 1
    OnClick = btn3Click
  end
  object strngrd1: TStringGrid
    Left = 24
    Top = 80
    Width = 201
    Height = 161
    ColCount = 2
    RowCount = 6
    TabOrder = 2
  end
  object edt1: TEdit
    Left = 32
    Top = 280
    Width = 121
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object btn2: TButton
    Left = 152
    Top = 280
    Width = 49
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    Visible = False
    OnClick = btn2Click
  end
end
