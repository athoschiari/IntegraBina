object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 291
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 234
    Width = 21
    Height = 13
    Caption = 'DDD'
  end
  object Label2: TLabel
    Left = 103
    Top = 234
    Width = 24
    Height = 13
    Caption = 'Fone'
  end
  object Label3: TLabel
    Left = 8
    Top = 234
    Width = 25
    Height = 13
    Caption = 'Linha'
  end
  object Label4: TLabel
    Left = 24
    Top = 106
    Width = 25
    Height = 13
    Caption = 'Linha'
  end
  object Label5: TLabel
    Left = 8
    Top = 17
    Width = 141
    Height = 13
    Caption = 'Dados recebidos na porta n'#186':'
  end
  object Memo1: TMemo
    Left = 8
    Top = 43
    Width = 273
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 55
    Top = 249
    Width = 33
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 102
    Top = 249
    Width = 98
    Height = 21
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 249
    Width = 33
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 222
    Top = 247
    Width = 59
    Height = 25
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 153
    Top = 13
    Width = 127
    Height = 21
    TabOrder = 5
  end
  object IdUDPServer1: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = IdUDPServer1UDPRead
    Left = 48
    Top = 72
  end
end
