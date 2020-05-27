unit Repeater;

// Vers�o: 1.5 ->28/06/2009 ------------


interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Graphics, ExtCtrls, ComCtrls, IdBaseComponent,IdSocketHandle,
  {IdAntiFreezeBase, IdAntiFreeze,}IdComponent,IdUDPServer,
  IdIPWatch,  Messages, Registry,StrUtils,WinSock, DIALOGS;

 type
  TAllEvents = procedure(Sender: TObject; Texto: string) of object;
  THandShakeEvent = procedure(Sender: TObject; RemoteIP, RemotePort: string) of object;
  TDetectPhone = procedure(Sender: TObject; Line, Tipo, DDD, Phone: string) of object;
  TFormatPhone = procedure(Sender: TObject; Line, PhoneFormat: string; DTMF, FSK: Boolean) of object;
  TIndexPhone = procedure(Sender: TObject; Line, IndexPhone: string) of object;
  TIPMonitor = procedure(Sender: TObject; IPLocal: string) of object;
  TKeyEvent = procedure(Sender: TObject; Line, Key: string) of object;
  TFileRecEvent = procedure(Sender: TObject; Line, FileName, Duraction:string) of object;
  TRingCount = procedure(Sender: TObject; Line:string; RingCount:integer) of object;
  TSTatusEvent = procedure(Sender: TObject; Line, Status: string) of object;
  TErrorEvent = procedure(Sender: TObject; rError: string) of object;
  TDataFriends = procedure(Sender: TObject; vFilter,vLine, vDate, vOpr, vDDD, vPhone, vName, vCity, vCountry, vTimeInit, vStatus : string) of object;

 type
  TSendEvents = (seAll,seHnd, seDePhone, seFormat, seNome);

type
  TBraiDRepeater = class(TComboBox)
  private

    BufLen: integer;
    MsgSize: integer;
    kData: Tmemorystream;
    fSendEvents : TSendEvents;
    fSendText : string;
    fSendText1 : string;
    fSendnLine : string;
    fTipyEvent : integer;

    fActive: boolean;
    fIP: string;
    fHost : string;
    fMonitorIP   : string;
    fnLine : integer;

    fDDD : string;
    fPlugIn : string;
    fNetAcess : boolean;
    fUnlookUDP : boolean;

    fErrorEvent: TErrorEvent;
    fHandShake: THandShakeEvent;
    fDetectPhone: TDetectPhone;
    fFormatPhone: TFormatPhone;
    fIndexPhone : TIndexPhone;
    fKeyEvent: TKeyEvent;
    fFileRecEvent: TFileRecEvent;
    fRingCount: TRingCount;
    fsTatusEvent : TsTatusEvent;
    fstatus: TAllEvents;
    fDataFriends:TDataFriends;
    fIPMonitor : TIPMonitor;
    vrFriends : Array[0..20] of string;

    fLocal: integer;
    fPort: integer;
    fCalled: TAllEvents;
    fAccepted: TAllEvents;
    fSelf: boolean;
    Fended: TAllEvents;
    fCaller: boolean;


    fLocalip: string;
    gip: string;
    gPort: integer;
    fAllEvents: TAllEvents;
    gSelf: boolean;
    UDPNM   : TIdUDPServer;

    fTimerMonitorIP : TTimer;
    fTimerSendEvents : TTimer;
    Fpinglocal: integer;
    Fpingremote: integer;
    fHostBraiD:Boolean;
    fInsereIP : Boolean; {Inserir IP}
    fInsereCount:Integer; {Envia 3 vezes a notifica��o de inserir}

    { Private declarations }
  protected
    procedure OnTimerMonitorIP(Sender: TObject);
    procedure OnTimerSendEvents(Sender: TObject);
    procedure SetDDDLocal(const Value: string);
    procedure SetPathPlugIn(const Value: string);
    procedure ReceiveIP(var S: string);
    procedure ReceiveData(S: string);
    procedure SetIP(const Value: string);

    procedure SetPort(const Value: integer);
    procedure SetnLine(const Value: integer);
    procedure SetLocalPort(const Value: integer);
    procedure SetActive(const Value: boolean);
    procedure SetNetAcess(const Value: boolean);
    procedure SetUnlookUDP(const Value: boolean);
    procedure SetCaller(const Value: boolean);
    procedure SetHostBraiD(const Value: boolean);
    procedure nmStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);

    function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;

    procedure nmDataReceived(Sender: TObject; AData: TStream;
                       ABinding: TIdSocketHandle);


    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SendData(S: string);
    function BraiDConnect(IP: string;Line:Integer):Boolean;
    function BraiDDisConnect(Line:integer):Boolean;
    procedure ViewIPLocal;
    procedure UnLookFireWall(App,Port:string; InternetAcess: Boolean);
    procedure LookFireWall(App,Port:string);
    procedure ShowConfig(Device:integer);
    procedure StopDevice(Device:integer);
    procedure StartDevice(Device:integer);
    procedure StartPlugIn(PathApp, Registry:string);
    procedure StopPlugIn;
    procedure PlugInIconVisible(Visible:Boolean);

    { Public declarations }
    property Active: Boolean read fActive write SetActive default False;
  published
    property a0NumberLine : Integer read fnLine write SetnLine;
    property a1DDDLocal: string read fDDD write SetDDDLocal;
    property a2PlugInPath: string read fPlugIn write SetPathPlugIn;
    property a3Remote_IP: string read fIP write SetIP;
    property a4Remote_Port: integer read fport write SetPort;
    property a5Local_Port: integer read flocal write SetlocalPort;
    property a6Local_IP: string read fLocalIP write fLocalIP;
    property a7Calling: boolean read fCaller write SetCaller default False;
    property a8InternetAcess: boolean read fNetAcess write SetNetAcess default FALSE;
    property a9HostBraiD : boolean read fHostBraiD write SetHostBraiD default FALSE;

    property a0OnDataFriends: TDataFriends read fDataFriends write fDataFriends;
    property a1OnHandShake: THandShakeEvent read fHandShake write fHandShake;
    property a2DetectPhone: TDetectPhone read fDetectPhone write fDetectPhone;
    property a3OnFormatPhone: TFormatPhone read fFormatPhone write fFormatPhone;
    property a4OnKeyEvent: TKeyEvent read fKeyEvent write fKeyEvent;
    property a5OnFileRec: TFileRecEvent read fFileRecEvent write fFileRecEvent;
    property a6OnRing: TRingCount read fRingCount write fRingCount;
    property a7OnAllEvents: TAllEvents read fAllEvents write fAllEvents;
    property a8OnSTatusEvent: TSTatusEvent read fSTatusEvent write fSTatusEvent;
    property a9OnIndexPhone: TIndexPhone read fIndexPhone write fIndexPhone;
    property a9OnIPMonitor: TIPMonitor read fIPMonitor write fIPMonitor;
  end;

