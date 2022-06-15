unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  uspUtils,
  ProvaDelphiApp.Tarefa1.Interfaces,
  ProvaDelphiApp.Factory.Interfaces,
  ProvaDelphiApp.Factory;

type
  TfTarefa1 = class(TForm)
    mmColunas: TMemo;
    mmTabela: TMemo;
    mmCondicoes: TMemo;
    mmSQL: TMemo;
    btnGeraSQL: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Factory : iFactory;
    procedure GerarSQL;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  GerarSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaForm(Sender, Action);
end;

procedure TfTarefa1.FormCreate(Sender: TObject);
begin
  Factory := TFactory.New;
end;

procedure TfTarefa1.GerarSQL;
begin
  mmSQL.Lines.Text :=
  Factory.
    SQLGenerator
      .AddColuna(mmColunas.Lines)
      .AddTabela(mmTabela.Lines)
      .AddCondicao(mmCondicoes.Lines)
      .GetSQL;
end;

end.
