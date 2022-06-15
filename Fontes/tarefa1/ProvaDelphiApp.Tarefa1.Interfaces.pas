unit ProvaDelphiApp.Tarefa1.Interfaces;

interface

uses
  System.Classes;

type
  iSQLGenerator = interface
    ['{487C5AD4-9FD4-4DE8-8697-ED14884A41CB}']
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

end.