procedure Register; 

implementation

procedure Register;
begin
 RegisterComponents('Sibel', [TBraiDRepeater]);
end;

{Autoriza o uso da porta no FireWall (XP) -------------------------------------}
procedure TBraiDRepeater.UnLookFireWall(App,Port:string; InternetAcess: Boolean);
var
Reg : TRegistry;
ap, SubNet:string;
begin

  SubNet:=':LocalSubNet:Enabled:';
  {Autorizer acesso somente via rede local ou *.*}
  if(InternetAcess)then SubNet:=':*:Enabled:';

  ap := AnsiReplaceStr(App, '.exe', '');
  ap:= ExtractFileName(Ap)+' '+Port+' UDP';

  {Criar porta UDP e autoriza��o FireWell -------------------------}
  begin
   Reg := TRegistry.Create;
   try
    { Define a chave-raiz do registro }
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    { Abre uma chave (path). Se n�o existir cria e abre. }
    Reg.OpenKey('\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List',true);
    { Grava os dados (o registro) }
    Reg.WriteString(Port+':UDP',Port+SubNet+ap);
   finally
    Reg.Free;
   end;
   Reg := TRegistry.Create;
   try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List',true);
    Reg.WriteString(Application.ExeName,Application.ExeName+SubNet+ap);
   finally
    Reg.Free;
   end;
  end;
end;

{-- P�ra os detectores de deetrmida placa de som: Device = 1, 2 ou 3 ----}
procedure TBraiDRepeater.StopDevice(Device:integer);
begin
 SendData('L'+IntToStr(fnLine)+'_STOP_DEVICE->'+IntToStr(Device));
end;

{-- Reinicia os detectores de deetrmida placa de som: Device = 1, 2 ou 3 ----}
procedure TBraiDRepeater.StartDevice(Device:integer);
begin
 SendData('L'+IntToStr(fnLine)+'_START_DEVICE->'+IntToStr(Device));
end;

{-- Abre tela de configura��o de determinada placa de som: Device = 1, 2 ou 3 ----}
procedure TBraiDRepeater.ShowConfig(Device:integer);
begin
 SendData('L'+IntToStr(fnLine)+'_OPEN_CONFIG->'+IntToStr(Device));
end;

{-- Inicia o PlugIn ou o BraiD --
PathApp = Caminho completo e nome do PlugIn
Registry = O seu numero de registro que voc� recebeu ao
adquirir o BraiDRepeaterPlugIn
NOTA: Para usar o BraiD for Repeaters n�o precisa entrar com o Registry}
procedure TBraiDRepeater.StartPlugIn(PathApp, Registry:string);
var
S, SS:string;
begin
 if(FileExists(PathApp))then begin
  S:=PathApp+' /'+Registry;
  if(Trim(Registry)='') then S:=PathApp;
  WinExec(Pchar(s),0);
 end else begin
  SS:='BraiDRepeaterPlugIn ou BraiD for Repeaters n�o localizado em '+#13+#10+PathApp;
  MessageBox(Application.Handle, pchar(SS),'Erro ao carregar aolicativo',MB_ICONERROR+MB_OK);
 end;


end;
{-- Mostra / Oculta o Icone (systray)}
procedure TBraiDRepeater.PlugInIconVisible(Visible:Boolean);
begin
 SendData('L'+IntToStr(fnLine)+'_ICON_VISIBLE->'+IntToStr(Integer(Visible)));
end;

{-- Finaliza o BraiD for Repeaters ou o PlugIn ----}
procedure TBraiDRepeater.StopPlugIn;
begin
 SendData('_STOP_APP->');
