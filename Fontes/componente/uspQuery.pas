unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.TDataDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.TData;

type
  TspQuery = class(TFDQuery)
  private
    FDPhysTDataDriverLink1: TFDPhysTDataDriverLink;
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;

    procedure SetSpColunas(const Value: TStringList);
    procedure SetSpCondicoes(const Value: TStringList);
    procedure SetSpTabelas(const Value: TStringList);

    function GetSpColunas : string;
    function GetSpTabela : string;
    function GetSpCondicoes : string;
    function LimpaLinhasEmBrancoStringList(StringList : TStringList) : TStringList;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    procedure GeraSQL;
  published
    property spCondicoes : TStringList read FspCondicoes write SetSpCondicoes;
    property spColunas : TStringList read FspColunas write SetSpColunas;
    property spTabelas : TStringList read FspTabelas write SetSpTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  FDPhysTDataDriverLink1 := TFDPhysTDataDriverLink.Create(nil);
  FspCondicoes := TStringList.Create;
  FspColunas := TStringList.Create;
  FspTabelas := TStringList.Create;
  FspColunas.Delimiter := ',';
end;

destructor TspQuery.Destroy;
begin
  FreeAndNil(FDPhysTDataDriverLink1);
  FreeAndNil(FspCondicoes);
  FreeAndNil(FspColunas);
  FreeAndNil(FspTabelas);
  inherited;
end;

procedure TspQuery.GeraSQL;
begin
  SQL.Clear;
  SQL.Add(GetSpColunas);
  SQL.Add(GetSpTabela);
  SQL.Add(GetSpCondicoes);
end;

function TspQuery.LimpaLinhasEmBrancoStringList(
  StringList: TStringList): TStringList;
var
  I : integer;
begin
  for I := 0 to Pred(StringList.Count) do
    if StringList.Strings[i].IsEmpty then
      StringList.Delete(i);
  Result := StringList;
end;

function TspQuery.GetSpColunas: string;
begin
  FspColunas := LimpaLinhasEmBrancoStringList(FspColunas);
  if FspColunas.Count = 0 then
    raise Exception.Create('Ao menos uma coluna deve ser informada');
  Result := 'SELECT ' + spColunas.DelimitedText.Trim;
end;

function TspQuery.GetSpCondicoes: string;
var
  I: Integer;
begin
  FspCondicoes := LimpaLinhasEmBrancoStringList(FspCondicoes);
  if spCondicoes.Count = 0 then Exit;
  Result := 'WHERE ';

  for I := 0 to Pred(spCondicoes.Count) do
  begin
    Result := Result + spCondicoes[I].Trim;
    if I < spCondicoes.Count -1 then Result := Result + sLineBreak + 'AND ';
  end;
end;


function TspQuery.GetSpTabela: string;
begin
  FspTabelas := LimpaLinhasEmBrancoStringList(FspTabelas);

  if spTabelas.Count > 1 then
    raise Exception.Create('Apenas uma tabela deve ser informada');
  if spTabelas.Count = 0 then
    raise Exception.Create('Ao menos uma tabela deve ser informada');
  Result := 'FROM ' + spTabelas.Text.Trim;
end;

procedure TspQuery.SetSpColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetSpCondicoes(const Value: TStringList);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetSpTabelas(const Value: TStringList);
begin
  FspTabelas := Value;
end;

end.
