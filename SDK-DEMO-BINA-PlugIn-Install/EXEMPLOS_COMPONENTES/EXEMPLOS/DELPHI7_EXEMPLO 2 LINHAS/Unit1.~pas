unit Unit1;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShlObj, ActiveX,ComObj, Registry,FileCtrl;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure CriaShortCut(aNome, aFileName: string; aLocation: integer; uCreate:Boolean);
var
  IObject : IUnknown;
  ISLink : IShellLink;
  IPFile : IPersistFile;
  PIDL : PItemIDList;
  InFolder : array[0..MAX_PATH] of Char;
  TargetName : String;
  LinkName,s : WideString;
begin
  TargetName := aFileName;
  IObject := CreateComObject(CLSID_ShellLink);
  ISLink := IObject as IShellLink;
  IPFile := IObject as IPersistFile;
  with ISLink do begin
    SetPath(pChar(TargetName));
    SetWorkingDirectory(pChar(ExtractFilePath
    (TargetName)));
  end;
  SHGetSpecialFolderLocation(0, aLocation, PIDL);
  SHGetPathFromIDList(PIDL, InFolder);
  s := InFolder;
  LinkName := s + '\' + aNome + '.LNK';

  {--- Cria atalho -------------------------------------------------------}
  if not(FileExists(LinkName))and(uCreate) then
    IPFile.Save(PWChar(LinkName), false)
  else if(not uCreate)and(FileExists(LinkName))then DeleteFile(LinkName);
  {-----------------------------------------------------------------------}

end;
// Para utilizar:
//CriaShortCut('Calculadora', 'c:\windows\system32\calc.exe', CSIDL_DESKTOP);

procedure TForm1.Button1Click(Sender: TObject);
begin
  CriaShortCut('BraiD for Repeaters', Application.ExeName, CSIDL_STARTUP, FALSE);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
CriaShortCut('BraiD for Repeaters', Application.ExeName, CSIDL_STARTUP, TRUE);
end;

end.
