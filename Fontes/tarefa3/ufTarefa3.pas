unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  ProvaDelphiApp.Projetos.Interfaces,
  ProvaDelphiApp.Factory.Interfaces,
  uspUtils,
  ProvaDelphiApp.Factory;

type
  TfTarefa3 = class(TForm)
    Label1: TLabel;
    dbgRegistros: TDBGrid;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    dsRegistros  : TDataSource;
    Factory : iFactory;
    Projetos : iProjetos;
    procedure CriarRegistrosRandomicos;
    procedure CriarComponentes;
  public
    { Public declarations }
  end;

implementation

uses
  ProvaDelphiApp.Projeto.Entidade;

{$R *.dfm}

procedure TfTarefa3.BitBtn1Click(Sender: TObject);
begin
  edtTotal.Text := Format('%m',[Projetos.GetValorTotal]);
end;

procedure TfTarefa3.BitBtn2Click(Sender: TObject);
begin
  edtTotalDivisoes.Text := Format('%m',[Projetos.GetValorTotalDivisoes]);
end;

procedure TfTarefa3.CriarRegistrosRandomicos;
var
  I : integer;
  Projeto : TProjeto;
begin
  Projeto := TProjeto.Create;
  try
    for I := 1 to 10 do
    begin
      Projeto.IdProjeto   := I;
      Projeto.NomeProjeto := 'Projeto ' + IntToStr(I) ;
      Projeto.Valor       := Random(1000);
      Projetos.GravarProjeto( Projeto );
    end;
  finally
    FreeAndNil(Projeto);
  end;
end;

procedure TfTarefa3.CriarComponentes;
begin
  Factory := TFactory.New;
  dsRegistros := TDataSource.Create(nil);
  dbgRegistros.DataSource := dsRegistros;
  Projetos := Factory.Projetos.SetDataSource(dsRegistros);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dsRegistros);
  FechaForm(Sender, Action);
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarComponentes;
  CriarRegistrosRandomicos;
end;

end.
