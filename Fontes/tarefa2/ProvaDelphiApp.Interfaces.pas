unit ProvaDelphiApp.Interfaces;

interface

uses
  Vcl.ComCtrls, System.Threading;

type
  iParametrosContador = interface;

  iContador = interface
    ['{0D435885-F935-4ABD-9E65-80DBBB7DE782}']
    function AddContador : iParametrosContador;
    function ExecuteAll : iContador;
  end;

  iParametrosContador = interface
    ['{281265FB-3E0D-42F3-8A3E-6716430025E2}']
    function SetProgressBar (AValue : TProgressBar) : iParametrosContador;
    function GetProgressBar : TProgressBar;
    function SetIntervalo (AValue : integer) : iParametrosContador;
    function GetIntervalo : integer;
    function &End : iContador;
  end;

  iExecuteContador = interface
    ['{C3389605-63A5-4812-BFDE-20EFD7C409B4}']
    function SetProgressBar (AValue : TProgressBar) : iExecuteContador;
    function SetTask (var AValue : iTask) : iExecuteContador;
    function SetInterval (AValue : integer) : iExecuteContador;
    function SetLoops (AValue : integer) : iExecuteContador;
    function Execute : iExecuteContador;
  end;


implementation

end.
