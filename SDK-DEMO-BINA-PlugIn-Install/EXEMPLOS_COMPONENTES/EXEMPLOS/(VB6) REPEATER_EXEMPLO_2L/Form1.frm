VERSION 5.00
Object = "{D8368EC4-250E-4669-8F6E-9ADB8AF3FECC}#1.0#0"; "BraiDRepeater.ocx"
Begin VB.Form Form1 
   Caption         =   "Exemplo de uso do PlugIn BraiD for Repeaters (VB6)"
   ClientHeight    =   8790
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9600
   LinkTopic       =   "Form1"
   ScaleHeight     =   8790
   ScaleWidth      =   9600
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Linha 2"
      Height          =   4695
      Left            =   4920
      TabIndex        =   37
      Top             =   1200
      Width           =   4095
      Begin BraiDRepeater.BraiDRepeaterX BraiDRepeaterX2 
         Height          =   315
         Left            =   120
         TabIndex        =   55
         Top             =   240
         Width           =   2055
         Active          =   0   'False
         a0NumberLine    =   1
         a1DDDLocal      =   ""
         a2PlugInPath    =   ""
         a3Remote_IP     =   "192.168.2.2"
         a4Remote_Port   =   0
         a5Local_Port    =   0
         a6Local_IP      =   "192.168.2.2"
         a7Calling       =   0   'False
         a8InternetAcess =   0   'False
         a9HostBraiD     =   0   'False
         AutoComplete    =   -1  'True
         AutoDropDown    =   0   'False
         AutoCloseUp     =   0   'False
         BevelInner      =   2
         BevelKind       =   0
         BevelOuter      =   1
         Style           =   0
         CharCase        =   0
         Color           =   0
         Ctl3D           =   -1  'True
         DragCursor      =   -12
         Object.DragMode        =   0
         DropDownCount   =   8
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ImeMode         =   3
         ImeName         =   ""
         ItemHeight      =   13
         ItemIndex       =   -1
         MaxLength       =   0
         ParentColor     =   0   'False
         ParentCtl3D     =   -1  'True
         Sorted          =   0   'False
         Text            =   "(00) 0000-0000"
         Object.Visible         =   -1  'True
         SelText         =   ""
         DroppedDown     =   0   'False
         SelLength       =   0
         SelStart        =   0
         DoubleBuffered  =   0   'False
      End
      Begin VB.TextBox TextRING2 
         Height          =   300
         Left            =   3480
         TabIndex        =   54
         Top             =   3600
         Width           =   375
      End
      Begin VB.TextBox TextTeclas2 
         Height          =   300
         Left            =   120
         TabIndex        =   53
         Top             =   4200
         Width           =   3735
      End
      Begin VB.TextBox TextFormat2 
         Height          =   300
         Left            =   960
         TabIndex        =   52
         Top             =   3555
         Width           =   1935
      End
      Begin VB.TextBox TextLinha2 
         BackColor       =   &H0000FFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3480
         TabIndex        =   51
         Top             =   3165
         Width           =   375
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Ocultar/Mostrar"
         Height          =   300
         Left            =   2400
         TabIndex        =   50
         Top             =   240
         Width           =   1455
      End
      Begin VB.TextBox TextIndice2 
         BackColor       =   &H0000FFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   1440
         TabIndex        =   49
         Top             =   3165
         Width           =   1455
      End
      Begin VB.TextBox TextStatus2 
         Height          =   300
         Left            =   2520
         TabIndex        =   48
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton btConfig3 
         Caption         =   "Configurar"
         Height          =   300
         Left            =   1440
         TabIndex        =   47
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox TextTipo2 
         Height          =   300
         Left            =   120
         TabIndex        =   46
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox TextDDD2 
         Height          =   300
         Left            =   600
         TabIndex        =   45
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox TextFone2 
         Height          =   300
         Left            =   1080
         TabIndex        =   44
         Top             =   2760
         Width           =   1215
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Desativar"
         Height          =   300
         Left            =   2760
         TabIndex        =   43
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Ativar"
         Height          =   300
         Left            =   120
         TabIndex        =   42
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox TextPortaRemota2 
         Height          =   285
         Left            =   3360
         TabIndex        =   41
         Text            =   "3822"
         Top             =   1440
         Width           =   495
      End
      Begin VB.TextBox TextIPRemoto2 
         Height          =   285
         Left            =   2160
         TabIndex        =   40
         Text            =   "0"
         Top             =   1440
         Width           =   1095
      End
      Begin VB.TextBox TextPortaLocal2 
         Height          =   285
         Left            =   3360
         TabIndex        =   39
         Text            =   "6512"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox TextIPLocal2 
         Height          =   285
         Left            =   2160
         TabIndex        =   38
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label21 
         Caption         =   "Conforme configurado em ""Envia"" no PlugIn"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   67
         Top             =   1050
         Width           =   3735
      End
      Begin VB.Label Label19 
         Caption         =   "Conforme configurado em ""Recebe"" no PlugIn"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   65
         Top             =   1740
         Width           =   3735
      End
      Begin VB.Label Label17 
         Caption         =   "RING"
         Height          =   255
         Left            =   3000
         TabIndex        =   63
         Top             =   3650
         Width           =   495
      End
      Begin VB.Label Label16 
         Caption         =   "Teclas recebidas"
         Height          =   255
         Left            =   120
         TabIndex        =   62
         Top             =   3960
         Width           =   1335
      End
      Begin VB.Label Label15 
         Caption         =   "Formatado"
         Height          =   180
         Left            =   120
         TabIndex        =   61
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Label14 
         Caption         =   "Linha"
         Height          =   255
         Left            =   3000
         TabIndex        =   60
         Top             =   3210
         Width           =   495
      End
      Begin VB.Label Label13 
         Caption         =   "IP e Porta Remota (PugIn)"
         Height          =   255
         Left            =   120
         TabIndex        =   59
         Top             =   1455
         Width           =   1935
      End
      Begin VB.Label Label12 
         Caption         =   "IP e Porta Local"
         Height          =   255
         Left            =   720
         TabIndex        =   58
         Top             =   750
         Width           =   1335
      End
      Begin VB.Label Label33 
         Caption         =   "Tipo, DDD   Fone                         Status"
         Height          =   255
         Left            =   120
         TabIndex        =   57
         Top             =   2520
         Width           =   3615
      End
      Begin VB.Label Label11 
         Caption         =   "DDD+Fone (bina)"
         Height          =   255
         Left            =   120
         TabIndex        =   56
         Top             =   3210
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Finalizar o PlugIn"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Left            =   7080
      TabIndex        =   36
      Top             =   7560
      Width           =   1935
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Mostrar Icone do PlugIn"
      Height          =   325
      Left            =   7080
      TabIndex        =   35
      Top             =   7080
      Width           =   1935
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Ocultar Icone do PlugIn"
      Height          =   325
      Left            =   7080
      TabIndex        =   34
      Top             =   6600
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Caption         =   "Linha 1"
      Height          =   4695
      Left            =   600
      TabIndex        =   5
      Top             =   1200
      Width           =   4095
      Begin BraiDRepeater.BraiDRepeaterX BraiDRepeaterX1 
         Height          =   315
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   2055
         Active          =   0   'False
         a0NumberLine    =   1
         a1DDDLocal      =   ""
         a2PlugInPath    =   ""
         a3Remote_IP     =   "192.168.2.2"
         a4Remote_Port   =   0
         a5Local_Port    =   0
         a6Local_IP      =   "192.168.2.2"
         a7Calling       =   0   'False
         a8InternetAcess =   0   'False
         a9HostBraiD     =   0   'False
         AutoComplete    =   -1  'True
         AutoDropDown    =   0   'False
         AutoCloseUp     =   0   'False
         BevelInner      =   2
         BevelKind       =   0
         BevelOuter      =   1
         Style           =   0
         CharCase        =   0
         Color           =   0
         Ctl3D           =   -1  'True
         DragCursor      =   -12
         Object.DragMode        =   0
         DropDownCount   =   8
         Enabled         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ImeMode         =   3
         ImeName         =   ""
         ItemHeight      =   13
         ItemIndex       =   -1
         MaxLength       =   0
         ParentColor     =   0   'False
         ParentCtl3D     =   -1  'True
         Sorted          =   0   'False
         Text            =   "(00) 0000-0000"
         Object.Visible         =   -1  'True
         SelText         =   ""
         DroppedDown     =   0   'False
         SelLength       =   0
         SelStart        =   0
         DoubleBuffered  =   0   'False
      End
      Begin VB.TextBox TextRING1 
         Height          =   300
         Left            =   3480
         TabIndex        =   30
         Top             =   3600
         Width           =   375
      End
      Begin VB.TextBox TextTeclas1 
         Height          =   300
         Left            =   120
         TabIndex        =   28
         Top             =   4200
         Width           =   3735
      End
      Begin VB.TextBox TextFormat1 
         Height          =   300
         Left            =   1080
         TabIndex        =   26
         Top             =   3555
         Width           =   1815
      End
      Begin VB.TextBox TextLinha1 
         BackColor       =   &H0000FFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3480
         TabIndex        =   25
         Top             =   3165
         Width           =   375
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Ocultar/Mostrar"
         Height          =   300
         Left            =   2400
         TabIndex        =   23
         Top             =   240
         Width           =   1455
      End
      Begin VB.TextBox TextIndice1 
         BackColor       =   &H0000FFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   1440
         TabIndex        =   18
         Top             =   3165
         Width           =   1455
      End
      Begin VB.TextBox TextStatus1 
         Height          =   300
         Left            =   2520
         TabIndex        =   17
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton btConfig1 
         Caption         =   "Configurar"
         Height          =   300
         Left            =   1440
         TabIndex        =   16
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox TextTipo1 
         Height          =   300
         Left            =   120
         TabIndex        =   15
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox TextDDD1 
         Height          =   300
         Left            =   600
         TabIndex        =   14
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox TextFone1 
         Height          =   300
         Left            =   1080
         TabIndex        =   13
         Top             =   2760
         Width           =   1215
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Desativar"
         Height          =   300
         Left            =   2760
         TabIndex        =   12
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Ativar"
         Height          =   300
         Left            =   120
         TabIndex        =   11
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox TextPortaRemota1 
         Height          =   285
         Left            =   3360
         TabIndex        =   9
         Text            =   "3821"
         Top             =   1440
         Width           =   495
      End
      Begin VB.TextBox TextIPRemoto1 
         Height          =   285
         Left            =   2160
         TabIndex        =   8
         Text            =   "0"
         Top             =   1440
         Width           =   1095
      End
      Begin VB.TextBox TextPortaLocal1 
         Height          =   285
         Left            =   3360
         TabIndex        =   7
         Text            =   "6511"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox TextIPLocal1 
         Height          =   285
         Left            =   2160
         TabIndex        =   6
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label20 
         Caption         =   "Conforme configurado em ""Envia"" no PlugIn"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   66
         Top             =   1050
         Width           =   3735
      End
      Begin VB.Label Label18 
         Caption         =   "Conforme configurado em ""Recebe"" no PlugIn"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   64
         Top             =   1740
         Width           =   3735
      End
      Begin VB.Label Label9 
         Caption         =   "RING"
         Height          =   255
         Left            =   3000
         TabIndex        =   31
         Top             =   3650
         Width           =   495
      End
      Begin VB.Label Label8 
         Caption         =   "Teclas recebidas"
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   3960
         Width           =   1335
      End
      Begin VB.Label Label7 
         Caption         =   "Formatado"
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "Linha"
         Height          =   255
         Left            =   3000
         TabIndex        =   24
         Top             =   3210
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "IP e Porta Remota (PugIn)"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   1455
         Width           =   1935
      End
      Begin VB.Label Label4 
         Caption         =   "IP e Porta Local"
         Height          =   255
         Left            =   720
         TabIndex        =   21
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label3 
         Caption         =   "Tipo, DDD   Fone                         Status"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   2520
         Width           =   3615
      End
      Begin VB.Label Label2 
         Caption         =   "DDD+Fone (bina)"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   3210
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Limpar"
      Height          =   325
      Left            =   7080
      TabIndex        =   3
      Top             =   6120
      Width           =   1935
   End
   Begin VB.ListBox ListLog 
      Height          =   2010
      ItemData        =   "Form1.frx":0000
      Left            =   600
      List            =   "Form1.frx":0002
      TabIndex        =   2
      Top             =   6120
      Width           =   6375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Ativar PlugIn"
      Height          =   300
      Left            =   7800
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox TextPlugIn 
      Height          =   285
      Left            =   600
      TabIndex        =   0
      Text            =   "E:\PlugInRepeater\PlugInBraiDRepeater.exe /C44350E000P-BRP-002-20090803-SB"
      Top             =   720
      Width           =   7095
   End
   Begin VB.Label LabelFileRec 
      AutoSize        =   -1  'True
      Caption         =   "Arquivo de gravação"
      Height          =   195
      Left            =   600
      TabIndex        =   33
      Top             =   8160
      Width           =   1485
   End
   Begin VB.Label Label10 
      Caption         =   "Log"
      Height          =   255
      Left            =   600
      TabIndex        =   32
      Top             =   5880
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Informe o caminho e o nome do PlugIn com seu registro no primeiro parâmetro (como abaixo) e clique em ""Ativar PlugIn"
      Height          =   255
      Left            =   600
      TabIndex        =   4
      Top             =   360
      Width           =   8535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BraiDRepeaterX1_a2DetectPhone(ByVal Line As String, ByVal Tipo As String, ByVal DDD As String, ByVal Phone As String)
    TextTipo1.Text = Tipo
    TextDDD1.Text = DDD
    TextFone1.Text = Phone
    TextLinha1.Text = Line
