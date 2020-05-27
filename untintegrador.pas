unit untintegrador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, EditBtn, Buttons, DBGrids, Spin, ComCtrls, IdSASLSKey,
  IdMessage, DateTimePicker, rxcurredit, RxPopupNotifier, rxdbgrid, LCLType,
  IdAttachment, IdSSLOpenSSL, Grids, DBCtrls, ComboEx, IniFiles, eventlog,
  Laz2_DOM, laz2_XMLRead, laz2_XMLWrite, fpjson, jsonparser, jsonscanner,
  simpleipc, typinfo, Menus, PopupNotifier, ZDataset, ZConnection, edateedit,
  numericedit, NumericLabeledEdit, LabeledComboBox, MaskLabeledEdit,
  FileNameLabeledEdit, ZDbcIntfs, uDWResponseTranslator, uRESTDWServerEvents,
  uRESTDWBase, uRESTDWPoolerDB, IDText, IdWhois, IdHTTP, IdGlobal, uDWConsts,
  IdComponent, Messages, IdAuthentication, IdIPAddrMon, IdHTTPServer,
  IdUDPServer, ShellAPI, LazUTF8, CheckBoxThemed, MaskUtils, StrUtils,
  DateUtils, winsock, contnrs, JwaTlHelp32, process, Windows, syncobjs, gqueue,
  IdSocketHandle;

const
  WM_ICONMESSAGES = WM_USER + 100;

type
  TCustomNotifyIconDataW = record
    cbSize: DWORD;
    hWnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    hIcon: HICON;
    szTip: array [0..127] of WideChar;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array [0..255] of WideChar;
    u: record
         case longint of
           0: ( uTimeout : UINT );
           1: ( uVersion : UINT );
          end;
    szInfoTitle: array[0..63] of WideChar;
    dwInfoFlags: DWORD;
  end;

type
  TTipoLog = (tlResultado, tlInformativo, tlStatus, tlErro);

type
  { TfrmIntegrador }
  TfrmIntegrador = class(TForm)
    btn_LimparLog: TSpeedButton;
    btn_ResetarParametros: TSpeedButton;
    btn_StartStopAPIServer: TSpeedButton;
    btn_GravarParametros: TSpeedButton;
    btn_StartStopSincronizacao: TSpeedButton;
    CheckB_EncodaBase64: TCheckBox;
    CheckB_ServidorAPI: TCheckBox;
    CheckB_Sincronizacao: TCheckBox;
    CheckB_TerminateProcessOnClose: TCheckBox;
    CheckB_LogaErro: TCheckBox;
    CheckB_LogaResultado: TCheckBox;
    CheckB_LogaInformativo: TCheckBox;
    CheckB_LogaStatus: TCheckBox;
    ed_PlugInClassName: TLabeledEdit;
    ed_PlugInWindowName: TLabeledEdit;
    fned_CaminhoInstalacao: TFileNameLabeledEdit;
    gb_API: TGroupBox;
    gb_Integracao: TGroupBox;
    gb_Sistema: TGroupBox;
    lb_ServerIP: TLabel;
    ned_PortLinha1: TNumericLabeledEdit;
    ned_PortLinha2: TNumericLabeledEdit;
    ned_PortLinha3: TNumericLabeledEdit;
    ned_PortLinha4: TNumericLabeledEdit;
    ned_PortLinha5: TNumericLabeledEdit;
    ned_PortLinha6: TNumericLabeledEdit;
    ned_LimiteLOG: TNumericLabeledEdit;
    UDPServer: TIdUDPServer;
    ImagemTray: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ed_Registro: TLabeledEdit;
    lb_VersaoEXE: TLabel;
    lb_VersaoRESTDW: TLabel;
    lb_VersaoINDY: TLabel;
    m_LogAPI: TMemo;
    m_Parametros: TMemo;
    NumericEdit2: TNumericEdit;
    ned_ServicePort: TNumericLabeledEdit;
    PageControl1: TPageControl;
    pnl_Cabecalho: TPanel;
    pnl_Cabecalho1: TPanel;
    pnl_Corpo: TPanel;
    ServiceNotification: TRESTDWServiceNotification;
    ServicePooler: TRESTServicePooler;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btn_GravarParametrosClick(Sender: TObject);
    procedure btn_ResetarParametrosClick(Sender: TObject);
    procedure btn_StartStopAPIServerClick(Sender: TObject);
    procedure btn_StartStopSincronizacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure PreencherParametros;
    procedure PreencherParametrosVisuais;
    procedure GravarParametros;
    procedure GravarParametrosVisuais;
    procedure StartStopAPIServer;
    procedure StartStopSincronizacao;
    procedure OnTerminateLogThread(Sender: TObject);
    procedure ExibeHintTrayIcon(CustomHint: String; NoSound: Boolean = False);
    procedure EnviarParaTray;
    procedure RemoverTray(Restaurar: Boolean = True);
    procedure InsereLOG(Log: String; TipoLog: TTipoLog; APILog: Boolean = False);
    procedure ExecTerminateProcess;
    procedure UDPServerAfterBind(Sender: TObject);
    procedure UDPServerBeforeBind(AHandle: TIdSocketHandle);
    procedure UDPServerStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure UDPServerUDPException(AThread: TIdUDPListenerThread;
      ABinding: TIdSocketHandle; const AMessage: String;
      const AExceptionClass: TClass);
    procedure UDPServerUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
  private
    boIconAdded: Boolean;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure wmIconMessages(var Msg: TMessage); message WM_ICONMESSAGES;
  public
    vdbPort: Integer;
    vdbHostname,
    vdbDatabase,
    vdbUser,
    vdbPassword,
    vdbProtocol,
    vdbLib: String;
    //Integracao
    Registro,
    CaminhoInstalacao,
    PlugInClassName,
    PlugInWindowName: String;
    PortLinha1,
    PortLinha2,
    PortLinha3,
    PortLinha4,
    PortLinha5,
    PortLinha6: Integer;
    //API
    LogaStatus,
    LogaInformativo,
    LogaResultado,
    LogaErro,
    EncodaBase64: Boolean;
    //Sistema
    TerminateProcessOnClose,
    ServidorAPI,
    Sincronizacao: Boolean;
    LimiteLOG: Integer;
  end;