end;


{-- Remove autoriza��o de uso da porta no FireWall (XP) -----------------------}
procedure TBraiDRepeater.LookFireWall(App,Port:string);
var
Reg : TRegistry;
ap, SubNet:string;
begin
  ap := AnsiReplaceStr(App, '.exe', '');
  ap:= ExtractFileName(Ap)+' '+Port+' UDP';

  { - Remover autoriza��o de uso da Porta no FireWell -------------------------}
  begin
   Reg := TRegistry.Create;
   try
    { Define a chave-raiz do registro }
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    { Abre uma chave (path). Se n�o existir cria e abre. }
    Reg.OpenKey('\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List',true);
    { -- Remove o numero da porta -------------- }
    Reg.DeleteValue(Port+':UDP');

   finally
    Reg.Free;
   end;
   Reg := TRegistry.Create;
   try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List',true);
    {--- Remove autoriza��o -------- }
    Reg.DeleteValue(Application.ExeName);
   finally
    Reg.Free;
   end;
  end;

end;


constructor TBraiDRepeater.Create(AOwner: TComponent);
var
 ap,SubNet,Err:string;
 Reg : TRegistry;
begin
  try
    inherited Create(aowner);
    ViewIPLocal;
    fActive := False;
    fUnlookUDP := TRUE;
    fNetAcess := FALSE;
    fHostBraiD:=FALSE;
    fInsereIP:=FALSE;
    fInsereCount:=0;
    fPort := 0;
    fLocal := 0;
    fLocalip := '';
    BufLen := 20; {!!! N�o altere este valor. O BraiD usa este valor nas mensagens !! }
    MsgSize := 150; {!!! N�o altere este valor. O BraiD usa este valor nas mensagens !! }
    a0NumberLine:=1;
    fnLine:=1; {Padr�o: Linha 1}
    fCaller := False;
    Font.Color:=clLime;
    Color:=clBlack;
    Enabled:=False;
    Text:='(00) 0000-0000';
    fIP := '127.0.0.1'; {Inicia em LocalHost}
    fMonitorIP:='';




    if not (csDesigning in ComponentState) then
       if(Assigned(fIPmonitor))then fIPmonitor(Self,fIP);

    {Cria Timer Monitor de IP}
    fTimerMonitorIP := TTImer.Create(Self);
    fTimerMonitorIP.Interval:=1000;
    fTimerMonitorIP.OnTimer:=OnTimerMonitorIP;
    fTimerMonitorIP.Enabled:=True; {Sempre monitorando}

    {Cria Timer para Delay de 5ms para envio dos eventos}
    fTimerSendEvents := TTImer.Create(Self);
    fTimerSendEvents.Interval:=5;
    fTimerSendEvents.OnTimer:=OnTimerSendEvents;
    fTimerSendEvents.Enabled:=False;
    fTipyEvent:=0;
    fSendText:='';



    { - Cria acesso UDP }
    try
      UDPNM := TidUDPServer.Create(self);
      UDPNM.DefaultPort := fLocal;
      UDPNM.OnUDPRead := nmDataReceived;
      UDPNM.OnStatus := nmStatus;
      UDPNM.ThreadedEvent := True;
      kData := Tmemorystream.Create;
    except  end;
  except end;
end;

{--- Monitoraro IP Local ------------------------------------------------------------}
function TBraiDRepeater.GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
type
  Name = array[0..100] of Char;
  PName = ^Name;
