unit ProvaDelphiApp.Contador;

interface

uses
  ProvaDelphiApp.Interfaces,
  System.Threading,
  System.Generics.Collections,
  Vcl.ComCtrls;

type
  TContador = class(TInterfacedObject, iContador)
  private
    Tasks : array of ITask;
    FFilaContador : TList<iParametrosContador>;
    procedure RunTask (Progressbar: TProgressBar; var Task: ITask;
  Intervalo: Integer = 1000; Loops: Integer = 100);
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iContador;
    function AddContador : iParametrosContador;
    function ExecuteAll : iContador;
  end;

implementation

uses
  Winapi.Windows, System.Classes, System.SysUtils,
  ProvaDelphiApp.ParametrosContador, ProvaDelphiApp.ExecuteContador;

{ TExecutaContador }

function TContador.AddContador: iParametrosContador;
var
  Contador : iParametrosContador;
begin
  Contador := TParametrosContador.New(Self);
  FFilaContador.Add(Contador);
  Result := Contador;
end;

constructor TContador.Create;
begin
  FFilaContador := TList<iParametrosContador>.Create;
end;

destructor TContador.Destroy;
begin
  FreeAndNil(FFilaContador);
  inherited;
end;

function TContador.ExecuteAll: iContador;
var
  I : integer;
begin
  SetLength(Tasks, FFilaContador.Count);
  for I := 0 to Pred(FFilaContador.Count) do
  begin
    RunTask(
      FFilaContador[I].GetProgressBar,
      Tasks[I],
      FFilaContador[I].GetIntervalo
    );
  end;
end;

class function TContador.New: iContador;
begin
  Result := Self.Create;
end;

procedure TContador.RunTask(Progressbar: TProgressBar; var Task: ITask;
  Intervalo: Integer = 1000; Loops: Integer = 100);
begin
  ProgressBar.Position := 0;
  ProgressBar.Max := Loops;
  ProgressBar.Step := 1;
  Task := TTask.Run(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to Loops do
      begin
        Sleep(Intervalo);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Progressbar.StepIt;
        end);
      end;
    end
  );
end;

end.