type
  TQueueList = specialize TQueue<String>;

  { TThreadedMsgEvent }

  TThreadedMsgEvent = class(TThread)
  private
    FLock: TCriticalSection;
    FQueueList: TQueueList;
    FErrorCount: Integer;
    FMemo: TMemo;
    function GetEvent: String;
    procedure InsereTextoLog;
  protected
    procedure Execute; override;
  public
    procedure AddEvent(LoggedMsg: String; Error: Boolean = False);
    constructor Create(aMemo: TMemo);
    function IsTerminated: Boolean;
  end;

var
  frmIntegrador: TfrmIntegrador;
  LogThread: TThreadedMsgEvent;

  IsProcessando: Boolean = False;
  FecharAoTerminar: Boolean = False;

implementation

{$R *.lfm}

uses Funcoes, DComponent, DataModule, untdmrestdw;

Function GetIPAddress: String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of char;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
    Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;

{ TThreadedMsgEvent }

procedure TThreadedMsgEvent.InsereTextoLog;
begin
  if ((FMemo.Lines.Count > frmIntegrador.LimiteLOG) and (frmIntegrador.LimiteLOG > 0)) then begin
    FMemo.Lines.Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) +
    ' ##> LOG resetado ao chegar em ' + IntToStr(frmIntegrador.LimiteLOG) + ' registros. Número de erros acumulado: ' + IntToStr(FErrorCount);
  end;
  FMemo.Lines.Add(GetEvent);
end;

procedure TThreadedMsgEvent.AddEvent(LoggedMsg: String; Error: Boolean);
begin
  FLock.Acquire;
  if Error then
    Inc(FErrorCount);
  FQueueList.Push(LoggedMsg);
  FLock.Release;
end;

constructor TThreadedMsgEvent.Create(aMemo: TMemo);
begin
  inherited Create(True);

  FreeOnTerminate := True;

  FQueueList := TQueueList.Create;
  FLock := TCriticalSection.Create;
  FErrorCount := 0;
  FMemo := aMemo;
  Start;
end;

