unit ProvaDelphiApp.Projetos.Interfaces;

interface

uses
  Data.DB, ProvaDelphiApp.Projeto.Entidade;

type
  iProjetos = interface
    ['{624DAC1E-5877-4C2C-84B6-C08BC2A80133}']
    function SetDataSource (AValue : TDataSource) : iProjetos;
    function GravarProjeto (AValue : TProjeto) : iProjetos;
    function GetValorTotal : Double;
    function GetValorTotalDivisoes : Double;
  end;

implementation

end.
