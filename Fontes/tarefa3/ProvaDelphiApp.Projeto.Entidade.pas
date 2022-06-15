unit ProvaDelphiApp.Projeto.Entidade;

interface

type
  TProjeto = class
  private
    FValor: double;
    FIdProjeto: integer;
    FNomeProjeto: string;
    procedure SetIdProjeto(const Value: integer);
    procedure SetNomeProjeto(const Value: string);
    procedure SetValor(const Value: double);
  public
    property IdProjeto : integer read FIdProjeto write SetIdProjeto;
    property NomeProjeto : string read FNomeProjeto write SetNomeProjeto;
    property Valor : double read FValor write SetValor;
  end;

implementation

{ TProjeto }

procedure TProjeto.SetIdProjeto(const Value: integer);
begin
  FIdProjeto := Value;
end;

procedure TProjeto.SetNomeProjeto(const Value: string);
begin
  FNomeProjeto := Value;
end;

procedure TProjeto.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