function TThreadedMsgEvent.IsTerminated: Boolean;
begin
  Result := Terminated;
end;

procedure TThreadedMsgEvent.Execute;
begin
  while not Terminated do begin
    try
      if (FQueueList.Size > 0) then begin
        if Assigned(FMemo) then
          Synchronize(@InsereTextoLog);
      end;
    except
    end;
    TThread.Sleep(1);
  end;
end;

function TThreadedMsgEvent.GetEvent: String;
begin
  FLock.Acquire;
  Result := FQueueList.Front;
  FQueueList.Pop;
  FLock.Release;
end;

{ TfrmIntegrador }

procedure TfrmIntegrador.FormCreate(Sender: TObject);
begin
  Self.Constraints.MaxHeight := Self.Height;
  Self.Constraints.MinHeight := Self.Height;
  IsProcessando := False;
  FecharAoTerminar := False;

  PreencherParametros;

  LogThread := TThreadedMsgEvent.Create(m_LogAPI);
  LogThread.OnTerminate := @OnTerminateLogThread;

  ServicePooler.ServerMethodClass := TdmRESTDW;
  if ServidorAPI then
    StartStopAPIServer;

  UDPServer.Active := False;
  if Sincronizacao then
    StartStopSincronizacao;
end;

procedure TfrmIntegrador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  gKeyPress := Key;
end;

procedure TfrmIntegrador.StartStopAPIServer;
begin
  if not ServicePooler.Active then begin
    btn_StartStopAPIServer.Caption := 'PAUSAR Servidor API';
    InsereLOG('API - Servidor: Iniciado no IP = "' + GetIPAddress + ':' + IntToStr(ServicePooler.ServicePort) + '"', tlStatus, True);
    ServicePooler.Active := True;
  end
  else begin
    btn_StartStopAPIServer.Caption := 'INICIAR Servidor API';
    InsereLOG('API - Servidor: Pausado', tlStatus, True);
    ServicePooler.Active := False;
  end;
end;

procedure TfrmIntegrador.StartStopSincronizacao;
var
  sHnd: HWND;
begin
  try
    sHnd := FindWindow(PChar(PlugInClassName), PChar(PlugInWindowName));

    if not FileExists(CaminhoInstalacao) then begin
      UDPServer.Active := False;
      btn_StartStopSincronizacao.Caption := 'INICIAR Sincronização';
      InsereLOG('Sincronização PlugInRepeater: Não foi possível encontrar o executável no Caminho de Instalação especificado', tlErro);
    end
    else if not UDPServer.Active then begin
      //try
      //  UDPServer.Free;
      //  UDPServer := nil;
      //except
      //end;
      //UDPServer := TIdUDPServer.Create(nil);
      //UDPServer.ThreadedEvent := True;
      //UDPServer.ReuseSocket   := rsTrue;

      //if UDPServer.Bindings.Count > 0 then begin
      //  UDPServer.Bindings.Items[0].Free;
      //  UDPServer.Bindings.Items[1].Free;
      //  UDPServer.Bindings.Items[2].Free;
      //  UDPServer.Bindings.Items[3].Free;
      //  UDPServer.Bindings.Items[4].Free;
      //  UDPServer.Bindings.Items[5].Free;
      //end;
      //UDPServer.Bindings.Add.Port := PortLinha1;
      //UDPServer.Bindings.Add.Port := PortLinha2;
      //UDPServer.Bindings.Add.Port := PortLinha3;
      //UDPServer.Bindings.Add.Port := PortLinha4;
      //UDPServer.Bindings.Add.Port := PortLinha5;
      //UDPServer.Bindings.Add.Port := PortLinha6;

      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha1;
      //end;
      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha2;
      //end;
      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha3;
      //end;
      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha4;
      //end;
      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha5;
      //end;
      //with UDPServer.Bindings.Add do begin
      //  IP := '127.0.0.1';
      //  Port := PortLinha6;
      //end;

      UDPServer.Active := True;

      if sHnd = 0 then
        ShellExecute(Handle, nil, PChar(CaminhoInstalacao), nil, PChar(Registro), SW_SHOWMINNOACTIVE);

      btn_StartStopSincronizacao.Caption := 'PAUSAR Sincronização';
      InsereLog('Sincronização PlugInRepeater: Sincronização com aparelhos iniciada', tlStatus);
    end
    else begin
      if sHnd <> 0 then
        SendMessage(sHnd, WM_CLOSE, 0, 0);
        //ShellExecute(Handle, nil, PChar(CaminhoInstalacao), nil, PChar(Registro), WM_CLOSE);

      UDPServer.Active := False;

      btn_StartStopSincronizacao.Caption := 'INICIAR Sincronização';
      InsereLog('Sincronização PlugInRepeater: Sincronização com aparelhos pausada', tlStatus);
    end;
  except
    on E: Exception do begin
      UDPServer.Active := False;
      btn_StartStopSincronizacao.Caption := 'INICIAR Sincronização';
      InsereLOG('Sincronização PlugInRepeater: Erro ao atualizar status de sincronização = "' + E.Message + '"', tlErro);
    end;
  end;


