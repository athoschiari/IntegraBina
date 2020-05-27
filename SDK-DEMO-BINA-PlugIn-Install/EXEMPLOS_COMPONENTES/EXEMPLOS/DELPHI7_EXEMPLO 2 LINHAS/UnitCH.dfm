object Form2: TForm2
  Left = 495
  Top = 238
  Width = 217
  Height = 211
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 127
    Height = 13
    Caption = 'Formatado (tipo+ddd+fone)'
  end
  object Label2: TLabel
    Left = 10
    Top = 48
    Width = 133
    Height = 13
    Caption = 'Indice (ddd+fone - Binagem)'
  end
  object Label3: TLabel
    Left = 153
    Top = 49
    Width = 26
    Height = 13
    Caption = 'Linha'
  end
  object Label4: TLabel
    Left = 7
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Chamada:'
  end
  object lbTipoChamada: TLabel
    Left = 63
    Top = 104
    Width = 13
    Height = 13
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditFormat: TEdit
    Left = 10
    Top = 24
    Width = 135
    Height = 21
    TabOrder = 0
  end
  object EditIndice: TEdit
    Left = 10
    Top = 64
    Width = 135
    Height = 21
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 66
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
  object EditLinha: TEdit
    Left = 154
    Top = 64
    Width = 31
    Height = 21
    TabOrder = 3
  end
end