End Sub

Private Sub BraiDRepeaterX1_a3OnFormatPhone(ByVal Line As String, ByVal PhoneFormat As String, ByVal DTMF As Boolean, ByVal FSK As Boolean)
    TextFormat1.Text = PhoneFormat
    TextLinha1.Text = Line
End Sub

Private Sub BraiDRepeaterX1_a4OnKeyEvent(ByVal Line As String, ByVal Key As String)
    TextTeclas1.Text = TextTeclas1.Text + Key
End Sub

Private Sub BraiDRepeaterX1_a5OnFileRec(ByVal Line As String, ByVal FileName As String, ByVal Duraction As String)
    ' Nome do arquivo de gravação em curso
    LabelFileRec.Caption = FileName
End Sub

Private Sub BraiDRepeaterX1_a6OnRing(ByVal Line As String, ByVal RingCount As Long)
    'Contador de Ring (Campainha)
    TextRING1.Text = RingCount
End Sub

Private Sub BraiDRepeaterX1_a7OnAllEvents(ByVal Texto As String)
    'Todos os eventos recebidos
    ListLog.AddItem Texto
End Sub

Private Sub BraiDRepeaterX1_a8OnSTatusEvent(ByVal Line As String, ByVal Status As String)
    ' Status
    TextStatus1.Text = Status