end;

procedure TfrmIntegrador.OnTerminateLogThread(Sender: TObject);
begin
  inherited;
  try
    RemoverTray(False);

    ServicePooler.Active := False;
    ServicePooler.Free;
    ServicePooler := nil;

    LogThread.FQueueList.Free;
    LogThread.FLock.Free;
    LogThread.FMemo.Free;

    LogThread.FQueueList := nil;
    LogThread.FLock := nil;
    LogThread.FMemo := nil;

    LogThread.Free;
    LogThread := nil;
  except
  end;
  Application.Terminate;
end;

procedure TfrmIntegrador.ExibeHintTrayIcon(CustomHint: String; NoSound: Boolean = False);
const
  NIIF_USER = $04;
var
  NotifyData: TCustomNotifyIconDataW;
begin
  if (boIconAdded) then begin
    NotifyData.cbSize := SizeOf(NotifyData);
    NotifyData.hWnd := Self.Handle;
    NotifyData.uID := 1;
    NotifyData.uFlags := NIF_INFO;
    NotifyData.u.uTimeout := 3000;
    StrPLCopy(NotifyData.szInfo, CustomHint, 255);
    StrPLCopy(NotifyData.szInfoTitle, Application.Title + ' - DSAT Sistemas', 63);
    NotifyData.dwInfoFlags := NIIF_USER;//NIIF_INFO
    if NoSound then
      NotifyData.dwInfoFlags := NotifyData.dwInfoFlags + NIIF_NOSOUND;
    Shell_NotifyIconW(NIM_MODIFY, @NotifyData);
  end;

  //if not TrayIcon.Visible then
  //  Exit;
  //TrayIcon.BalloonHint := CustomHint;
  //TrayIcon.ShowBalloonHint;
end;

procedure TfrmIntegrador.EnviarParaTray;
var
  NotifyData: TCustomNotifyIconDataW;
  RetornoShell: Boolean;
begin
  if not boIconAdded then begin
    FillChar(NotifyData, SizeOf(NotifyData), 0);
    NotifyData.cbSize := SizeOf(NotifyData);
    NotifyData.hWnd := Self.Handle;
    NotifyData.uID := 1;
    NotifyData.uFlags := NIF_MESSAGE or NIF_ICON;
    NotifyData.uFlags := NotifyData.uFlags or NIF_TIP;
    NotifyData.uCallbackMessage := WM_ICONMESSAGES;
    NotifyData.hIcon := ImagemTray.Picture.Icon.Handle;
    StrPLCopy(@NotifyData.szTip, PWideChar(UTF8ToUTF16(Application.Title + ' - DSAT Sistemas')), 127);
    RetornoShell := Shell_NotifyIconW(NIM_ADD, @NotifyData);
    if not RetornoShell then begin
      NotifyData.cbSize := SizeOf(TCustomNotifyIconDataW);
      StrPLCopy(@NotifyData.szTip, PWideChar(UTF8ToUTF16(Application.Title + ' - DSAT Sistemas')), 63);
      RetornoShell := Shell_NotifyIconW(NIM_MODIFY, @NotifyData);
    end;
    boIconAdded := RetornoShell;
    Self.Hide;
    Self.WindowState := wsMinimized;
  end;
  //TrayIcon.Visible := True;
