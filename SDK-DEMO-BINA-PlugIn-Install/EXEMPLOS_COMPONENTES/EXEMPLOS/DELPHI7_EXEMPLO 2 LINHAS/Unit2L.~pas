unit Unit2L;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Repeater, ComCtrls,FileCtrl, ShellAPI, IniFiles,
  ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edRecebido1: TEdit;
    edLinha1: TEdit;
    edFormatFone1: TEdit;
    edStatus1: TEdit;
    edIndexFone1: TEdit;
    btHideView1: TButton;
    edTipo1: TEdit;
    edDDD1: TEdit;
    edFone1: TEdit;
    edRing1: TEdit;
    BraiDRepeater1: TBraiDRepeater;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edRecebido2: TEdit;
    edLinha2: TEdit;
    edFormatFone2: TEdit;
    edStatus2: TEdit;
    edIndexFone2: TEdit;
    btHideView2: TButton;
    edTipo2: TEdit;
    edDDD2: TEdit;
    edFone2: TEdit;
    edRing2: TEdit;
    BraiDRepeater2: TBraiDRepeater;
    btAtiva2: TButton;
    btDesativa2: TButton;
    btConfig2: TButton;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    EditRunPlugIn: TEdit;
    Button5: TButton;
    EditReg: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox4: TGroupBox;
    edIPRemoto2: TEdit;
    edPortaRemota2: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    edIPLocal2: TEdit;
    edPortaLocal2: TEdit;
    btAtiva1: TButton;
    btDesativa1: TButton;
    btConfig1: TButton;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    edIPRemoto1: TEdit;
    edPortaRemota1: TEdit;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edIPLocal1: TEdit;
    edPortaLocal1: TEdit;
    Label23: TLabel;
    btExitPlugIn: TButton;
    btHideIcon: TButton;
    btShowIcon: TButton;
    Button2: TButton;
    Label24: TLabel;
    Label29: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btAtiva1Click(Sender: TObject);
    procedure BraiDRepeater1a9OnIPMonitor(Sender: TObject;
      IPLocal: String);
    procedure BraiDRepeater2a9OnIPMonitor(Sender: TObject;
      IPLocal: String);
    procedure btAtiva2Click(Sender: TObject);
    procedure btDesativa1Click(Sender: TObject);
    procedure btDesativa2Click(Sender: TObject);
    procedure btConfig1Click(Sender: TObject);
    procedure btConfig2Click(Sender: TObject);
    procedure BraiDRepeater1a7OnAllEvents(Sender: TObject; Texto: String);
    procedure BraiDRepeater2a7OnAllEvents(Sender: TObject; Texto: String);
    procedure btExitPlugInClick(Sender: TObject);
    procedure btHideIconClick(Sender: TObject);
    procedure btShowIconClick(Sender: TObject);
    procedure BraiDRepeater1a2DetectPhone(Sender: TObject; Line, Tipo, DDD,
      Phone: String);
    procedure BraiDRepeater2a2DetectPhone(Sender: TObject; Line, Tipo, DDD,
      Phone: String);
    procedure BraiDRepeater1a3OnFormatPhone(Sender: TObject; Line,
      PhoneFormat: String; DTMF, FSK: Boolean);
    procedure BraiDRepeater2a3OnFormatPhone(Sender: TObject; Line,
      PhoneFormat: String; DTMF, FSK: Boolean);
    procedure BraiDRepeater1a4OnKeyEvent(Sender: TObject; Line,
      Key: String);
    procedure BraiDRepeater2a4OnKeyEvent(Sender: TObject; Line,
      Key: String);
    procedure BraiDRepeater1a5OnFileRec(Sender: TObject; Line, FileName,
      Duraction: String);
    procedure BraiDRepeater2a5OnFileRec(Sender: TObject; Line, FileName,
      Duraction: String);
    procedure BraiDRepeater1a6OnRing(Sender: TObject; Line: String;
      RingCount: Integer);
    procedure BraiDRepeater2a6OnRing(Sender: TObject; Line: String;
      RingCount: Integer);
    procedure BraiDRepeater1a8OnSTatusEvent(Sender: TObject; Line,
      Status: String);
    procedure BraiDRepeater2a8OnSTatusEvent(Sender: TObject; Line,
      Status: String);
    procedure BraiDRepeater1a9OnIndexPhone(Sender: TObject; Line,
      IndexPhone: String);
    procedure BraiDRepeater2a9OnIndexPhone(Sender: TObject; Line,
      IndexPhone: String);
    procedure Button2Click(Sender: TObject);
    procedure btHideView1Click(Sender: TObject);
    procedure btHideView2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UnitCH;



