unit ProvaDelphiApp.MenuPrincipal;

interface

uses
  ProvaDelphiApp.MenuPrincipal.Interfaces,
  ufTarefa1,
  ProvaDelphiApp.Tarefa2,
  ufTarefa3,
  Vcl.Forms;

type
  TMenuPrincipal = class(TInterfacedObject, iMenuPrincipal)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iMenuPrincipal;
    function AbrirTarefa1 : iMenuPrincipal;
    function AbrirTarefa2 : iMenuPrincipal;
    function Abrirtarefa3 : iMenuPrincipal;
  end;

implementation


{ TMenuPrincipal }

function TMenuPrincipal.AbrirTarefa1: iMenuPrincipal;
var
  fTarefa1: TfTarefa1;
begin
  Application.CreateForm(TfTarefa1, fTarefa1);
end;

function TMenuPrincipal.AbrirTarefa2: iMenuPrincipal;
var
  fTarefa2: TfTarefa2;
begin
  Application.CreateForm(TfTarefa2, fTarefa2);
end;

function TMenuPrincipal.Abrirtarefa3: iMenuPrincipal;
var
  fTarefa3: TfTarefa3;
begin
  Application.CreateForm(TfTarefa3, fTarefa3);
end;

constructor TMenuPrincipal.Create;
begin

end;

destructor TMenuPrincipal.Destroy;
begin

  inherited;
end;

class function TMenuPrincipal.New: iMenuPrincipal;
begin
  Result := Self.Create;
end;

end.