end;

procedure TfrmIntegrador.RemoverTray(Restaurar: Boolean = True);
var
  NotifyData: TCustomNotifyIconDataW;
begin
  if (boIconAdded) then begin
    FillChar(NotifyData, SizeOf(NotifyData), 0);
    NotifyData.cbSize := SizeOf(TCustomNotifyIconDataW);
    NotifyData.hWnd := Self.Handle;
    NotifyData.uID := 1;
    if (Shell_NotifyIconW(NIM_DELETE, @NotifyData)) then begin
      boIconAdded := False;
      if Restaurar then begin
        FecharAoTerminar := False;
        Self.Show;
        Self.WindowState := wsNormal;
        Application.BringToFront;
      end;
    end;
  end;
  //TrayIcon.Visible := False;
end;

procedure TfrmIntegrador.InsereLOG(Log: String; TipoLog: TTipoLog;
  APILog: Boolean);
begin
  //if APILog then...
  if TipoLog = tlErro then begin
    if not LogaErro then
      Exit;
    Log := '!!> ' + Log;
  end
  else if TipoLog = tlStatus then begin
    if not LogaStatus then
      Exit;
    Log := '@@> ' + Log;
  end
  else if TipoLog = tlInformativo then begin
    if not LogaInformativo then
      Exit;
    Log := '##> ' + Log;
  end
  else if TipoLog = tlResultado then begin
    if not LogaResultado then
      Exit;
    Log := '>>> ' + Log;
  end;

  Log := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' ' + Log;

  try
    if Assigned(LogThread) then begin
      if ((LogThread.Finished) or (LogThread.IsTerminated)) then
        Exit;
    end
    else
      Exit;
  except
    Exit;
  end;

  LogThread.AddEvent(Log, TipoLog = tlErro);
end;

procedure TfrmIntegrador.ExecTerminateProcess;
begin
  if TerminateProcessOnClose then
    TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), GetCurrentProcessId), 0);
end;

procedure TfrmIntegrador.UDPServerAfterBind(Sender: TObject);
begin
  InsereLOG('Sincronização PlugInRepeater: AfterBind', tlInformativo);
end;

procedure TfrmIntegrador.UDPServerBeforeBind(AHandle: TIdSocketHandle);
begin
  InsereLOG('Sincronização PlugInRepeater: BeforeBind', tlInformativo);
end;

procedure TfrmIntegrador.UDPServerStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  InsereLOG('Sincronização PlugInRepeater: OnStatus = "' + AStatusText + '"', tlInformativo);
end;

procedure TfrmIntegrador.UDPServerUDPException(AThread: TIdUDPListenerThread;
  ABinding: TIdSocketHandle; const AMessage: String;
  const AExceptionClass: TClass);
begin
  InsereLOG('Sincronização PlugInRepeater: Exception = "' + AMessage   + '"', tlErro);
end;

procedure TfrmIntegrador.UDPServerUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  Dados,
  DadosDDD,
  DadosL1,
  DadosL2,
  DadosFone,
  ToBeLogged: String;
