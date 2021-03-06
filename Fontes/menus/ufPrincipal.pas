unit ufPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  System.Actions,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  ProvaDelphiApp.MenuPrincipal,
  ProvaDelphiApp.MenuPrincipal.Interfaces;

type
  TfPrincipal = class(TForm)
    actmgrMenuPrincipal: TActionManager;
    actTarefa1: TAction;
    actTarefa2: TAction;
    actTarefa3: TAction;
    mmMenu: TMainMenu;
    arefas1: TMenuItem;
    actTarefa11: TMenuItem;
    actTarefa21: TMenuItem;
    acttarefa31: TMenuItem;
    procedure actTarefa1Execute(Sender: TObject);
    procedure actTarefa2Execute(Sender: TObject);
    procedure actTarefa3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    MenuPrincipal : iMenuPrincipal;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.actTarefa1Execute(Sender: TObject);
begin
  MenuPrincipal.AbrirTarefa1;
end;

procedure TfPrincipal.actTarefa2Execute(Sender: TObject);
begin
  MenuPrincipal.AbrirTarefa2;
end;

procedure TfPrincipal.actTarefa3Execute(Sender: TObject);
begin
  MenuPrincipal.AbrirTarefa3;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  MenuPrincipal := TMenuPrincipal.New;
//  ReportMemoryLeaksOnShutdown := true;
end;

end.