var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
begin
(*
  Result := False;
  if WSAStartup($0101, WSAData) <> 0 then begin
    WSAErr := 'Winsock n�o est� repondendo.';
    Exit;
  end;
  IPaddr := '';
  New(HName);
  if GetHostName(HName^, SizeOf(Name)) = 0 then
  begin
    HostName := StrPas(HName^);
    HEnt := GetHostByName(HName^);
    for i := 0 to HEnt^.h_length - 1 do
     IPaddr :=
      Concat(IPaddr,
      IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.');
    SetLength(IPaddr, Length(IPaddr) - 1);
    Result := True;
  end
  else begin
   case WSAGetLastError of
    WSANOTINITIALISED:WSAErr:='WSANotInitialised';
    WSAENETDOWN      :WSAErr:='WSAENetDown';
    WSAEINPROGRESS   :WSAErr:='WSAEInProgress';
   end;
  end;
  Dispose(HName);
  WSACleanup;
*)  
end;

procedure TBraiDRepeater.OnTimerMonitorIP(Sender: TObject);
var
Err: string;
begin

   {Se conectou ao BraiD, solicita insers�o do IP na listagem}
   if(fInsereIP)and(not fHostBraiD)then begin
      inc(fInsereCount);
      {-- Envia 10 vezes a solicita��o de insers�o de IP,
         assim que obter respostas: p�ra de enviar --------------------------------------}
      if(fInsereCount>9)then begin
         if(fInsereIP)then {Se ap�s 10 tentativas n�o conseguiu se conectar ao Braid....}
           if assigned(fAllEvents) then
              fAllEvents(Self, 'ERROR_BRAID_NOT_SENDING_FOR_L'+IntToStr(fnLine));
              {-- Neste caso, voc� marcar "Ativar o envio para TCP-IP, no Braid. Ou
                  verificar se ele est� rodando.... -------------------------------------}

         fInsereCount:=0;
         fInsereIP:=FALSE;
      end;
      {Envia solicita��o}
      SendData('L'+IntToStr(fnLine)+'_APP_PLUGED->'+ExtractFileName(Application.ExeName));
      SendData('L'+IntToStr(fnLine)+'_INSERT_IP->'+a6Local_IP+':'+IntToStr(a5Local_Port));
   end;

  {-- Monitorar altera��o no IP Local --------------------}
  if GetIPFromHost(fHost, fMonitorIP, Err) then begin
     if(fIP<>fMonitorIP)then begin
       fIP:=fMonitorIP;
       a6Local_IP:=fIP;
       if(Assigned(fIPmonitor))then fIPmonitor(Self,fIP);

      {Envia HandShake com o IP e a Porta Local}
       if(not fHostBraiD) then
          SendData('DRV'+IntToStr(fnLine)+'_HANDSHAKE_I'+a6Local_IP+'P'+IntToStr(a5Local_Port));

      end;
   end;
  {-------------------------------------------------------}
end;

procedure TBraiDRepeater.ViewIPLocal;
var
  t : TIdIPWatch;
begin
  t := TIdIPWatch.Create(nil);
  try
    t.HistoryEnabled := False;
    fLocalIP := t.LocalIP;
  except
    fLocalIP := '127.0.0.1';
  end;
  t.Free
end;

destructor TBraiDRepeater.Destroy;
begin
  try
    if a7calling then a7calling := False;
    if Active then Active := False;
    Enabled:=False;
  except
  end;
  try
    UDPNM.Free;
    kData.Free;
  except
  end;
  inherited
end;



procedure TBraiDRepeater.nmDataReceived(Sender: TObject; AData: TStream;
                       ABinding: TIdSocketHandle);
var
  s: string[250];
  ss : String;
  NumberBytes : integer;
  FromIP : String;
begin

try

  kData.Clear;
  try
    FromIP := ABinding.PeerIP;
    KData.CopyFrom(AData, 0);
    KData.Position := 0;
    Numberbytes := KData.Size;
    if numberbytes = MsgSize then
    begin
      SetLength(s, MsgSize);
      kData.Read(s[1], MsgSize);
      s := trim(s);
      if(Trim(s)[1]<>'I')then
      begin
        if(length(S)>2)then
          if(S[1]='&')and(s[2]='&')then
             Delete(S,1,2);

        ReceiveData(S)

      end else begin
        SS := S;
        ReceiveIP(SS);
        begin
          Active := True;
          if(not fHostBraiD)then begin
            fInsereIP:=TRUE;
            fInsereCount:=0;
          end;
        end;
        if assigned(fcalled) then fcalled(Sender, ss);
      end
    end;
  finally
    kData.Clear;
  end
except end;
end;

/////
procedure TBraiDRepeater.SetDDDLocal(const Value: string);
begin
 if(Value<>fDDD)then
     fDDD := Value;
end;
procedure TBraiDRepeater.SetPathPlugIn(const Value: string);
begin
 if(Value<>fPlugIn)then
     fPlugIn := Value;
end;


procedure TBraiDRepeater.SetHostBraiD(const Value: Boolean);
begin
 if(Value<>fHostBraiD)then
    fHostBraiD := Value;
end;

//------------

procedure TBraiDRepeater.SetIP(const Value: string);
begin
  if assigned(UDPNM) then
  begin
    fIP := Value;
  end
end;

procedure TBraiDRepeater.SetActive(const Value: boolean);
begin
 if Value = True then
    fActive := True
 else fActive := FALSE;

end;

procedure TBraiDRepeater.SetPort(const Value: integer);
begin
  if assigned(UDPNM) then
  begin
    fport := Value;
  end;
end;
procedure TBraiDRepeater.SetnLine(const Value: integer);
begin
  if(Value>6)then begin
     fnLine :=6;  {M�ximo 6 Linhas}
     exit;
  end else if(Value<1)then
      fnLine :=1  {M�nimo 1 Linha}
  else fnLine := Value;
end;


procedure TBraiDRepeater.SetLocalPort(const Value: integer);
begin
  if assigned(UDPNM) then begin
    flocal := Value;
    UDPNM.Active := False;
    UDPNM.Free;
    kData.Free;
  try
    UDPNM := TidUDPServer.Create(self);
    UDPNM.DefaultPort := Value;
    UDPNM.OnUDPRead := nmDataReceived;
    UDPNM.OnStatus := nmstatus;
    UDPNM.ThreadedEvent := True;
    UDPNM.Active := True;
    kData := Tmemorystream.Create;
  except
   On EIdCouldNotBindSocket do
   raise Exception.Create('#3815'+#13+#10+'Erro ao se conectar � porta:'+ IntToStr(Value)+#13+#10+
                          'Ela pode estar sendo usado por outro aplicativo!');
  end;
  end;
end;

procedure TBraiDRepeater.nmStatus(ASender: TObject;
     const AStatus: TIdStatus; const AStatusText: String);
begin
  if assigned(fstatus) then fstatus(ASender, AstatusText)
end;


procedure TBraiDRepeater.ReceiveIP(var S: string);
var
  {a,} b: string;
  e, f: integer;
  g: string;
begin
  gip := fIP;
  gport := fport;
  gSelf := fSelf;
  e := 1;
  g := '';
  f := 0;
  b := '';
  while (e <= length(s)) and (f <> 5) do
  begin
    Application.ProcessMessages;
    if (f = 1) and (s[e] <> 'P') then gip := gip + s[e];
    if (f = 2) and (s[e] <> 'V') then b := b + s[e];
    if (f = 4) and (e < length(s)) and (s[e] <> '@') then if s[e] = 'T' then gSelf := True
      else
        gSelf := False;
    if s[e] = 'I' then
    begin
      gip := '';
      f := 1
    end;
    if s[e] = 'P' then
    begin
      gport := 0;
      f := 2
    end;
    if s[e] = 'V' then
    begin
      f := 3;
      try
        gport := StrToInt(b)
        except
      end
    end;
    if s[e] = 'Z' then
    begin
      gSelf := False;
      f := 4
    end;
    if s[e] = '@' then f := 5;
    if f < 5 then g := g + s[e];
    e := e + 1
  end;
  s := g;
  if(not fActive) then
  begin
    fIP := gip;
    fport := gport;
    fSelf := gSelf;
    if a6Local_IP = '' then ViewIPLocal;
  end;

end;

function TBraiDRepeater.BraiDDisConnect(Line:Integer):Boolean;
begin
 if(not fHostBraiD)then begin
   SendData('L'+IntToStr(Line)+'_REMOVE_IP->'+a6Local_IP+':'+IntToStr(a5Local_Port));
   if assigned(fAllEvents)and(not fHostBraiD) then
      fAllEvents(Self,'L'+IntToStr(Line)+'_AWAITING_FOR_BRAID');
 end;

end;
function TBraiDRepeater.BraiDConnect(IP: string;Line:Integer):Boolean;
var
  i: integer;
  vIP, vPort: string;
  VP: boolean;
begin
 try
  vIP := '';
  vPort := '';
  i := 1;
  Result:=False;
  VP := True;
  while i <= length(IP) do begin
    Application.ProcessMessages;
    if VP and (IP[i]<>':') then vIP:=vIP+ip[i];
    if(not VP)and(IP[i]<>':')then vPort:=vPort+IP[i];
    if(not VP)and(IP[i]=':')then i:=1000;
    if(ip[i]=':')then  VP:=False;
    i := i + 1
  end;

  fIP := vIP;

  try
    if Trim(vPort) <> '' then
       fPort := StrToInt(vPort);
  except
    fport := 800;
  end;

  {Envia Handshake com o IP e a Porta Local}
  if(not fHostBraiD) then begin
    SendData('L'+IntToStr(Line)+'_HANDSHAKE_I'+a6Local_IP+'P'+IntToStr(a5Local_Port));
    if assigned(fAllEvents) then fAllEvents(Self, 'L'+IntToStr(Line)+'_AWAITING_FOR_BRAID');
    fInsereIP:=TRUE; {Prepara para inserir o novo IP no BraiD (em OnTimerIP)}
    fInsereCount:=0;
  end;

  a7calling := True;
  Result := a7calling;
 except
   a7calling := False;
  Result := a7calling;
 end;

end;
procedure TBraiDRepeater.SetNetAcess(const Value: boolean);
begin
if(fNetAcess<>Value)then fNetAcess := Value;
end;

procedure TBraiDRepeater.SetUnlookUDP(const Value: boolean);
begin
if(fUnlookUDP<>Value)then fUnlookUDP := Value;
end;

procedure TBraiDRepeater.SetCaller(const Value: boolean);
var
  s: string;
  F : Byte;
  KK : String;
begin
  if Value then
  begin
    if not fActive then begin
      if trim(a6Local_IP) = '' then ViewIPLocal;

      try
        s := 'I' + fLocalIP + 'P' + IntToStr(fLocal) + 'VZ';
        if fSelf then s := s + 'T'  else  s := s + 'F';
        s := s + '@';
        KK := S;
        For f:= Length(Trim(KK))+1 to MsgSize do begin
            Application.ProcessMessages;
            KK := KK + 'K';
        end;

        if(UDPNM.Active)then
          UDPNM.Send(fIP,fPort,KK);
      finally  end;
     
      fCaller := True;
      Active := True;


    end;
  end else  begin
    fCaller := False;
    if Active then
    begin
      try
        Active := False;
        s := '~Finalizada@';
        KK := S;
        For f:= Length(KK)+1 to MsgSize do begin
            Application.ProcessMessages;
            KK := KK + 'K';
        end;
        if(UDPNM.Active)then begin
           UDPNM.Send(fIP,fport,KK);
           if assigned(fended) then fended(self, s)
        end;
           
      finally
      end
    end;
  end
 
end;


procedure TBraiDRepeater.SendData(S: string);
var
 SS:String;
 F: byte;
 IPRemoto:string;
 PortaRemota:integer;
begin
 IPRemoto:=a3Remote_IP;
 PortaRemota:=a4Remote_Port;


 try
  if(fActive)and(UDPNM.Active)then  begin
    S:='&&'+Trim(S)+'@';
    if(Length(S)<MsgSize)then SetLength(S,MsgSize);

    SS := S;
    {Preenche espa�o final em branco com "K"}
    for F:= Length(SS)+1 to MsgSize do
        SS := Trim(SS) + 'K';

    {Envia----------------------}
     UDPNM.Send(IPRemoto,PortaRemota,SS);
    {---------------------------}
  end;
 except
    raise Exception.Create('Erro #3820 : TBraiDRepeater.SendData()');
 end;
end;
procedure TBraiDRepeater.OnTimerSendEvents(Sender: TObject);
var
y:integer;
begin
// fTimerSendEvents.Enabled:=FALSE;
 case fTipyEvent of
     1: fAllEvents(Self, fSendText);
     2: if assigned(fHandShake) then fHandShake(self,a3Remote_IP,IntToStr(a4Remote_Port));
     3: begin
          if assigned(fAllEvents) then fAllEvents(Self, 'L'+fSendnLine+'_IP_REMOVED->'+a6Local_IP+':'+IntToStr(a5Local_Port));
          if assigned(fAllEvents) then fAllEvents(Self, 'L'+fSendnLine+'_REPEATER_DISCONNECTED !');
        end;
     4: begin
          if assigned(fDataFriends)then fDataFriends(self,
            vrFriends[0], {ID: da chamada (Filtro)}
            vrFriends[1], {Linha}
            vrFriends[2], {Data}
            vrFriends[3], {Operadora}
            vrFriends[4], {DDD}
            vrFriends[5], {Fone}
            vrFriends[6], {Nome}
            vrFriends[7], {Cidade}
            vrFriends[8], {UF}
            vrFriends[9], {Inicio}
            vrFriends[20]);{Tipo: Recebida, Efetuada, N�o identificada}

           {Mostra, e adiciona, o fone formatado no ComboBox}
            if(Trim(vrFriends[4])<>'')and(Trim(vrFriends[4])<>'')then
               Text := '('+vrFriends[4]+') '+vrFriends[5] else  Text:='(00) 0000-0000';

           // Items.Add(Text); {Apenas se deseja rever os n�meros recebidos !!}
            inherited Change;

            {Limpa array}
            for y:=0 to Length(vrFriends)-1 do vrFriends[y]:='';
        end;
     5: if assigned(fKeyEvent) then fKeyEvent(Self,fSendnLine,fSendText);
     6: if assigned(fKeyEvent) then fKeyEvent(Self,fSendnLine,fSendText);
     7: if assigned(fFormatPhone) then fFormatPhone(Self,fSendnLine,fSendText,TRUE,FALSE);
     8: if assigned(fFormatPhone) then fFormatPhone(Self,fSendnLine,fSendText,FALSE,TRUE);
     9: if assigned(fIndexPhone) then fIndexPhone(Self,fSendnLine,fSendText);
    10: if assigned(fDetectPhone) then fDetectPhone(Self,fSendnLine,Copy(fSendText,1,1),Copy(fSendText,2,2),Copy(fSendText,4,9));
    11: if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'DIALTONE');
    12: if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'DIALLING');
    13: if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'OFF_HOOK');
    14: if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'CALLER_ID_FSK');
    15: if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'BINA_DTMF');
    16: begin
          if assigned(fRingCount) then fRingCount(Self,fSendnLine,StrToIntDef(fSendText,0));
          if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'RING_COUNT');
        end;
    17: begin
          if assigned(fFileRecEvent) then fFileRecEvent(Self,fSendnLine,fSendText,fSendText1);
          if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'RECORD_START');
        end;
    18: begin
         if  assigned(fFileRecEvent) then fFileRecEvent(Self,fSendnLine,fSendText,fSendText1);
         if assigned(fsTatusEvent) then fsTatusEvent(Self,fSendnLine,'RECORD_STOP');
       end;
 end; {case}
