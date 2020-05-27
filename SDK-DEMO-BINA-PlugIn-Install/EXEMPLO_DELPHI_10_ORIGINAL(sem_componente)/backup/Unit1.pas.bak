unit Unit1;

{$MODE Delphi}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, Vcl.StdCtrls, IdGlobal,
  IdSocketHandle, LCLIntf, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    IdUDPServer1: TIdUDPServer;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Edit4: TEdit;
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
memo1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 sHnd:HWND;
 S,Registro:String;
 I:INTEGER;

begin

 //----------------- Ler até 6 linhas --------------//
 // Placa de som 1
 IdUDPServer1.Bindings.add.port := 6511; // Linha 1
 IdUDPServer1.Bindings.add.port := 6512; // Linha 2

 // Placa de som 2
 IdUDPServer1.Bindings.add.port := 6513; // Linha 3
 IdUDPServer1.Bindings.add.port := 6514; // Linha 4

 //Plaxca de som 3
 IdUDPServer1.Bindings.add.port := 6515; // Linha 5
 IdUDPServer1.Bindings.add.port := 6516; // Linha 6



 // Ativa o leitor da porta
  IdUDPServer1.Active:=TRUE;

 //Executa o PlugIn com seu nº de registro no primeiro parametro
 Registro:='C04467PXXXXXXF-BRP20160506-SB';//(se não for um registro válido, rodará como DEMO)
 S:='C:\PlugInRepeater\PlugInBraiDRepeater.exe';

 //-- Verifica se o PlugIn está rodando -----------------------
 sHnd:=FindWindow(Pchar('TFormBraiDPlugInFSK'),PChar('FormBraiDPlugInFSK'));
 if(sHnd=0)then
     ShellExecute(Handle, nil, PChar(S), nil,Pchar(Registro), SW_SHOWNORMAL); // ShellExecute: Unit ShellAPI;


end;

procedure TForm1.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
S,sL1,sL2,sD,sF:string;

begin

// showmessage('received on port: ' + inttostr(ABinding.port));
 // &&DATA_CODAREA->17@
 // &&DATA_PHONE->3829-6381@
 // &&L1_INDEX_PHONE->1738296381@
 // &&L2_INDEX_PHONE->1738296381@

  S:=BytesToString(AData); //Ler
  S:=AnsiReplaceStr(S,'@',''); //Remover "@" (Unit StrUtils)
  S:=AnsiReplaceStr(S,'&',''); //Remover "&" (Unit StrUtils)
  memo1.Lines.Add(S);

 //-----------------------------------------------------------------------------
 sD:='DATA_CODAREA->'; //Procurar DDD
 sF:='DATA_PHONE->';   //Procurar Phone
 sL1:='L1_INDEX_PHONE->';// Procurar linha 1 (aqui recebe, também, o DDD+Fone)
 sL2:='L2_INDEX_PHONE->';// Procurar linha 2 (aqui recebe, também, o DDD+Fone)
 //-----------------------------------------------------------------------------

 // nº  da Linha
 if(POS(sL1,S)>0)then  Edit1.Text:='1'
 else if(POS(sL2,S)>0)then  Edit1.Text:='2';


 //DDD
 if(POS(sD,S)>0) then
   Edit2.Text:=Copy(S,POS(sD,S)+Length(sD),2);

 //Fone
 if(POS(sF,S)>0) then
   Edit3.Text:=Copy(S,POS(sF,S)+Length(sF),30);

 //-- Porta que recebeu os dados (sem nunhuma utilidade...)
 Edit4.Text:= inttostr(ABinding.port);
end;

end.
