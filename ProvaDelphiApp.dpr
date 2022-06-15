program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufPrincipal in 'Fontes\menus\ufPrincipal.pas' {fPrincipal},
  ufTarefa1 in 'Fontes\tarefa1\ufTarefa1.pas' {fTarefa1},
  ProvaDelphiApp.Tarefa2 in 'Fontes\tarefa2\ProvaDelphiApp.Tarefa2.pas' {fTarefa2},
  uspUtils in 'Fontes\utils\uspUtils.pas',
  ufTarefa3 in 'Fontes\tarefa3\ufTarefa3.pas' {fTarefa3},
  ProvaDelphiApp.MenuPrincipal.Interfaces in 'Fontes\menus\ProvaDelphiApp.MenuPrincipal.Interfaces.pas',
  ProvaDelphiApp.MenuPrincipal in 'Fontes\menus\ProvaDelphiApp.MenuPrincipal.pas',
  ProvaDelphiApp.Tarefa1.Interfaces in 'Fontes\tarefa1\ProvaDelphiApp.Tarefa1.Interfaces.pas',
  ProvaDelphiApp.Tarefa1 in 'Fontes\tarefa1\ProvaDelphiApp.Tarefa1.pas',
  ProvaDelphiApp.ParametrosContador in 'Fontes\tarefa2\ProvaDelphiApp.ParametrosContador.pas',
  ProvaDelphiApp.Contador in 'Fontes\tarefa2\ProvaDelphiApp.Contador.pas',
  ProvaDelphiApp.Interfaces in 'Fontes\tarefa2\ProvaDelphiApp.Interfaces.pas',
  ProvaDelphiApp.Projetos.Interfaces in 'Fontes\tarefa3\ProvaDelphiApp.Projetos.Interfaces.pas',
  ProvaDelphiApp.Projetos in 'Fontes\tarefa3\ProvaDelphiApp.Projetos.pas',
  ProvaDelphiApp.Factory.Interfaces in 'Fontes\factory\ProvaDelphiApp.Factory.Interfaces.pas',
  ProvaDelphiApp.Factory in 'Fontes\factory\ProvaDelphiApp.Factory.pas',
  uspQuery in 'Fontes\componente\uspQuery.pas',
  ProvaDelphiApp.Projeto.Entidade in 'Fontes\tarefa3\ProvaDelphiApp.Projeto.Entidade.pas',
  ProvaDelphiApp.ExecuteContador in 'Fontes\tarefa2\ProvaDelphiApp.ExecuteContador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