fTimerSendEvents.Enabled:=FALSE;
fTipyEvent:=0;
end;

procedure TBraiDRepeater.ReceiveData(S: string);
var
  P: string;
  i,y,p2: integer;
  rEnd: boolean;
  rConnect: boolean;
  rej: boolean;
  SS,sT,sF, sTipo:string;
  PS :integer;
  PortaR:integer;
  IPRemot,LLine, nLine :string;
begin


  while(fTimerSendEvents.Enabled)do;

  y:=0;
  rEnd := False;
  SS:='';
  p := '';
  i := 1;
  rConnect := False;
  rej := False;
  SS:='';



  while i <= length(S) do begin
      Application.ProcessMessages;
      if s[i] = '~' then begin
        rEnd := True;
        a7calling := False;
        Active := False
      end;
      if s[i] = '^' then begin
        rConnect := True;
        a7calling:=True;
        s[i] := ' '
      end;
      if s[i] = '|' then  begin
        rej := True;
        a7calling := False;
        Active := False;
        s[i] := ' '
      end;
      if (s[i] <> '@') and (s[i] <> '~') then p := p + s[i]
      else if s[i] = '@' then i := 1000;
      i := i + 1;
  end;

  P := Trim(P);
  SS:=P;


  LLine := 'L'+IntToStr(a0NumberLine);
  nLine:= IntToStr(a0NumberLine);
  fSendnLine:=nLine;

  if rConnect and assigned(fAccepted) then fAccepted(self, p)
  else if rEnd then  begin
    if assigned(fEnded) then fEnded(self, p);
  end else if(assigned(fAllEvents))then begin
             if(pos(LLine+'_IP_REMOVED->',SS)=0)then begin
               fSendText := SS;
               fTipyEvent:=1;
               fTimerSendEvents.Enabled:=TRUE;
             end;
             Enabled:=False;
           end;

  if(pos('_HANDSHAKE_I',SS)>0)then begin
     SS:=Trim(SS);
     DELETE(SS,1,14);
     P2:= POS('P',SS);
     IPRemot := Copy(SS,1,P2-1);
     DELETE(SS,1,P2);
     PortaR := StrToIntDef(SS,0);

     {Pega o IP e a Porta de quem enviou}
     a3Remote_IP := IPRemot;
     a4Remote_Port := PortaR;

     fSendText := '';
     fTipyEvent:=2;
     fTimerSendEvents.Enabled:=TRUE;
  end;

  if(pos('PING',SS)>0)then
     if(not fHostBraiD)then begin
       SendData(LLine+'_IP_'+a6Local_IP+'_PR_'+IntToStr(a5Local_Port));
       exit;
     end;


  {-- Desconectado ----- }
  if(pos(LLine+'_IP_REMOVED->',SS)>0)and(not fHostBraiD)then begin
     fSendText := '';
     fTipyEvent:=3;
     fTimerSendEvents.Enabled:=TRUE;
     Active := FALSE;
     Enabled:=FALSE;
     a5Local_Port := 0;
  end;

  {-- IP inserido com sucesso ----- }
  if(pos(LLine+'_IP_INSERTED->',SS)>0)and(not fHostBraiD)then begin
     fInsereCount:=0;
     fInsereIP:=FALSE;
  end;

  {-- Conectado com sucesso ----- }
  if(pos(LLine+'_BRAID_CONNECTED_WITH_SUCESS',SS)>0)and(not fHostBraiD)then begin
     fInsereCount:=0;
     fInsereIP:=FALSE;
     Enabled:=TRUE;
  end else if(pos(LLine+'_BRAID_CONNECTED_WITH_SUCESS',SS)>0)and(fHostBraiD)then begin
     SendData('L'+IntToStr(fnLine)+'_APP_PLUGED->'+ExtractFileName(Application.ExeName));
  end;


  {-- Dados do Contato --------------------------------------------------------}
  if(POS('DATA_FILTER_ID_INIT->',SS)>0)then begin     {Inicio de recp��o}
      vrFriends[0]:= Copy(SS,POS('->',SS)+2,20); {Filtro est� em "SS"}

      {Status}
      sTipo:=Copy(SS,POS('->',SS)+2,20);
      if(Pos('D',sTipo)>0)then vrFriends[20]:='Discando...'
      else if(Pos('E',sTipo)>0)then vrFriends[20]:='Efetuada'
      else if(Pos('R',sTipo)>0)then vrFriends[20]:='Recebida'
      else if(Pos('I',sTipo)>0)then vrFriends[20]:='N�o identificada';


  end else if(POS('DATA_CHANNEL->',SS)>0)then     {Linha}
      vrFriends[1]:= Copy(SS,POS('->',SS)+2,2)

  else if(POS('DATA_DATE->',SS)>0)then        {Data}
      vrFriends[2]:= Copy(SS,POS('->',SS)+2,15)

  else if(POS('DATA_OPR->',SS)>0)then         {Operadora}
      vrFriends[3]:= Copy(SS,POS('->',SS)+2,5)

  else if(POS('DATA_CODAREA->',SS)>0)then     {DDD}
      vrFriends[4]:= Copy(SS,POS('->',SS)+2,5)

  else if(POS('DATA_PHONE->',SS)>0)then       {Fone}
      vrFriends[5]:= Copy(SS,POS('->',SS)+2,20)

  else if(POS('DATA_NAME->',SS)>0)then        {Nome}
      vrFriends[6]:= Copy(SS,POS('->',SS)+2,60)

  else if(POS('DATA_CITY->',SS)>0)then        {Cidade}
      vrFriends[7]:= Copy(SS,POS('->',SS)+2,60)

  else if(POS('DATA_COUNTRY->',SS)>0)then     {UF}
      vrFriends[8]:= Copy(SS,POS('->',SS)+2,10)

  else if(POS('DATA_TIME_INIT->',SS)>0)then     {Inicio}
      vrFriends[9]:= Copy(SS,POS('->',SS)+2,10)

  else if(POS('DATA_TIME_END->',SS)>0)then     {Fim}
      vrFriends[10]:= Copy(SS,POS('->',SS)+2,10)

  else if(POS('DATA_TIME_DURACTION->',SS)>0)then  {TempoToal}
      vrFriends[11]:= Copy(SS,POS('->',SS)+2,10)

  else if(POS('DATA_CEP->',SS)>0)then        {Cep}
      vrFriends[12]:= Copy(SS,POS('->',SS)+2,20)

  else if(POS('DATA_EMAL->',SS)>0)then       {Email}
      vrFriends[13]:= Copy(SS,POS('->',SS)+2,MsgSize)


  else if(POS('DATA_FILTER_ID_END->',SS)>0)then begin {Fim de recpc��o}
        {Se algum campo estiver em branco, ent�o � finaliza��o de chamada}
        if(vrFriends[6]='')then
           vrFriends[20]:= Copy(SS,POS('->',SS)+2,20);

        {Envia ao evento}
         fSendText := '';
         fTipyEvent:=4;
         fTimerSendEvents.Enabled:=TRUE;
  end else if(not fHostBraiD)then begin

      {Inicio de BINA "A"}
      if(pos(LLine+'_DMTFKEY_INIT->',SS)>0)then begin  {"A"}
          SS:=Copy(SS,18,1);
          if(Trim(SS)<>'')then begin
              fSendText := SS;
              fTipyEvent:=5;
              fTimerSendEvents.Enabled:=TRUE;
          end;
      end;

      {Teclas}
      if(pos(LLine+'_DMTFKEY->',SS)>0)then begin
          SS:=Copy(SS,13,1);

          if(Trim(SS)<>'')then begin
              fSendText := SS;
              fTipyEvent:=6;
              fTimerSendEvents.Enabled:=TRUE;
          end;
      end;

      { Fone Formatado DTMF}
      if(pos(LLine+'_NUMBER_FORMAT_DTMF->',SS)>0)then begin
         DELETE(SS,1,23);
         SS:=TRIM(SS);
         if(Trim(SS)<>'')then begin
             fSendText := SS;
             fSendnLine:=nLine;
             fTipyEvent:=7;
             fTimerSendEvents.Enabled:=TRUE;
         end;
      end;

      {Fone Formatado FSK}
      if(pos(LLine+'_NUMBER_FORMAT_FSK->',SS)>0)then begin
         DELETE(SS,1,23);
         SS:=TRIM(SS);
         if(Trim(SS)<>'')then begin
             fSendText := SS;
             fSendnLine:=nLine;
             fTipyEvent:=8;
             fTimerSendEvents.Enabled:=TRUE;
         end;
      end;

      {IndexPhone}
      if(pos(LLine+'_INDEX_PHONE->',SS)>0)then begin
         DELETE(SS,1,16);
         SS:=TRIM(SS);
         if(Trim(SS)<>'')then begin
             fSendText := SS;
             fSendnLine:=nLine;
             fTipyEvent:=9;
             fTimerSendEvents.Enabled:=TRUE;
         end;
      end;

      {Tipo, DDD e Fone}
      if(pos(LLine+'_DETECT_PHONE->',SS)>0)then begin
         DELETE(SS,1,17);
         SS:=TRIM(SS);
         if(Trim(SS)<>'')then begin
             fSendText := SS;
             fSendnLine:=nLine;
             fTipyEvent:=10;
             fTimerSendEvents.Enabled:=TRUE;
         end;
      end;

      {DIALTOM}
      if(pos(LLine+'_STATUS_DIALTONE',SS)>0)then begin
         fSendText := '';
         fSendnLine:=nLine;
         fTipyEvent:=11;
         fTimerSendEvents.Enabled:=TRUE;
      end;

      {DIALTOM}
      if(pos(LLine+'_STATUS_DIALLING',SS)>0)then begin
         fSendText := '';
         fTipyEvent:=12;
         fTimerSendEvents.Enabled:=TRUE;
      end;
      {OFF_HOOK}
      if(pos('_OFF_HOOK',SS)>0)then begin
         fSendText := '';
         fTipyEvent:=13;
         fTimerSendEvents.Enabled:=TRUE;
      end;

      {CALLER_FSK}
      if(pos(LLine+'_CALLER_FSK',SS)>0)then begin
         fSendText := '';
         fTipyEvent:=14;
         fTimerSendEvents.Enabled:=TRUE;
      end;

      {CALLER_DTMF}
      if(pos(LLine+'_CALLER_DTMF',SS)>0)then begin
         fSendText := '';
         fTipyEvent:=15;
         fTimerSendEvents.Enabled:=TRUE;
      end;

      {RING_COUNT}
      if(pos(LLine+'_RING_COUNT->',SS)>0)then begin
         SS:=Copy(SS,16,1);
         fSendText := SS;
         fTipyEvent:=16;
         fTimerSendEvents.Enabled:=TRUE;
      end;

      {L1_REC_FILE_INIT->}
      if(pos(LLine+'_REC_FILE_START->',SS)>0)then begin
           DELETE(SS,1,POS('->',SS)+1);
           p2:=POS('#',SS)-1;
           sF:=Copy(SS,1,p2);
           DELETE(SS,1,p2+1);
           sT:=Copy(SS,1,10);
           fSendText := sF;
           fSendText1 := sT;
           fTipyEvent:=17;
           fTimerSendEvents.Enabled:=TRUE;
      end;

      {_REC_FILE_STOP->}
      if(pos(LLine+'_REC_FILE_STOP->',SS)>0)then begin
           DELETE(SS,1,POS('->',SS)+1);
           p2:=POS('#',SS)-1;
           sF:=Copy(SS,1,p2);
           DELETE(SS,1,p2+1);
           sT:=Copy(SS,1,10);

           fSendText := sF;
           fSendText1 := sT;
           fTipyEvent:=18;
           fTimerSendEvents.Enabled:=TRUE;
      end;
  end;
end;
end.
