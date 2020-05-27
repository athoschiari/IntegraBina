object Form1: TForm1
  Left = 445
  Top = 135
  Width = 676
  Height = 669
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 25
    Top = 14
    Width = 135
    Height = 13
    Caption = 'Caminho completo do PlugIn'
  end
  object Label15: TLabel
    Left = 278
    Top = 14
    Width = 254
    Height = 13
    Caption = 'Seu numero de registro (deixe em branco se n'#227'o tiver)'
  end
  object Label23: TLabel
    Left = 24
    Top = 552
    Width = 602
    Height = 13
    Caption = 
      'Aten'#231#227'o !! Ao rodar este exemplo no modo "DEBUG" (dentro do Delp' +
      'hi) ocorrer'#225' o erro "Connection reset by peer (socket error)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 25
    Top = 570
    Width = 600
    Height = 13
    Caption = 
      'Para mais linhas ( at'#233' 6 ), repita este form. Lembre-se de setar' +
      ' as portas conforme setado no PlugIn (n'#227'o repita os n'#186' das porta' +
      's)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 59
    Width = 305
    Height = 367
    Caption = ' Linha 1'
    TabOrder = 0
    object Label2: TLabel
      Left = 51
      Top = 224
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object Label4: TLabel
      Left = 218
      Top = 252
      Width = 29
      Height = 13
      Caption = 'Linha:'
    end
    object Label5: TLabel
      Left = 34
      Top = 278
      Width = 46
      Height = 13
      Caption = 'Recebido'
    end
    object Label6: TLabel
      Left = 31
      Top = 252
      Width = 53
      Height = 13
      Caption = 'Formatado:'
    end
    object Label10: TLabel
      Left = 39
      Top = 308
      Width = 81
      Height = 13
      Caption = 'Indice (binagem):'
    end
    object Label16: TLabel
      Left = 16
      Top = 173
      Width = 99
      Height = 13
      Caption = 'TBraiDRepeater1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 33
      Top = 337
      Width = 90
      Height = 13
      Caption = 'Tipo, DDD e Fone:'
    end
    object Label22: TLabel
      Left = 217
      Top = 224
      Width = 25
      Height = 13
      Caption = 'Ring:'
    end
    object edRecebido1: TEdit
      Left = 87
      Top = 276
      Width = 182
      Height = 21
      TabOrder = 0
    end
    object edLinha1: TEdit
      Left = 250
      Top = 250
      Width = 19
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edFormatFone1: TEdit
      Left = 87
      Top = 250
      Width = 126
      Height = 21
      TabOrder = 2
    end
    object edStatus1: TEdit
      Left = 87
      Top = 222
      Width = 126
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edIndexFone1: TEdit
      Left = 127
      Top = 305
      Width = 141
      Height = 21
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object btHideView1: TButton
      Left = 199
      Top = 188
      Width = 88
      Height = 22
      Caption = 'Ocultar/Mostrar'
      TabOrder = 5
      OnClick = btHideView1Click
    end
    object edTipo1: TEdit
      Left = 126
      Top = 334
      Width = 24
      Height = 21
      TabOrder = 6
    end
    object edDDD1: TEdit
      Left = 155
      Top = 334
      Width = 27
      Height = 21
      TabOrder = 7
    end
    object edFone1: TEdit
      Left = 188
      Top = 334
      Width = 80
      Height = 21
      TabOrder = 8
    end
    object edRing1: TEdit
      Left = 247
      Top = 222
      Width = 25
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object BraiDRepeater1: TBraiDRepeater
      Left = 15
      Top = 190
      Width = 154
      Height = 21
      Color = clBlack
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 10
      Text = '(00) 0000-0000'
      a0NumberLine = 1
      a3Remote_IP = '192.168.56.1'
      a4Remote_Port = 0
      a5Local_Port = 0
      a6Local_IP = '192.168.56.1'
      a2DetectPhone = BraiDRepeater1a2DetectPhone
      a3OnFormatPhone = BraiDRepeater1a3OnFormatPhone
      a4OnKeyEvent = BraiDRepeater1a4OnKeyEvent
      a5OnFileRec = BraiDRepeater1a5OnFileRec
      a6OnRing = BraiDRepeater1a6OnRing
      a7OnAllEvents = BraiDRepeater1a7OnAllEvents
      a8OnSTatusEvent = BraiDRepeater1a8OnSTatusEvent
      a9OnIndexPhone = BraiDRepeater1a9OnIndexPhone
      a9OnIPMonitor = BraiDRepeater1a9OnIPMonitor
    end
    object btAtiva1: TButton
      Left = 15
      Top = 137
      Width = 71
      Height = 22
      Cancel = True
      Caption = 'Ativa L1'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btAtiva1Click
    end
    object btDesativa1: TButton
      Left = 88
      Top = 137
      Width = 71
      Height = 22
      Cancel = True
      Caption = 'Desativa'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btDesativa1Click
    end
    object btConfig1: TButton
      Left = 162
      Top = 137
      Width = 71
      Height = 22
      Cancel = True
      Caption = 'Configurar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = btConfig1Click
    end
    object GroupBox6: TGroupBox
      Left = 15
      Top = 20
      Width = 273
      Height = 50
      Caption = 'Conforme configurado em "RECEBE" no PlugIn'
      TabOrder = 14
      object Label17: TLabel
        Left = 9
        Top = 22
        Width = 58
        Height = 13
        Caption = 'IP do PlugIn'
      end
      object Label18: TLabel
        Left = 185
        Top = 22
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object edIPRemoto1: TEdit
        Left = 72
        Top = 20
        Width = 92
        Height = 21
        TabOrder = 0
      end
      object edPortaRemota1: TEdit
        Left = 214
        Top = 20
        Width = 35
        Height = 21
        TabOrder = 1
        Text = '3821'
      end
    end
    object GroupBox7: TGroupBox
      Left = 15
      Top = 79
      Width = 273
      Height = 50
      Caption = 'Conforme configurado em "ENVIA" no PlugIn'
      TabOrder = 15
      object Label19: TLabel
        Left = 9
        Top = 22
        Width = 39
        Height = 13
        Caption = 'IP Local'
      end
      object Label20: TLabel
        Left = 185
        Top = 22
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object edIPLocal1: TEdit
        Left = 71
        Top = 20
        Width = 92
        Height = 21
        TabOrder = 0
      end
      object edPortaLocal1: TEdit
        Left = 214
        Top = 20
        Width = 35
        Height = 21
        TabOrder = 1
        Text = '6511'
      end
    end
    object Button1: TButton
      Left = 238
      Top = 136
      Width = 49
      Height = 23
      Caption = 'REC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 238
      Top = 160
      Width = 49
      Height = 25
      Caption = 'STOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 344
    Top = 59
    Width = 305
    Height = 367
    Caption = ' Linha 2'
    TabOrder = 1
    object Label1: TLabel
      Left = 51
      Top = 225
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object Label3: TLabel
      Left = 218
      Top = 253
      Width = 29
      Height = 13
      Caption = 'Linha:'
    end
    object Label7: TLabel
      Left = 34
      Top = 279
      Width = 46
      Height = 13
      Caption = 'Recebido'
    end
    object Label8: TLabel
      Left = 31
      Top = 253
      Width = 53
      Height = 13
      Caption = 'Formatado:'
    end
    object Label11: TLabel
      Left = 16
      Top = 174
      Width = 99
      Height = 13
      Caption = 'TBraiDRepeater2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 33
      Top = 338
      Width = 90
      Height = 13
      Caption = 'Tipo, DDD e Fone:'
    end
    object Label13: TLabel
      Left = 217
      Top = 225
      Width = 25
      Height = 13
      Caption = 'Ring:'
    end
    object Label9: TLabel
      Left = 39
      Top = 309
      Width = 81
      Height = 13
      Caption = 'Indice (binagem):'
    end
    object edRecebido2: TEdit
      Left = 87
      Top = 277
      Width = 182
      Height = 21
      TabOrder = 0
    end
    object edLinha2: TEdit
      Left = 250
      Top = 251
      Width = 19
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edFormatFone2: TEdit
      Left = 87
      Top = 251
      Width = 126
      Height = 21
      TabOrder = 2
    end
    object edStatus2: TEdit
      Left = 87
      Top = 223
      Width = 126
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edIndexFone2: TEdit
      Left = 126
      Top = 306
      Width = 142
      Height = 21
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object btHideView2: TButton
      Left = 185
      Top = 188
      Width = 101
      Height = 22
      Caption = 'Ocultar/Mostrar'
      TabOrder = 5
      OnClick = btHideView2Click
    end
    object edTipo2: TEdit
      Left = 126
      Top = 335
      Width = 24
      Height = 21
      TabOrder = 6
    end
    object edDDD2: TEdit
      Left = 155
      Top = 335
      Width = 27
      Height = 21
      TabOrder = 7
    end
    object edFone2: TEdit
      Left = 188
      Top = 335
      Width = 80
      Height = 21
      TabOrder = 8
    end
    object edRing2: TEdit
      Left = 247
      Top = 223
      Width = 25
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object BraiDRepeater2: TBraiDRepeater
      Left = 15
      Top = 191
      Width = 145
      Height = 21
      Color = clBlack
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 10
      Text = '(00) 0000-0000'
      a0NumberLine = 1
      a3Remote_IP = '192.168.56.1'
      a4Remote_Port = 0
      a5Local_Port = 0
      a6Local_IP = '192.168.56.1'
      a2DetectPhone = BraiDRepeater2a2DetectPhone
      a3OnFormatPhone = BraiDRepeater2a3OnFormatPhone
      a4OnKeyEvent = BraiDRepeater2a4OnKeyEvent
      a5OnFileRec = BraiDRepeater2a5OnFileRec
      a6OnRing = BraiDRepeater2a6OnRing
      a7OnAllEvents = BraiDRepeater2a7OnAllEvents
      a8OnSTatusEvent = BraiDRepeater2a8OnSTatusEvent
      a9OnIndexPhone = BraiDRepeater2a9OnIndexPhone
      a9OnIPMonitor = BraiDRepeater2a9OnIPMonitor
    end
    object btAtiva2: TButton
      Left = 15
      Top = 137
      Width = 70
      Height = 22
      Cancel = True
      Caption = 'Ativa L2'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btAtiva2Click
    end
    object btDesativa2: TButton
      Left = 89
      Top = 137
      Width = 68
      Height = 22
      Cancel = True
      Caption = 'Desativa'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btDesativa2Click
    end
    object btConfig2: TButton
      Left = 163
      Top = 137
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Configurar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = btConfig2Click
    end
    object GroupBox4: TGroupBox
      Left = 15
      Top = 20
      Width = 273
      Height = 50
      Caption = 'Conforme configurado em "RECEBE" no PlugIn'
      TabOrder = 14
      object Label25: TLabel
        Left = 9
        Top = 22
        Width = 58
        Height = 13
        Caption = 'IP do PlugIn'
      end
      object Label26: TLabel
        Left = 185
        Top = 22
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object edIPRemoto2: TEdit
        Left = 72
        Top = 20
        Width = 92
        Height = 21
        TabOrder = 0
      end
      object edPortaRemota2: TEdit
        Left = 214
        Top = 20
        Width = 35
        Height = 21
        TabOrder = 1
        Text = '3822'
      end
    end
    object GroupBox5: TGroupBox
      Left = 15
      Top = 79
      Width = 273
      Height = 50
      Caption = 'Conforme configurado em "ENVIA" no PlugIn'
      TabOrder = 15
      object Label27: TLabel
        Left = 9
        Top = 22
        Width = 39
        Height = 13
        Caption = 'IP Local'
      end
      object Label28: TLabel
        Left = 185
        Top = 22
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object edIPLocal2: TEdit
        Left = 71
        Top = 20
        Width = 92
        Height = 21
        TabOrder = 0
      end
      object edPortaLocal2: TEdit
        Left = 214
        Top = 20
        Width = 35
        Height = 21
        TabOrder = 1
        Text = '6512'
      end
    end
    object Button4: TButton
      Left = 239
      Top = 136
      Width = 49
      Height = 23
      Caption = 'REC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 239
      Top = 160
      Width = 49
      Height = 25
      Caption = 'STOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnClick = Button6Click
    end
  end
  object Memo1: TMemo
    Left = 24
    Top = 438
    Width = 368
    Height = 105
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 404
    Top = 435
    Width = 244
    Height = 109
    Caption = ' Enviar comandos ao PlugIn'
    TabOrder = 3
    object Label24: TLabel
      Left = 11
      Top = 17
      Width = 179
      Height = 13
      Caption = 'Somente se tiver alguma linha ativada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btExitPlugIn: TButton
      Left = 8
      Top = 75
      Width = 109
      Height = 25
      Caption = 'Finalizar PlugIn'
      Enabled = False
      TabOrder = 0
      OnClick = btExitPlugInClick
    end
    object btHideIcon: TButton
      Left = 7
      Top = 41
      Width = 109
      Height = 25
      Caption = 'Ocultar icone'
      Enabled = False
      TabOrder = 1
      OnClick = btHideIconClick
    end
    object btShowIcon: TButton
      Left = 125
      Top = 40
      Width = 109
      Height = 25
      Caption = 'Mostrar icone'
      Enabled = False
      TabOrder = 2
      OnClick = btShowIconClick
    end
    object Button2: TButton
      Left = 127
      Top = 75
      Width = 109
      Height = 25
      Caption = 'Ajuda do PlugIn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object EditRunPlugIn: TEdit
    Left = 24
    Top = 29
    Width = 241
    Height = 21
    TabOrder = 4
    Text = 'C:\PlugInRepeater\PlugInBraiDRepeater.exe'
  end
  object Button5: TButton
    Left = 520
    Top = 28
    Width = 128
    Height = 25
    Caption = 'Excutar PlugIn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object EditReg: TEdit
    Left = 278
    Top = 29
    Width = 225
    Height = 21
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 595
    Width = 660
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
  end
end
