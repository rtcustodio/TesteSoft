unit ProvaDelphiApp.Projetos;

interface

uses
  ProvaDelphiApp.Projetos.Interfaces,
  Datasnap.DBClient,
  Data.DB,
  ProvaDelphiApp.Projeto.Entidade;

type
  TProjetos = class(TInterfacedObject, iProjetos)
  private
    FClientDataSet : TClientDataSet;
    procedure CriarDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iProjetos;
    function SetDataSource (AValue : TDataSource) : iProjetos;
    function GravarProjeto (AValue : TProjeto) : iProjetos;
    function GetValorTotal : Double;
    function GetValorTotalDivisoes : Double;
  end;

  const
    COLUNA_VALOR = 2;

implementation

uses
  System.SysUtils, Math;

{ TProjetos }

constructor TProjetos.Create;
begin
  CriarDataSet;
end;

procedure TProjetos.CriarDataSet;
begin
  FClientDataSet := TClientDataSet.Create(nil);
  FClientDataSet.Close;
  FClientDataSet.FieldDefs.Clear;
  FClientDataSet.FieldDefs.add('IdProjeto',ftInteger);
  FClientDataSet.FieldDefs.add('NomeProjeto',ftString,250);
  FClientDataSet.FieldDefs.add('Valor',ftFloat);
  FClientDataSet.CreateDataSet;
  TFloatField( FClientDataSet.FieldByName('Valor') ).Currency := true;
end;

destructor TProjetos.Destroy;
begin
  FreeAndNil(FClientDataSet);
  inherited;
end;

function TProjetos.GetValorTotal: Double;
begin
  FClientDataSet.DisableControls;
  FClientDataSet.First;
  Result := 0;
  while not FClientDataSet.Eof do
  begin
    Result := Result + TFloatField(FClientDataSet.Fields[COLUNA_VALOR]).Value;
    FClientDataSet.Next;
  end;
  FClientDataSet.EnableControls;
end;

function TProjetos.GetValorTotalDivisoes: Double;
var
  I : integer;
  Valor1, Valor2 : Double;
begin
  FClientDataSet.DisableControls;
  FClientDataSet.First;
  Result := 0;

  for I := 1 to Pred(FClientDataSet.RecordCount) do
  begin
    Valor1 := TFloatField(FClientDataSet.Fields[COLUNA_VALOR]).Value;
    FClientDataSet.Next;
    Valor2 := TFloatField(FClientDataSet.Fields[COLUNA_VALOR]).Value;
    Result := Result + (Valor2 / Valor1);
  end;
  Result := RoundTo(Result, -2);
  FClientDataSet.EnableControls;
end;

function TProjetos.GravarProjeto(AValue: TProjeto): iProjetos;
begin
  FClientDataSet.Append;
  FClientDataSet.FieldByName('IdProjeto').AsInteger   := AValue.IdProjeto ;
  FClientDataSet.FieldByName('NomeProjeto').AsString  := AValue.NomeProjeto ;
  FClientDataSet.FieldByName('Valor').AsFloat         := AValue.Valor;
  FClientDataSet.Post;
end;

class function TProjetos.New: iProjetos;
begin
  Result := Self.Create;
end;

function TProjetos.SetDataSource(AValue : TDataSource) : iProjetos;
begin
  Result := Self;
  AValue.DataSet := FClientDataSet;
end;

end.
