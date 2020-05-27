unit UnitCH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    EditFormat: TEdit;
    EditIndice: TEdit;
    Button1: TButton;
    EditLinha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbTipoChamada: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 EditFormat.Clear;
 EditIndice.Clear;
 EditLinha.Clear;
 lbTipoChamada.Caption:='...';
 close;
end;

end.
