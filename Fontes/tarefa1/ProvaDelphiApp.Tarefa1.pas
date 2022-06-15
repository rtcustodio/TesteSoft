unit ProvaDelphiApp.Tarefa1;

interface

uses
  ProvaDelphiApp.Tarefa1.Interfaces,
  System.Classes,
  uspQuery,
  System.SysUtils;

type
  TSQLGenerator = class(TInterfacedObject, iSQLGenerator)
  private
    spQuery : TspQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iSQLGenerator;
    function AddColuna(AValue : string) : iSQLGenerator; overload;
    function AddColuna(const AValue : TStrings) : iSQLGenerator; overload;
    function AddTabela(AValue : string) : iSQLGenerator; overload;
    function AddTabela(const AValue : TStrings) : iSQLGenerator; overload;
    function AddCondicao(AValue : string) : iSQLGenerator; overload;
    function AddCondicao(const AValue : TStrings) : iSQLGenerator; overload;
    function ClearColunas : iSQLGenerator;
    function ClearTabelas : iSQLGenerator;
    function ClearCondicoes : iSQLGenerator;
    function GetSQL : string;
  end;

implementation

{ TGeraSQL }

function TSQLGenerator.AddColuna(AValue: string): iSQLGenerator;
begin
  Result := Self;
  spQuery.spColunas.Add(AValue);
end;

function TSQLGenerator.AddColuna(const AValue: TStrings): iSQLGenerator;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(AValue.Count) do
    AddColuna(AValue[I]);
end;

function TSQLGenerator.AddCondicao(const AValue: TStrings): iSQLGenerator;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(AValue.Count) do
    AddCondicao(AValue[I]);
end;

function TSQLGenerator.AddCondicao(AValue: string): iSQLGenerator;
begin
  Result := Self;
  spQuery.spCondicoes.Add(AValue);
end;

function TSQLGenerator.AddTabela(const AValue: TStrings): iSQLGenerator;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(AValue.Count) do
    AddTabela(AValue[I]);
end;

function TSQLGenerator.AddTabela(AValue: string): iSQLGenerator;
begin
  Result := Self;
  spQuery.spTabelas.Add(AValue);
end;

function TSQLGenerator.ClearColunas: iSQLGenerator;
begin
  Result := Self;
  spQuery.spColunas.Clear;
end;

function TSQLGenerator.ClearCondicoes: iSQLGenerator;
begin
  Result := Self;
  spQuery.spCondicoes.Clear;
end;

function TSQLGenerator.ClearTabelas: iSQLGenerator;
begin
  Result := Self;
  spQuery.spTabelas.Clear;
end;

constructor TSQLGenerator.Create;
begin
  spQuery := TspQuery.Create(nil);
end;

destructor TSQLGenerator.Destroy;
begin
  FreeAndNil(spQuery);
  inherited;
end;

function TSQLGenerator.GetSQL: string;
begin
  spQuery.GeraSQL;
  Result := spQuery.SQL.Text;
end;

class function TSQLGenerator.New: iSQLGenerator;
begin
  Result := Self.Create;
end;

end.