End Sub

Private Sub BraiDRepeaterX1_a9OnIndexPhone(ByVal Line As String, ByVal IndexPhone As String)
    ' DDD+Fone
    TextIndice1.Text = IndexPhone
    ' Linha
    TextLinha1.Text = Line
End Sub

Private Sub BraiDRepeaterX1_a9OnIPMonitor(ByVal IPLocal As String)
    ' Monitor do IP local
    TextIPLocal1.Text = BraiDRepeaterX1.a6Local_IP
End Sub

Private Sub BraiDRepeaterX2_a2DetectPhone(ByVal Line As String, ByVal Tipo As String, ByVal DDD As String, ByVal Phone As String)
    TextTipo2.Text = Tipo
    TextDDD2.Text = DDD
    TextFone2.Text = Phone
    TextLinha2.Text = Line
End Sub

Private Sub BraiDRepeaterX2_a3OnFormatPhone(ByVal Line As String, ByVal PhoneFormat As String, ByVal DTMF As Boolean, ByVal FSK As Boolean)
    TextFormat2.Text = PhoneFormat
    TextLinha2.Text = Line
End Sub

Private Sub BraiDRepeaterX2_a4OnKeyEvent(ByVal Line As String, ByVal Key As String)
    TextTeclas2.Text = TextTeclas2.Text + Key
