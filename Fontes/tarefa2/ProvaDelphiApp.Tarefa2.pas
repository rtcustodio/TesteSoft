unit ProvaDelphiApp.Tarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  ProvaDelphiApp.Factory.Interfaces,
  uspUtils,
  ProvaDelphiApp.Factory;

type
  TfTarefa2 = class(TForm)
    edtTempoThread1: TEdit;
    edtTempoThread2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnExecutaThread: TBitBtn;
    pgBar1: TProgressBar;
    pgBar2: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaThreadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Factory : iFactory;
    function GetIntervalo1 : integer;
    function GetIntervalo2 : integer;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfTarefa2 }

procedure TfTarefa2.btnExecutaThreadClick(Sender: TObject);
begin
  Factory
    .ExecutaContador
      .AddContador.SetProgressBar(pgBar1).SetIntervalo(GetIntervalo1).&End
      .AddContador.SetProgressBar(pgBar2).SetIntervalo(GetIntervalo2).&End
    .ExecuteAll;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaForm(Sender, Action);
end;

procedure TfTarefa2.FormCreate(Sender: TObject);
begin
  Factory := TFactory.New;
end;

function TfTarefa2.GetIntervalo1: integer;
begin
  try
    Result := StrToInt(edtTempoThread1.Text);
  except
    raise Exception.Create('Valor incorreto para o intervalo 1');
  end;
end;

function TfTarefa2.GetIntervalo2: integer;
begin
  try
    Result := StrToInt(edtTempoThread2.Text);
  except
    raise Exception.Create('Valor incorreto para o intervalo 2');
  end;
end;

end.
