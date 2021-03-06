unit TestesProvaDelphi;

interface

uses
  DUnitX.TestFramework,
  ProvaDelphiApp.Tarefa1.Interfaces,
  SysUtils,
  ProvaDelphiApp.Tarefa1,
  System.Classes,
  ProvaDelphiApp.Projeto.Entidade,
  ProvaDelphiApp.Projetos.Interfaces,
  ProvaDelphiApp.Projetos;

type
  [TestFixture]
  TTestesProvaDelphi = class
  private
    SQLGenerator : iSQLGenerator;
    Projetos : iProjetos;
    procedure CriaRegistrosProjetos;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestaGeracaoSQL;
    [Test]
    procedure TestaValorTotalProjeto;
    [Test]
    procedure TestaValorDivisoesProjeto;
  end;

implementation


procedure TTestesProvaDelphi.CriaRegistrosProjetos;
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
      Projeto.Valor       := I*10;
      Projetos.GravarProjeto( Projeto );
    end;
  finally
    FreeAndNil(Projeto);
  end;
end;

procedure TTestesProvaDelphi.Setup;
begin
  SQLGenerator  := TSQLGenerator.New;
  Projetos      := TProjetos.New;

  CriaRegistrosProjetos;
end;

procedure TTestesProvaDelphi.TearDown;
begin
end;

procedure TTestesProvaDelphi.TestaGeracaoSQL;
var
  SQLEsperado : TStrings;
begin
  SQLEsperado := TStringList.Create;
  try
    SQLEsperado.Add('SELECT CLI_NOME');
    SQLEsperado.Add('FROM cliente');
    SQLEsperado.Add('WHERE CLI_NOME = "RODRIGO"');

    SQLGenerator.AddColuna('CLI_NOME');
    SQLGenerator.AddTabela('cliente');
    SQLGenerator.AddCondicao('CLI_NOME = "RODRIGO"');

    Assert.AreEqual(
      SQLEsperado.Text.Trim,
      SQLGenerator.GetSQL.Trim ,
      'A gera??o de SQL n?o ocorreu conforme previsto'
    );
  finally
    FreeAndNil(SQLEsperado);
  end;

end;

procedure TTestesProvaDelphi.TestaValorDivisoesProjeto;
var
  ValorDivisaoEsperado : Double;
  ValorDivisao : Double;
begin
  ValorDivisao  := Projetos.GetValorTotalDivisoes;
  ValorDivisaoEsperado := 11.83;

  Assert.AreEqual(ValorDivisaoEsperado, ValorDivisao);
end;

procedure TTestesProvaDelphi.TestaValorTotalProjeto;
var
  ValorTotalEsperado : Double;
  ValorTotal : Double;
begin
  ValorTotal    := Projetos.GetValorTotal;
  ValorTotalEsperado := 550;

  Assert.AreEqual(ValorTotalEsperado, ValorTotal);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesProvaDelphi);

end.