begin
  // showmessage('received on port: ' + inttostr(ABinding.port));
  // &&DATA_CODAREA->17@
  // &&DATA_PHONE->3829-6381@
  // &&L1_INDEX_PHONE->1738296381@
  // &&L2_INDEX_PHONE->1738296381@

  ToBeLogged := 'Sincronização PlugInRepeater: Dados processados -> "';

  Dados := BytesToString(AData); //Ler
  Dados := AnsiReplaceStr(Dados, '@', ''); //Remover "@" (Unit StrUtils)
  Dados := AnsiReplaceStr(Dados, '&', ''); //Remover "&" (Unit StrUtils)
  InsereLOG('Sincronização PlugInRepeater: Dados recebidos = "' + Dados + '"', tlResultado);

  //-----------------------------------------------------------------------------
  DadosDDD  := 'DATA_CODAREA->'; //Procurar DDD
  DadosFone := 'DATA_PHONE->';   //Procurar Phone
  DadosL1   := 'L1_INDEX_PHONE->';// Procurar linha 1 (aqui recebe, também, o DDD+Fone)
  DadosL2   := 'L2_INDEX_PHONE->';// Procurar linha 2 (aqui recebe, também, o DDD+Fone)
  //-----------------------------------------------------------------------------

  // nº  da Linha
  if(Pos(DadosL1, Dados) > 0) then
    ToBeLogged := ToBeLogged + 'Linha = 1 <> '
  else if(Pos(DadosL2, Dados) > 0) then
    ToBeLogged := ToBeLogged + 'Linha = 2 <> ';


  //DDD
  if(Pos(DadosDDD, Dados) > 0) then
    ToBeLogged := ToBeLogged + 'DDD = ' + Copy(Dados, Pos(DadosDDD, Dados) + Length(DadosDDD), 2) + ' <> ';

  //Fone
  if(Pos(DadosFone, Dados) > 0) then
   ToBeLogged := ToBeLogged + 'Fone = ' + Copy(Dados, Pos(DadosFone, Dados) + Length(DadosFone), 30) + ' <> ';

  //-- Porta que recebeu os dados (sem nunhuma utilidade...)
  ToBeLogged := ToBeLogged + 'Port = ' + IntToStr(ABinding.Port);

  InsereLOG(ToBeLogged + '"', tlResultado);
end;

procedure TfrmIntegrador.WMSysCommand(var Msg: TWMSysCommand);
begin
  case Msg.CmdType of
    61472: EnviarParaTray; //SC_MINIMIZE = 61472; messages.inc>defines.inc
    61728: RemoverTray; //SC_RESTORE = 61728; messages.inc>defines.inc
  end;
  inherited;
end;

procedure TfrmIntegrador.wmIconMessages(var Msg: TMessage);
begin
  case Msg.lParam of
    NIN_BALLOONUSERCLICK: RemoverTray;
    WM_LBUTTONUP: RemoverTray;
  end;
  inherited;
end;

procedure TfrmIntegrador.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  //CanClose := False;
  FecharAoTerminar := True;
  if IsProcessando then begin
    if MsgConfirmacao('Módulo em processamento', 'Deseja realmente fechar o módulo?' + #13#10 +
    '(Ele terminará de processar em segundo plano e irá se fechar sozinho)') then begin
      EnviarParaTray;
      ExibeHintTrayIcon('O integrador permanecerá aqui até a finalização do processamento atual. Depois, irá fechar sozinho!');
    end
    else
      FecharAoTerminar := False;
  end;
end;

procedure TfrmIntegrador.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ExecTerminateProcess;
end;

procedure TfrmIntegrador.btn_StartStopAPIServerClick(Sender: TObject);
begin
  StartStopAPIServer;
end;

procedure TfrmIntegrador.btn_StartStopSincronizacaoClick(Sender: TObject);
begin
  StartStopSincronizacao;
end;

procedure TfrmIntegrador.btn_ResetarParametrosClick(Sender: TObject);
begin
  PreencherParametrosVisuais;
  //MsgInformativo('Parâmetros restaurados com sucesso!');
end;

procedure TfrmIntegrador.btn_GravarParametrosClick(Sender: TObject);
begin
  if ServicePooler.Active then
    MsgInformativo('Pare o Servidor da API para poder gravar as configurações!')
  else begin
    GravarParametrosVisuais;
    MsgInformativo('Parâmetros gravados com sucesso!');
  end;
end;

procedure TfrmIntegrador.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    SelectNext(ActiveControl, True, True);
end;

procedure TfrmIntegrador.PreencherParametros;
var
  FilePath: String;
  Parametros: TIniFile;
