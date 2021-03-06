unit ProvaDelphiApp.Factory.Interfaces;

interface

uses
  ProvaDelphiApp.Tarefa1.Interfaces,
  ProvaDelphiApp.Interfaces,
  ProvaDelphiApp.Projetos.Interfaces;

type

  iFactory = interface
    ['{01A526EE-C22D-4734-92F4-9E2657092A63}']
    function SQLGenerator : iSQLGenerator;
    function ExecutaContador : iContador;
    function Projetos : iProjetos;
  end;

implementation

end.