{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
HWin1,HWin2:UINT;
ini:TIniFile;
StrIni:string;
begin
 edIPLocal1.Text:=BraiDRepeater1.a6Local_IP;
 edIPLocal2.Text:=BraiDRepeater2.a6Local_IP;

 {ATENÇÃO !!
 Se estiver usando o PlugIn e o seu aplicativo na mesma máquina,
 então o IP Local e Remoto são os mesmos.
 Caso contrário, indique o IP onde está o PlugIn}
 edIPRemoto1.Text := edIPLocal1.Text;
 edIPRemoto2.Text := edIPLocal2.Text;


 {-- Verifique se o BraiD ou o PlugIn está rodando....  }
 HWin1:=FindWindow('TFormBraiDFSK','FormBraiDFSK');
 HWin2:=FindWindow('TFormBraiDPlugInFSK','FormBraiDPlugInFSK');
 btAtiva1.Enabled:= (HWin1<>0)OR(HWin2<>0);
 btAtiva2.Enabled:= (HWin1<>0)OR(HWin2<>0);


 {Pega o numero do seu Registro.
  - Você não precisa usar desta forma. Isto é feito somente para facilitar
    a distribuilção dos exemplo.
  - Veja no botão "Executar PlugIn" com fazser semunsar arquivo .INI}

  StrIni:= ExtractFilePath(ParamStr(0))+'REGISTRO.INI';
  Ini:=TIniFile.Create(StrIni);
  EditReg.Text:= Ini.ReadString('REGISTRO','Reg','');
  Ini.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 //Executa o PlugIn com o seu numero de registro no primeiro parâmetro
 BraiDRepeater1.StartPlugIn(EditRunPlugIn.Text,EditReg.Text);
 btAtiva1.Enabled:=TRUE;
 btAtiva2.Enabled:=TRUE;

end;

procedure TForm1.btAtiva1Click(Sender: TObject);
var
S:string;
HWin1,HWin2:UINT;
begin


 {-- Verifique se o BraiD ou o PlugIn está rodando....  }
 HWin1:=FindWindow('TFormBraiDFSK','FormBraiDFSK');
 HWin2:=FindWindow('TFormBraiDPlugInFSK','FormBraiDPlugInFSK');

 if(HWin1=0)and(HWin2=0)then begin
   MessageBox(Handle, 'Você deve executar o PlugIn antes de ativar este aplicativo.','PlugIn não está ativo',MB_ICONERROR+MB_OK);
   exit;
 end;


 {- Limpa }
 Memo1.Clear;
 
 {-- Desabilita  aviso do FireWall. Use da forma desejada...
 NÃO FAÇA ISTO NO Vista ou Windows 7--------------------}
 // BraiDRepeater1.UnLookFireWall(Application.ExeName,edPortaLocal1.Text,FALSE);

{-- Setagem das Portas e do IP --------------------------------------------------}
 BraiDRepeater1.a5Local_Port := StrToIntDef(edPortaLocal1.Text,0);
 BraiDRepeater1.a4Remote_Port := StrToIntDef(edPortaRemota1.Text,0);
 BraiDRepeater1.a3Remote_IP:=edIPRemoto1.Text;

 {- Seta o número da linha, de 1 a 6, da qual vai receber os eventos ---------}
 BraiDRepeater1.a0NumberLine:=1;

 {-- Ativa a linha 1 ---------------------------------------------------------}
 BraiDRepeater1.BraiDConnect(edIPRemoto1.Text,BraiDRepeater1.a0NumberLine);

 {-- Habilita/desabilita botões -----------------}
 btAtiva1.Enabled := not BraiDRepeater1.Active;
 btDesativa1.Enabled := BraiDRepeater1.Active;
 btConfig1.Enabled := BraiDRepeater1.Active;
 BraiDRepeater1.Enabled := BraiDRepeater1.Active;

 

end;

procedure TForm1.BraiDRepeater1a9OnIPMonitor(Sender: TObject;
  IPLocal: String);
begin
 {Monitor de IP}
 edIPLocal1.Text:=IPLocal;

 {ATENÇÃO !!
 Se estiver usando o PlugIn e o seu aplicativo na mesma máquina,
 então o IP Local e Remoto são os mesmos.
 Caso contrário, indique o IP onde está o PlugIn}
 edIPRemoto1.Text := edIPLocal1.Text;

end;

procedure TForm1.BraiDRepeater2a9OnIPMonitor(Sender: TObject;
  IPLocal: String);
begin
 {Monitor de IP}
 edIPLocal2.Text:=IPLocal;
 {ATENÇÃO !!
 Se estiver usando o PlugIn e o seu aplicativo na mesma máquina,
 então o IP Local e Remoto são os mesmos.
 Caso contrário, indique o IP onde está o PlugIn}
 edIPRemoto2.Text := edIPLocal2.Text;

end;

procedure TForm1.btAtiva2Click(Sender: TObject);
var
S:string;
HWin1,HWin2:UINT;
begin

 {-- Verifique se o BraiD ou o PlugIn está rodando....  }
 HWin1:=FindWindow('TFormBraiDFSK','FormBraiDFSK');
 HWin2:=FindWindow('TFormBraiDPlugInFSK','FormBraiDPlugInFSK');

 if(HWin1=0)and(HWin2=0)then begin
   MessageBox(Handle, 'Você deve executar o PlugIn antes de ativar este aplicativo.','PlugIn não está ativo',MB_ICONERROR+MB_OK);
   exit;
 end;

 {- Limpa }
 Memo1.Clear;
 

 {-- Desabilita  aviso do FireWall. Use da forma desejada...
 NÃO FAÇA ISTO NO Vista ou Windows 7--------------------}
// BraiDRepeater2.UnLookFireWall(Application.ExeName,edPortaLocal1.Text,FALSE);

{-- Setagem das Portas e do IP --------------------------------------------------}
 BraiDRepeater2.a5Local_Port := StrToIntDef(edPortaLocal2.Text,0);
 BraiDRepeater2.a4Remote_Port := StrToIntDef(edPortaRemota2.Text,0);
 BraiDRepeater2.a3Remote_IP:=edIPRemoto2.Text;

 {- Seta o número da linha, de 1 a 6, da qual vai receber os eventos ---------}
 BraiDRepeater2.a0NumberLine:=2;

 {-- Ativa a linha 2 ---------------------------------------------------------}
 BraiDRepeater2.BraiDConnect(edIPRemoto2.Text,BraiDRepeater2.a0NumberLine);

 {-- Habilita/desabilita botões -----------------}
 btAtiva2.Enabled := not BraiDRepeater2.Active;
 btDesativa2.Enabled := BraiDRepeater2.Active;
 btConfig2.Enabled := BraiDRepeater2.Active;
 BraiDRepeater2.Enabled := BraiDRepeater2.Active;
end;

procedure TForm1.btDesativa1Click(Sender: TObject);
begin
 {-- Remove a autorização de uso da porta ----------------------------------------------}
 //BraiDRepeater1.LookFireWall(Application.ExeName,IntToStr(BraiDRepeater1.a5Local_Port));
   {-- Não use em Vista / Windows 7 !!}

 // !!! Use sempre isto durante os testes, senão irá encher o registro do windows
 //     de portas aberta e não utilizadas, ficarão restritas ao Repeater !!.
 //     Depois de tudo acertado, então é bom não remover a autorização, pois outro
 //     aplicativo poderá ocupar a porta, daí tem que configurar tudo de novo !!
 {--------------------------------------------------------------------------------------}

 {--- Desconecta do BraiD for repeaters ----------------------------------------}
 BraiDRepeater1.BraiDDisConnect(BraiDRepeater1.a0NumberLine);
 {------------------------------------------------------------------------------}


 {-- Habilita / desabilita botões ------ }
  btAtiva1.Enabled := TRUE;
 
end;

procedure TForm1.btDesativa2Click(Sender: TObject);
begin
 {-- Remove a autorização de uso da porta ----------------------------------------------}
// BraiDRepeater2.LookFireWall(Application.ExeName,IntToStr(BraiDRepeater2.a5Local_Port));
   {-- Não use em Vista / Windows 7 !!}

 // !!! Use sempre isto durante os testes, senão irá encher o registro do windows
 //     de portas aberta e não utilizadas, ficarão restritas ao Repeater !!.
 //     Depois de tudo acertado, então é bom não remover a autorização, pois outro
 //     aplicativo poderá ocupar a porta, daí tem que configurar tudo de novo !!
 {--------------------------------------------------------------------------------------}

 {--- Desconecta do BraiD for repeaters ----------------------------------------}
 BraiDRepeater2.BraiDDisConnect(BraiDRepeater2.a0NumberLine);

 {-- Habilita / desabilita botões ------ }
  btAtiva2.Enabled := TRUE;

 {------------------------------------------------------------------------------}

end;

procedure TForm1.btConfig1Click(Sender: TObject);
begin
{- Abre tela de configuração do PlugIn ou do BraiD}
 BraiDRepeater1.ShowConfig(BraiDRepeater1.a0NumberLine);
end;

procedure TForm1.btConfig2Click(Sender: TObject);
begin
{- Abre tela de configuração do PlugIn ou do BraiD}
 BraiDRepeater2.ShowConfig(BraiDRepeater2.a0NumberLine);
end;

procedure TForm1.BraiDRepeater1a7OnAllEvents(Sender: TObject;
  Texto: String);
begin
 {-- Log ----------------}
 Memo1.Lines.Add(Texto);
 if(POS('BRAID_CONNECTED_WITH_SUCESS->',Texto)>0)then begin
   btHideIcon.Enabled:=TRUE;
   btShowIcon.Enabled:=TRUE;
   btExitPlugIn.Enabled:=TRUE;
 end;


 {-- Habilita / desabilita botões ------ }
 if(POS('L1_BRAID_IP_REMOVED->',Texto)>0)then begin
    btAtiva1.Enabled := TRUE;
    btDesativa1.Enabled := FALSE;
    btConfig1.Enabled := FALSE;
    edPortaLocal1.Enabled:=TRUE;
    edIPRemoto1.Enabled:=TRUE;
    edPortaRemota1.Enabled:=TRUE;
 end;

 //////-------------------------------------------------------////

 if(POS('STATUS_ON_HOOK',Texto)>0)then begin
   edStatus1.Text:='ON_HOOK';

 end;

 /////-------------------------------------------------------////


end;

procedure TForm1.BraiDRepeater2a7OnAllEvents(Sender: TObject;
  Texto: String);
begin
 {-- Log ----------------}
 Memo1.Lines.Add(Texto);

 if(POS('BRAID_CONNECTED_WITH_SUCESS->',Texto)>0)then begin
   btHideIcon.Enabled:=TRUE;
   btShowIcon.Enabled:=TRUE;
   btExitPlugIn.Enabled:=TRUE;
 end;



 {-- Habilita / desabilita botões ------ }
 if(POS('L2_BRAID_IP_REMOVED->',Texto)>0)then begin
    btAtiva2.Enabled := TRUE;
    btDesativa2.Enabled := FALSE;
    btConfig2.Enabled := FALSE;
    edPortaLocal2.Enabled:=TRUE;
    edIPRemoto2.Enabled:=TRUE;
    edPortaRemota2.Enabled:=TRUE;
 end;

end;

procedure TForm1.btExitPlugInClick(Sender: TObject);
begin
{Finaliza o PlugIn ou o BraiD}
 BraiDRepeater1.StopPlugIn;
 BraiDRepeater2.StopPlugIn;

end;

procedure TForm1.btHideIconClick(Sender: TObject);
begin
{Ocultar o  icone do PlugIn ao lado do relógio}
BraiDRepeater1.PlugInIconVisible(FALSE);
end;

procedure TForm1.btShowIconClick(Sender: TObject);
begin
{Mostrar o icone do PlugIn ao lado do relógio}
BraiDRepeater1.PlugInIconVisible(TRUE);
end;

{-- Ao detectar o Fone Linha 1 ----- }
procedure TForm1.BraiDRepeater1a2DetectPhone(Sender: TObject; Line, Tipo,
  DDD, Phone: String);
begin
  edLinha1.Text:= Line;
  edTipo1.Text := Tipo;
  edDDD1.Text  := DDD;
  edFone1.Text := Phone;
end;

{-- Ao detectar o Fone Linha 2 -----}
procedure TForm1.BraiDRepeater2a2DetectPhone(Sender: TObject; Line, Tipo,
  DDD, Phone: String);
begin
  edLinha2.Text:= Line;
  edTipo2.Text := Tipo;
  edDDD2.Text  := DDD;
  edFone2.Text := Phone;
end;

{-- Ao detectar o fone Formatado Linha 1 -------}
procedure TForm1.BraiDRepeater1a3OnFormatPhone(Sender: TObject; Line,
  PhoneFormat: String; DTMF, FSK: Boolean);
begin
 edLinha1.Text := Line;
 edFormatFone1.Text :=PhoneFormat;


 {Usando os eventos}
 Form2.EditLinha.Text := Line;
 Form2.EditFormat.Text:= PhoneFormat;
 Form2.lbTipoChamada.Caption:='Efetuada';
 Form2.Show;
{------------------------------------------------------------------------------
  Use "DTMF" e "FSK" para descobrir o tipo de sinalização detectada !!
  Exemplo: Se DTMF = True -> Bina DTMF (Padrão Brasileiro);
           Ou, se FSK = True -> Caller ID FSK (BellCore202 ou Bell202)
-------------------------------------------------------------------------------}
end;

{-- Ao detectar o fone Formatado Linha 2 -------}
procedure TForm1.BraiDRepeater2a3OnFormatPhone(Sender: TObject; Line,
  PhoneFormat: String; DTMF, FSK: Boolean);
begin
 edLinha2.Text := Line;
 edFormatFone2.Text :=PhoneFormat;
{------------------------------------------------------------------------------
  Use "DTMF" e "FSK" para descobrir o tipo de sinalização detectada !!
  Exemplo: Se DTMF = True -> Bina DTMF (Padrão Brasileiro);
           Ou, se FSK = True -> Caller ID FSK (BellCore202 ou Bell202)
-------------------------------------------------------------------------------}

end;

{-- Ao detectar as teclas digitadas no telefone Linha 1 ------------}
procedure TForm1.BraiDRepeater1a4OnKeyEvent(Sender: TObject; Line,
  Key: String);
begin
  edRecebido1.Text := edRecebido1.Text+key;
  edLinha1.Text:=Line;
end;

{-- Ao detectar as teclas digitadas no telefone Linha 2 ------------}
procedure TForm1.BraiDRepeater2a4OnKeyEvent(Sender: TObject; Line,
  Key: String);
begin
  edRecebido2.Text := edRecebido2.Text+key;
  edLinha2.Text:=Line;
end;

{-- Nome do arquivo de gravação em curso Linha 1}
procedure TForm1.BraiDRepeater1a5OnFileRec(Sender: TObject; Line, FileName,
  Duraction: String);
begin
Panel1.Caption :=FileName+ ' - Duração: '+Duraction;
end;

{-- Nome do arquivo de gravação em curso Linha 2}
procedure TForm1.BraiDRepeater2a5OnFileRec(Sender: TObject; Line, FileName,
  Duraction: String);
begin
Panel1.Caption :=FileName+ ' - Duração: '+Duraction;
end;

{-- Contador de Ring Linha 1 --------------}
procedure TForm1.BraiDRepeater1a6OnRing(Sender: TObject; Line: String;
  RingCount: Integer);
begin
 edLinha1.Text:=Line;
 edRing1.Text:= IntToStr(RingCount);
end;

{-- Contador de Ring Linha 2 --------------}
procedure TForm1.BraiDRepeater2a6OnRing(Sender: TObject; Line: String;
  RingCount: Integer);
begin
 edLinha2.Text:=Line;
 edRing2.Text:= IntToStr(RingCount);
end;

procedure TForm1.BraiDRepeater1a8OnSTatusEvent(Sender: TObject; Line,
  Status: String);
begin
{-- Todos os enventos de STATUS recebidos -------------------------------------}
 edStatus1.Text:=Status;
 edLinha1.Text:=Line;

 {Escolha abaixo o que deseja fazer ao receber...}
 if(POS('DIALTONE',     Status)>0)then {Tom de discar}
    begin
      //Exemplo: Limpa resultados anteriores
       edLinha1.Clear;
       edFormatFone1.Clear;
       edIndexFone1.Clear;
       edRecebido1.Clear;
       edLinha1.Clear;
       edTipo1.Clear;
       edDDD1.Clear;
       edFone1.Clear;
       Memo1.Clear;
    end;
 if(POS('BINA_DTMF',Status)>0)then {Início de Bina DTMF}
    begin
      //... Exemplo:
     edLinha1.Clear;
     edFormatFone1.Clear;
     edIndexFone1.Clear;
     edRecebido1.Clear;
     edLinha1.Clear;
     edTipo1.Clear;
     edDDD1.Clear;
     edFone1.Clear;
    end;
 if(POS('CALLER_ID_FSK',Status)>0)then {Início de Caller ID FSK}
    begin
     //....
    end;
 if(POS('RING_COUNT',   Status)>0)then {Contador de Ring - Campainha }
    begin
    //....
    end;
 if(POS('OFF_HOOK',     Status)>0)then {Fone NO gancho}
    begin
      //... Exemplo:
     edLinha1.Clear;
     edFormatFone1.Clear;
     edIndexFone1.Clear;
     edRecebido1.Clear;
     edLinha1.Clear;
     edTipo1.Clear;
     edDDD1.Clear;
     edFone1.Clear;
    end;
 if(POS('ON_HOOK',      Status)>0)then {Fone FORA do gancho}
    begin
    //....
    end;
 if(POS('RECORD_START',Status)>0)then {Início de uma gravação mp3 }
    begin
    // (! O nome do arquivo está no evento em "a5_OnFileRec")....
    end;
 if(POS('RECORD_STOP', Status)>0)then {Final de uma gravação mp3}
     begin
     // (! O nome do arquivo está no evento em "a5_OnFileRec")....
     end;

end;

procedure TForm1.BraiDRepeater2a8OnSTatusEvent(Sender: TObject; Line,
  Status: String);
begin
{-- Todos os enventos de STATUS recebidos -------------------------------------}
 edStatus2.Text:=Status;
 edLinha2.Text:=Line;

 {Escolha abaixo o que deseja fazer ao receber...}
 if(POS('DIALTONE', Status)>0)then {Tom de discar}
    begin
      //Exemplo: Limpa resultados anteriores
       edLinha2.Clear;
       edFormatFone2.Clear;
       edIndexFone2.Clear;
       edRecebido2.Clear;
       edLinha2.Clear;
       edTipo2.Clear;
       edDDD2.Clear;
       edFone2.Clear;
       Memo1.Clear;
    end;
 if(POS('BINA_DTMF',Status)>0)then {Início de Bina DTMF}
    begin
      //... Exemplo:
     edLinha2.Clear;
     edFormatFone2.Clear;
     edIndexFone2.Clear;
     edRecebido2.Clear;
     edLinha2.Clear;
     edTipo2.Clear;
     edDDD2.Clear;
     edFone2.Clear;
    end;
 if(POS('CALLER_ID_FSK',Status)>0)then {Início de Caller ID FSK}
    begin
     //....
    end;
 if(POS('RING_COUNT',   Status)>0)then {Contador de Ring - Campainha }
    begin
    //....
    end;
 if(POS('OFF_HOOK',     Status)>0)then {Fone NO gancho}
    begin
      //Exemplo: Limpa resultados anteriores
       edLinha2.Clear;
       edFormatFone2.Clear;
       edIndexFone2.Clear;
       edRecebido2.Clear;
       edLinha2.Clear;
       edTipo2.Clear;
       edDDD2.Clear;
       edFone2.Clear;
      
    end;
 if(POS('ON_HOOK',      Status)>0)then {Fone FORA do gancho}
    begin
    //....
    end;
 if(POS('RECORD_START',Status)>0)then {Início de uma gravação mp3 }
    begin
    // (! O nome do arquivo está no evento em "a5_OnFileRec")....
    end;
 if(POS('RECORD_STOP', Status)>0)then {Final de uma gravação mp3}
     begin
     // (! O nome do arquivo está no evento em "a5_OnFileRec")....
     end;


end;

{-- Ao receber o DDD+Fone (sem formatação) Linha 1 ------------------}
procedure TForm1.BraiDRepeater1a9OnIndexPhone(Sender: TObject; Line,
  IndexPhone: String);
begin
 edLinha1.Text:=Line;
 edIndexFone1.Text:=IndexPhone;

 {Usando os eventos --}
 Form2.EditLinha.Text := Line;
 Form2.EditIndice.Text:= IndexPhone;
 Form2.lbTipoChamada.Caption:='Recebida';
 Form2.Show;
end;

{-- Ao receber o DDD+Fone (sem formatação) Linha 2 ------------------}
procedure TForm1.BraiDRepeater2a9OnIndexPhone(Sender: TObject; Line,
  IndexPhone: String);
begin
 edLinha2.Text:=Line;
 edIndexFone2.Text:=IndexPhone
end;

procedure TForm1.Button2Click(Sender: TObject);
var
S:string;
begin
 {-- Arquivo de ajuda do PlugIn ---------------}
 S:='C:\PlugInRepeater\AJUDA\PlugInRepeaters.chm';
 ShellExecute(Application.Handle, nil, PChar(S), nil, nil, SW_SHOWNORMAL)

end;

{-- Ocultar/Mostrar o componente linha 1 ------------- }
procedure TForm1.btHideView1Click(Sender: TObject);
begin
 BraiDRepeater1.Visible:= not BraiDRepeater1.Visible;
end;

{-- Ocultar/Mostrar o componente linha 2 ------------- }
procedure TForm1.btHideView2Click(Sender: TObject);
begin
 BraiDRepeater2.Visible:= not BraiDRepeater2.Visible;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
arq:string;
begin
 {Inicia a gravação na linha 1 - Faça exatamente com baixo}
  arq:='C:\NOME_DA_PASTA\NOME_DO_ARQUIVO.MP3';
 BraiDRepeater1.SendData('START_REC->'+arq);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 {Parara a gravação em modo manual LINHA 1}
 BraiDRepeater1.SendData('STOP_REC->');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
arq:string;
begin
 {Inicia a gravação na linha 1 - Faça exatamente com baixo}
 arq:='C:\NOME_DA_PASTA\NOME_DO_ARQUIVO.MP3';
 BraiDRepeater2.SendData('START_REC->'+arq);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 {Parara a gravação em modo manual LINHA 1}
 BraiDRepeater2.SendData('STOP_REC->');

end;

end.