begin
  VerificaParametros(m_Parametros);
  if not AbreConexaoLocal then begin
    Application.Terminate;
    Exit;
  end;
  FilePath := ExtractFilePath(Application.ExeName) + 'parametros.ini';
  If not FileExists(FilePath) then begin
    Application.Terminate;
    Exit;
  end;
  Parametros := TIniFile.Create(FilePath);
  try
    //Integracao
    Registro          := Parametros.ReadString('Integracao', 'Registro', '');
    CaminhoInstalacao := Parametros.ReadString('Integracao', 'CaminhoInstalacao', '');
    PlugInClassName   := Parametros.ReadString('Integracao', 'PlugInClassName', 'TFormBraiDPlugInFSK');
    PlugInWindowName  := Parametros.ReadString('Integracao', 'PlugInWindowName', 'FormBraiDPlugInFSK');
    PortLinha1        := Parametros.ReadInteger('Integracao', 'PortLinha1', 6511);
    PortLinha2        := Parametros.ReadInteger('Integracao', 'PortLinha2', 6512);
    PortLinha3        := Parametros.ReadInteger('Integracao', 'PortLinha3', 6513);
    PortLinha4        := Parametros.ReadInteger('Integracao', 'PortLinha4', 6514);
    PortLinha5        := Parametros.ReadInteger('Integracao', 'PortLinha5', 6514);
    PortLinha6        := Parametros.ReadInteger('Integracao', 'PortLinha6', 6516);
    //API
    ServicePooler.ServicePort := Parametros.ReadInteger('API', 'Port', 8082);
    LogaStatus                := Parametros.ReadString('API', 'LogaStatus', 'S') = 'S';
    LogaInformativo           := Parametros.ReadString('API', 'LogaInformativo', 'N') = 'S';
    LogaResultado             := Parametros.ReadString('API', 'LogaResultado', 'N') = 'S';
    LogaErro                  := Parametros.ReadString('API', 'LogaErro', 'S') = 'S';
    EncodaBase64              := Parametros.ReadString('API', 'EncodaBase64', 'S') = 'S';
    //Sistema
    TerminateProcessOnClose := Parametros.ReadString('Sistema', 'TerminateProcessOnClose', 'S') = 'S';
    ServidorAPI             := Parametros.ReadString('Sistema', 'ServidorAPI', 'S') = 'S';
    Sincronizacao           := Parametros.ReadString('Sistema', 'Sincronizacao', 'S') = 'S';
    LimiteLOG               := Parametros.ReadInteger('Sistema', 'LimiteLOG', 10000);
  finally
    try
      Parametros.Free;
      Parametros := nil;
    except
    end;
    PreencherParametrosVisuais;
  end;

  vdbHostname := dbHostname;
  vdbDatabase := dbDatabase;
  vdbUser     := dbUser;
  vdbPassword := dbPassword;
  vdbPort     := dbPort;
  vdbProtocol := dbProtocol;
  vdbLib      := dbLib;

  lb_VersaoEXE.Caption    := '' + GetBuildInfoAsString;
  lb_VersaoRESTDW.Caption := 'REST: ' + ServicePooler.VersionInfo;
  lb_VersaoINDY.Caption   := 'INDY: ' + gsIdVersion;
  lb_ServerIP.Caption     := 'IP: ' + GetIPAddress;
end;

procedure TfrmIntegrador.PreencherParametrosVisuais;
begin
  //Integracao
  ed_Registro.Text                := Registro;
  fned_CaminhoInstalacao.FileName := CaminhoInstalacao;
  ed_PlugInClassName.Text         := PlugInClassName;
  ed_PlugInWindowName.Text        := PlugInWindowName;
  ned_PortLinha1.AsInteger        := PortLinha1;
  ned_PortLinha2.AsInteger        := PortLinha2;
  ned_PortLinha3.AsInteger        := PortLinha3;
  ned_PortLinha4.AsInteger        := PortLinha4;
  ned_PortLinha5.AsInteger        := PortLinha5;
  ned_PortLinha6.AsInteger        := PortLinha6;
  //API
  ned_ServicePort.AsInteger           := ServicePooler.ServicePort;
  CheckB_LogaStatus.Checked           := LogaStatus;
  CheckB_LogaInformativo.Checked      := LogaInformativo;
  CheckB_LogaResultado.Checked        := LogaResultado;
  CheckB_LogaErro.Checked             := LogaErro;
  CheckB_EncodaBase64.Checked         := EncodaBase64;
  //Sistema
  CheckB_TerminateProcessOnClose.Checked  := TerminateProcessOnClose;
  CheckB_ServidorAPI.Checked              := ServidorAPI;
  CheckB_Sincronizacao.Checked            := Sincronizacao;
  ned_LimiteLOG.AsInteger                 := LimiteLOG;