End Sub

Private Sub BraiDRepeaterX2_a5OnFileRec(ByVal Line As String, ByVal FileName As String, ByVal Duraction As String)
    ' Nome do arquivo de gravação em curso
    LabelFileRec.Caption = FileName
End Sub

Private Sub BraiDRepeaterX2_a6OnRing(ByVal Line As String, ByVal RingCount As Long)
    'Contador de Ring (Campainha)
    TextRING2.Text = RingCount
End Sub

Private Sub BraiDRepeaterX2_a7OnAllEvents(ByVal Texto As String)
    'Todos os eventos recebidos
    ListLog.AddItem Texto
End Sub

Private Sub BraiDRepeaterX2_a8OnSTatusEvent(ByVal Line As String, ByVal Status As String)
    ' Status
    TextStatus2.Text = Status
End Sub

Private Sub BraiDRepeaterX2_a9OnIndexPhone(ByVal Line As String, ByVal IndexPhone As String)
    ' DDD+Fone
    TextIndice2.Text = IndexPhone
    ' Linha
    TextLinha2.Text = Line
End Sub

Private Sub BraiDRepeaterX2_a9OnIPMonitor(ByVal IPLocal As String)
    ' Monitor do IP local
    TextIPLocal2.Text = BraiDRepeaterX2.a6Local_IP
End Sub

Private Sub btConfig1_Click()
    ' Abretela de configuração (1=Placa1... 2=Placa2... 3=Placa3)
    BraiDRepeaterX1.ShowConfig (1)
End Sub

Private Sub btConfig3_Click()
    ' Abretela de configuração (1=Placa1... 2=Placa2... 3=Placa3)
    BraiDRepeaterX2.ShowConfig (2)

