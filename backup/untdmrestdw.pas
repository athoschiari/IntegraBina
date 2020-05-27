unit untdmrestdw;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uDWDataModule, uRESTDWPoolerDB, uRESTDWServerEvents,
  uRESTDWDriverZEOS, uDWJSONObject, uSystemEvents, uDWConstsData, SysTypes,
  uDWConsts, IniFiles, base64, dateutils, fpjson, ZDataset, ZConnection,
  ecripto, IDEWindowIntf, untintegrador, uDWMassiveBuffer, typinfo, rttiutils;

type

  { TdmRESTDW }

  TdmRESTDW = class(TServerMethodDataModule)
    ServerEvents: TDWServerEvents;
    zLocalRESTDW: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleWelcomeMessage(Welcomemsg, AccessTag: String;
      var ConnectionDefs: TConnectionDefs; var Accept: Boolean;
      var ContentType, ErrorMessage: String);
    function Criptografa(cValor, cChave, cFuncao: string): String;
    procedure Explode(Delimiter: Char; Str: String; ListOfStrings: TStrings);
    procedure InsereLOG(Log: String; TipoLog: TTipoLog; InsereEndpoint: Boolean =
      True); overload;
    function VerificaParametros(var Params: TDWParams; IgnoredList: TStringList = nil;
      ParamList: TStringList = nil): String;
    function ParametroValido(Param: TJsonParam; VerificaString: Boolean = True): Boolean;
    function RequestTypeAsString(const RequestType: TRequestType): String;
    procedure PreencheCurrentEvent(const aSelf: TCollectionItem);
    function RetornoParametrosInvalidos(ParametrosInvalidos: String): String;
    function VerificaEncodaString(Value: String): String;
  private
    CurrentRequestName,
    CurrentEvent: String;
    EncodaBase64: Boolean;
  end;


var
  dmRESTDW: TdmRESTDW;

implementation

{$R *.lfm}
function TdmRESTDW.VerificaEncodaString(Value: String): String;
begin
  Result := BoolToStr(EncodaBase64, EncodeStringBase64(Value), Value);
end;

{ TdmRESTDW }

function TdmRESTDW.Criptografa(cValor, cChave, cFuncao: string): String;
var
  cripto: TEvCriptografa;
begin
  if Trim(cValor) = '' then begin
    Result := '';
    exit;
  end;
  try
    cripto := TEvCriptografa.Create(Self);
    cripto.Key := cChave;
    if cFuncao='C' then begin
      cripto.Text := cValor;
      Result := cripto.CriptoHex;
    end
    else begin
      cripto.CriptoHex := Trim(cValor);
      Result := cripto.Text;
    end;
  finally
    FreeAndNil(cripto);
  end;
end;

procedure TdmRESTDW.Explode(Delimiter: Char; Str: String;
  ListOfStrings: TStrings);
begin
  ListOfStrings.Clear;
  ListOfStrings.Delimiter       := Delimiter;
  ListOfStrings.StrictDelimiter := True;
  ListOfStrings.DelimitedText   := Str;
end;

procedure TdmRESTDW.InsereLOG(Log: String; TipoLog: TTipoLog; InsereEndpoint: Boolean);
var
  Prefixo: String;
begin
  Prefixo := 'API - ';
  if InsereEndpoint then begin
    CurrentEvent := CurrentEvent;
    Prefixo := Prefixo + 'Endpoint ' + ServerEvents.ContextName + '/' + CurrentEvent;
    if CurrentRequestName <> '' then
      Prefixo := Prefixo + '(' + CurrentRequestName + ')';
    Prefixo := Prefixo + ': ';
  end;
  frmIntegrador.InsereLOG(Prefixo + Log, TipoLog, True);
end;

function TdmRESTDW.VerificaParametros(var Params: TDWParams;
  IgnoredList: TStringList; ParamList: TStringList): String;
var
  Iterador: Integer;
  ParamName: String;
  VerificaString: Boolean;
  DWParamMethod: TDWParamMethod;
begin
  Result := '';
  for Iterador := 0 to Params.Count - 1 do begin
    ParamName := Params.Items[Iterador].ParamName;
    DWParamMethod := nil;
    try
      DWParamMethod := ServerEvents.Events.EventByName[CurrentEvent].DWParams.ParamByName[ParamName];
    except
      DWParamMethod := nil;
    end;
    //Se o parâmetro não estiver presente no evento do ServerEvents sendo executado, continua sem validar
    if not Assigned(DWParamMethod) then
      Continue;
    //Verifica se existe lista de parâmetros
    if Assigned(ParamList) then begin
      //Se o parâmetro não estiver na lista de parâmetros enviada, continua sem validar
      if ParamList.IndexOf(ParamName) = -1 then
        Continue;
    end;
    VerificaString := True;
    //Verifica se existe lista de parâmetros ignorados
    if Assigned(IgnoredList) then begin
      //Se o parâmetro estiver presente na lista de parâmetros ignorados, não verifica string
      if IgnoredList.IndexOf(ParamName) <> -1 then
        VerificaString := False;
    end;
    //Verifica se o parâmetro é válido (Assigned e <> nil)
    //Se VerificaString = True, verifica se Parametro.AsString <> ''
    if not ParametroValido(Params.Items[Iterador], VerificaString) then
      Result := Result + ParamName + ', ';
  end;
  Delete(Result, Result.Length - 1, 2);
end;