end;

procedure TfrmIntegrador.GravarParametros;
var
  FilePath: String;
  Parametros: TIniFile;
begin
  VerificaParametros(m_Parametros);
  FilePath := ExtractFilePath(Application.ExeName) + 'parametros.ini';
  If not FileExists(FilePath) then begin
    Application.Terminate;
    Exit;
  end;
  Parametros := TIniFile.Create(FilePath);
  try
    //Integracao
    Parametros.WriteString('Integracao', 'Registro', Registro);
    Parametros.WriteString('Integracao', 'CaminhoInstalacao', CaminhoInstalacao);
    Parametros.WriteString('Integracao', 'PlugInClassName', PlugInClassName);
    Parametros.WriteString('Integracao', 'PlugInWindowName', PlugInWindowName);
    Parametros.WriteInteger('Integracao', 'PortLinha1', PortLinha1);
    Parametros.WriteInteger('Integracao', 'PortLinha2', PortLinha2);
    Parametros.WriteInteger('Integracao', 'PortLinha3', PortLinha3);
    Parametros.WriteInteger('Integracao', 'PortLinha4', PortLinha4);
    Parametros.WriteInteger('Integracao', 'PortLinha5', PortLinha5);
    Parametros.WriteInteger('Integracao', 'PortLinha6', PortLinha6);
    //API
    Parametros.WriteInteger('API', 'Port', ServicePooler.ServicePort);
    Parametros.WriteString('API', 'LogaStatus', BoolToStr(LogaStatus, 'S', 'N'));
    Parametros.WriteString('API', 'LogaInformativo', BoolToStr(LogaInformativo, 'S', 'N'));
    Parametros.WriteString('API', 'LogaResultado', BoolToStr(LogaResultado, 'S', 'N'));
    Parametros.WriteString('API', 'LogaErro', BoolToStr(LogaErro, 'S', 'N'));
    Parametros.WriteString('API', 'EncodaBase64', BoolToStr(EncodaBase64, 'S', 'N'));
    //Sistema
    Parametros.WriteString('Sistema', 'TerminateProcessOnClose', BoolToStr(TerminateProcessOnClose, 'S', 'N'));
    Parametros.WriteString('Sistema', 'ServidorAPI', BoolToStr(ServidorAPI, 'S', 'N'));
    Parametros.WriteString('Sistema', 'Sincronizacao', BoolToStr(Sincronizacao, 'S', 'N'));
    Parametros.WriteInteger('Sistema', 'LimiteLOG', LimiteLOG);
  finally
    try
      Parametros.Free;
      Parametros := nil;
    except
    end;
    PreencherParametrosVisuais;
  end;
end;

procedure TfrmIntegrador.GravarParametrosVisuais;
begin
  //Integracao
  Registro          := ed_Registro.Text;
  CaminhoInstalacao := fned_CaminhoInstalacao.FileName;
  PlugInClassName   := ed_PlugInClassName.Text;
  PlugInWindowName  := ed_PlugInWindowName.Text;
  PortLinha1        := ned_PortLinha1.AsInteger;
  PortLinha2        := ned_PortLinha2.AsInteger;
  PortLinha3        := ned_PortLinha3.AsInteger;
  PortLinha4        := ned_PortLinha4.AsInteger;
  PortLinha5        := ned_PortLinha5.AsInteger;
  PortLinha6        := ned_PortLinha6.AsInteger;
  //API
  ServicePooler.ServicePort := ned_ServicePort.AsInteger;
  LogaStatus                := CheckB_LogaStatus.Checked;
  LogaInformativo           := CheckB_LogaInformativo.Checked;
  LogaResultado             := CheckB_LogaResultado.Checked;
  LogaErro                  := CheckB_LogaErro.Checked;
  EncodaBase64              := CheckB_EncodaBase64.Checked;
  //Sistema
  TerminateProcessOnClose := CheckB_TerminateProcessOnClose.Checked;
  ServidorAPI             := CheckB_ServidorAPI.Checked;
  Sincronizacao           := CheckB_Sincronizacao.Checked;
  LimiteLOG               := ned_LimiteLOG.AsInteger;

  GravarParametros;
end;

end.

