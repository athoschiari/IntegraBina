program IntegraBina;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, windows, SysUtils, Forms, untintegrador, untdmrestdw,
  memdslaz, lazcontrols, datetimectrls, indylaz, DataModule, zcomponent,
  DComponent, Funcoes, rxnew, untPesquisa;

{$R *.res}

var
  Mutex : THandle;
  hWndMe : HWnd;
begin

  {$IFDEF DEBUG}
  // Assuming your build mode sets -dDEBUG in Project Options/Other when defining -gh
  // This avoids interference when running a production/default build without -gh

  // Set up -gh output for the Leakview package:
  GlobalSkipIfNoLeaks := False;
  if FileExists('heap.trc') then
    DeleteFile('heap.trc');
  SetHeapTraceOutput('heap.trc');
  {$ENDIF DEBUG}

  // Verifica se o menu principal esta em execucao
  //Mutex:= CreateMutex(nil, true, 'DSAT_Sistemas');
  //if (GetLastError <> Error_Already_Exists) then begin
  //  Application.Scaled:=True;
  //  Application.MessageBox('O menu principal não esta aberto...','DSAT Sistemas', mb_Ok + mb_IconInformation);
  //  halt;
  //end;

  // Verifica se ha alguma outra instancia do modulo
  Mutex := CreateMutex(nil, true, 'IntegraBina');
  if Mutex <> 0 then begin
    if GetLastError = Error_Already_Exists then begin
      hWndMe := FindWindow(nil, pChar('Integração com Bina'));
      if (hWndMe <> 0) then begin
      if IsIconic(hWndMe) then
        ShowWindow(hWndMe, SW_SHOWNORMAL)
      else
        SetForegroundWindow(hWndMe);
      end;
      try
        CloseHandle(Mutex);
        CloseHandle(hWndMe);
      except
      end;
      exit;
    end;
  end;
  try
    CloseHandle(Mutex);
    CloseHandle(hWndMe);
  except
  end;

  //RequireDerivedFormResource:=True;
  //Application.Scaled:=True;
  Application.Scaled := True;
  Application.Initialize;
  Application.Title := 'Integração com Bina';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmIntegrador, frmIntegrador);
  with Tdc.Create(Application) do begin;
    hide;
  end;
  oTerminalParam := ParamStr(1);
  if not ConfiguraTerminal then
    exit;
  Application.Run;
end.