function TdmRESTDW.ParametroValido(Param: TJsonParam; VerificaString: Boolean
  ): Boolean;
begin
  try
    Result := ((Assigned(Param)) and (Param <> nil));
    if VerificaString then begin
      if Result then
        Result := Trim(Param.AsString) <> '';
    end;
  except
    Result := False;
  end;
end;

function TdmRESTDW.RequestTypeAsString(const RequestType: TRequestType): String;
begin
  try
    Result := GetEnumName(TypeInfo(TRequestType), Integer(RequestType));
    //tira o "rt" do nome do RequestType
    Delete(Result, 1, 2);
  except
    Result := '';
  end;
end;

procedure TdmRESTDW.PreencheCurrentEvent(const aSelf: TCollectionItem);
begin
  CurrentEvent := aSelf.DisplayName;
end;

function TdmRESTDW.RetornoParametrosInvalidos(ParametrosInvalidos: String): String;
begin
  Result := 'Parâmetros de evento inválidos';
  InsereLOG(Result + ' = "' + ParametrosInvalidos + '"', tlErro);
  Result := '{"ErrorMessage": "' + Result + '"}';
end;

procedure TdmRESTDW.DataModuleWelcomeMessage(Welcomemsg, AccessTag: String;
  var ConnectionDefs: TConnectionDefs; var Accept: Boolean; var ContentType,
  ErrorMessage: String);
var
  OriginalWelcomeMsg: String;
  OutputList: TStringList;
  WhereRole: String;
  LogaException: String;
  TipoLog: TTipoLog;
begin
  ContentType := 'application/json';

  OriginalWelcomeMsg := Welcomemsg;
  LogaException := '';
  ErrorMessage := '';
  Accept := False;
  TipoLog := tlResultado;

  try
    EncodaBase64 := frmIntegrador.EncodaBase64;
    with zLocalRESTDW do begin
      HostName        := frmIntegrador.vdbHostname;
      Database        := frmIntegrador.vdbDatabase;
      User            := frmIntegrador.vdbUser;
      Password        := frmIntegrador.vdbPassword;
      Port            := frmIntegrador.vdbPort;
      Protocol        := frmIntegrador.vdbProtocol;
      LibraryLocation := frmIntegrador.vdbLib;
    end;
    zLocalRESTDW.Connect;
  except
    on E: Exception do begin
      ErrorMessage := 'Erro ao iniciar conexão com base de dados';
      LogaException := E.Message;
    end;
  end;

  if ErrorMessage = '' then begin
    if Trim(Welcomemsg) = '' then begin
      ErrorMessage := 'Token não identificado';
    end
    else begin
      try
        if AnsiPos('|', Welcomemsg) <= 0 then
          Welcomemsg := Criptografa(Welcomemsg, 'CriptoAPIPonto', 'D')
        else
          OriginalWelcomeMsg := Criptografa(Welcomemsg, 'CriptoAPIPonto', 'C');

        OutputList := TStringList.Create;
        Explode('|', Welcomemsg, OutputList);

        if OutputList.Count = 4 then begin
          if Now > StrToDateTime(OutputList[3]) then
            ErrorMessage := 'Token expirado, efetue novo login e tente novamente';
        end;
      except
        on E: Exception do begin
          ErrorMessage := 'Erro ao verificar Token';
          LogaException := E.Message;
        end;
      end;

      if ErrorMessage = '' then begin
        //WhereRole := '';
        //if OutputList.Count = 4 then
        //  WhereRole := ' AND COALESCE(PSCO_ROLE, ''COMUM'') = ' + QuotedStr(OutputList[2]);
        //
        //Usuario := UpperCase(OutputList[0]);
        //Senha := OutputList[1];
        try
          //if not ValidaLogin(WhereRole) then
          //  ErrorMessage := 'Usuário ou senha inválidos, verifique seus dados e tente novamente'
          //else
          //  ErrorMessage := '';
        except
          on E: Exception do begin
            if ErrorMessage = '' then
              ErrorMessage := 'Erro ao validar login';
            LogaException := E.Message;
          end;
        end;
      end;

      try
        OutputList.Free;
        OutputList := nil;
      except
      end;
    end;
  end;

  Accept := ((ErrorMessage = '') and (LogaException = ''));

  if not Accept then begin
    if LogaException = '' then
      TipoLog := tlInformativo
    else
      TipoLog := tlErro;
  end;

  InsereLOG('Verificação de WelcomeMessage/Token: Accept = "' + BoolToStr(Accept, 'True', 'False') +
    '" <> AcessTag = "' + AccessTag +
    '" <> WelcomeMessage = "' + OriginalWelcomeMsg +
    '" <> ErrorMessage = "' + ErrorMessage +
    '" <> LogaException = "' + LogaException + '"', TipoLog, False);
  if not Accept then begin
    ErrorMessage := '{"ErrorMessage": "' + ErrorMessage + '", "ExceptionMessage": "' + LogaException + '"}';
  end;
end;

procedure TdmRESTDW.DataModuleDestroy(Sender: TObject);
begin
  try
    zLocalRESTDW.Disconnect;
  except
  end;
end;

procedure TdmRESTDW.DataModuleCreate(Sender: TObject);
var
  Iterador: Integer;
begin
  for Iterador := 0 to ServerEvents.Events.Count - 1 do begin
    ServerEvents.Events.Items[Iterador].OnBeforeExecute := @PreencheCurrentEvent;
  end;
end;

end.

