unit ProvaDelphiApp.ExecuteContador;

interface

uses
  ProvaDelphiApp.Interfaces,
  Vcl.ComCtrls,
  System.Threading;

type
  TExecuteContador = class(TInterfacedObject, iExecuteContador)
  private
    FProgressBar :  TProgressBar;
    FTask : iTask;
    FInterval : integer;
    FLoops : integer;
    procedure SetDefaultParameters;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iExecuteContador;
    function SetProgressBar (AValue : TProgressBar) : iExecuteContador;
    function SetTask (var AValue : iTask) : iExecuteContador;
    function SetInterval (AValue : integer) : iExecuteContador;
    function SetLoops (AValue : integer) : iExecuteContador;
    function Execute : iExecuteContador;
  end;

implementation

uses
  Winapi.Windows, System.Classes, System.SysUtils, Vcl.Dialogs;

{ TExecuteContador }

constructor TExecuteContador.Create;
begin
  SetDefaultParameters;
end;

destructor TExecuteContador.Destroy;
begin

  inherited;
end;

function TExecuteContador.Execute: iExecuteContador;
var
  ProgressBar : TProgressBar;
begin
  ProgressBar := FProgressBar;
  ProgressBar.Position := 0;
  ProgressBar.Max      := FLoops;
  ProgressBar.Step     := 1;

  FTask := TTask.Run(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to FLoops do
      begin
        Sleep(FInterval);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
//          ShowMessage(FProgressbar.Name);
          ProgressBar.StepIt;
        end);
      end;
    end
  );
end;

class function TExecuteContador.New: iExecuteContador;
begin
  Result := Self.Create;
end;

procedure TExecuteContador.SetDefaultParameters;
begin
  FInterval := 1000;
  FLoops := 100;
//  FProgressBar := nil;
end;

function TExecuteContador.SetInterval(AValue: integer): iExecuteContador;
begin
  Result := Self;
  FInterval := AValue;
end;

function TExecuteContador.SetLoops(AValue: integer): iExecuteContador;
begin
  Result := Self;
  FLoops := AValue;
end;

function TExecuteContador.SetProgressBar(
  AValue: TProgressBar): iExecuteContador;
begin
  Result := Self;
  FProgressBar := AValue;
end;

function TExecuteContador.SetTask(var AValue : iTask) : iExecuteContador;
begin
  Result := Self;
//  FTask := AValue;

  FProgressBar.Position := 0;
  FProgressBar.Max      := FLoops;
  FProgressBar.Step     := 1;

  AValue := TTask.Run(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to FLoops do
      begin
        Sleep(FInterval);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
//          ShowMessage(FProgressbar.Name);
          FProgressBar.StepIt;
        end);
      end;
    end
  );
end;

end.