End Sub

Private Sub Command1_Click()
  ' S = BraiDRepeaterX1.StartPlugIn(TextPlugIn.Text, TextRegistry.Text)
   Shell TextPlugIn.Text
End Sub

Private Sub Command10_Click()
    ' Limpa de resultados
    ListLog.Clear

    ' Desativar linha 2
    BraiDRepeaterX2.BraiDDisConnect (BraiDRepeaterX2.a0NumberLine)

End Sub

Private Sub Command11_Click()
    ' Ocultar/Mostrar o controle AcvtiveX
    BraiDRepeaterX2.Visible = Not BraiDRepeaterX2.Visible
End Sub

Private Sub Command2_Click()
Dim S As Boolean
    ' Limpa de resultados
    ListLog.Clear
    
     
    ' Número da linha
    BraiDRepeaterX1.a0NumberLine = 1
    
    ' IP onde o PlugIn está instalado
    BraiDRepeaterX1.a3Remote_IP = TextIPRemoto1.Text
    
    ' Porta onde o PlugIn RECEBE
    BraiDRepeaterX1.a4Remote_Port = TextPortaRemota1.Text
    
    ' Porta onde o PlugIn ENVIA
    BraiDRepeaterX1.a5Local_Port = TextPortaLocal1.Text
    
    ' Ativa o detector para linha 1
    S = BraiDRepeaterX1.BraiDConnect(TextIPRemoto1.Text, 1)
End Sub

Private Sub Command3_Click()
    ' Limpa de resultados
    ListLog.Clear

    ' Desativar linha 1
    BraiDRepeaterX1.BraiDDisConnect (BraiDRepeaterX1.a0NumberLine)
End Sub

Private Sub Command4_Click()
   ' Limpa de resultados linha 1
    ListLog.Clear
    TextTipo1.Text = Empty
    TextDDD1.Text = Empty
    TextFone1.Text = Empty
    TextStatus1.Text = Empty
    TextIndice1.Text = Empty
    TextRING1.Text = Empty
    TextFormat1.Text = Empty
    TextTeclas1.Text = Empty
    
    ' Limpa de resultados linha 2
    TextTipo2.Text = Empty
    TextDDD2.Text = Empty
    TextFone2.Text = Empty
    TextStatus2.Text = Empty
    TextIndice2.Text = Empty
    TextRING2.Text = Empty
    TextFormat2.Text = Empty
    TextTeclas2.Text = Empty
    
    
End Sub

Private Sub Command5_Click()
    ' Ocultar/Mostrar o controle AcvtiveX
    BraiDRepeaterX1.Visible = Not BraiDRepeaterX1.Visible
End Sub

Private Sub Command6_Click()
    ' Oculta o ícone do PlugIn
    BraiDRepeaterX1.PlugInIconVisible (False)
End Sub

Private Sub Command7_Click()
    ' Mostra oícone do PlugIn
    BraiDRepeaterX1.PlugInIconVisible (True)
End Sub

Private Sub Command8_Click()
    BraiDRepeaterX1.StopPlugIn
End Sub

Private Sub Command9_Click()
Dim S As Boolean
    ' Limpa de resultados
    ListLog.Clear
    
     
    ' Número da linha
    BraiDRepeaterX2.a0NumberLine = 2
    
    ' IP onde o PlugIn está instalado
    BraiDRepeaterX2.a3Remote_IP = TextIPRemoto2.Text
    
    ' Porta onde o PlugIn RECEBE
    BraiDRepeaterX2.a4Remote_Port = TextPortaRemota2.Text
    
    ' Porta onde o PlugIn ENVIA
    BraiDRepeaterX2.a5Local_Port = TextPortaLocal2.Text
    
    ' Ativa o detector para linha 1
    S = BraiDRepeaterX2.BraiDConnect(TextIPRemoto1.Text, 2)

End Sub

Private Sub Form_Load()
    ' Pega o IP local
    TextIPLocal1.Text = BraiDRepeaterX1.a6Local_IP
    TextIPLocal2.Text = BraiDRepeaterX2.a6Local_IP
    
    ' Atenção ! Aqui você deve inserir o IP da máquina
    ' onde está instalado o BraiD PlugIn. Se esle estiver nesta
    ' mesma máquina, então o IP Local e IP Remoto serão os mesmos
    TextIPRemoto1.Text = TextIPLocal1.Text
    TextIPRemoto2.Text = TextIPLocal2.Text
    ' Não se esqueça que você deve configurar as Portas e IP's
    ' no PlugIn primeiro.
End Sub

