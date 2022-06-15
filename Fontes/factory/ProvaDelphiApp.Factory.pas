unit ProvaDelphiApp.Factory;

interface

uses
  ProvaDelphiApp.Factory.Interfaces,
  ProvaDelphiApp.Tarefa1.Interfaces,
  ProvaDelphiApp.Interfaces,
  ProvaDelphiApp.Projetos.Interfaces;

type
  TFactory = class(TInterfacedObject, iFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iFactory;
    function SQLGenerator : iSQLGenerator;
    function ExecutaContador : iContador;
    function Projetos : iProjetos;
  end;

implementation

uses
  ProvaDelphiApp.Tarefa1,
  ProvaDelphiApp.Projetos, ProvaDelphiApp.Contador;

{ TFactory }

constructor TFactory.Create;
begin

end;

destructor TFactory.Destroy;
begin

  inherited;
end;

function TFactory.ExecutaContador: iContador;
begin
  Result := TContador.New;
end;

function TFactory.SQLGenerator: iSQLGenerator;
begin
  Result := TSQLGenerator.New;
end;

class function TFactory.New: iFactory;
begin
  Result := Self.Create;
end;

function TFactory.Projetos: iProjetos;
begin
  Result := TProjetos.New;
end;

end.
