unit ProvaDelphiApp.ParametrosContador;

interface

uses
  ProvaDelphiApp.Interfaces, Vcl.ComCtrls;

type
  TParametrosContador = class(TInterfacedObject, iParametrosContador)
  private
    [weak]
    FParent : iContador;
    FProgressBar : TProgressBar;
    FIntervalo : integer;
  public
    constructor Create(Parent : iContador);
    destructor Destroy; override;
    class function New(Parent : iContador) : iParametrosContador;
    function SetProgressBar (AValue : TProgressBar) : iParametrosContador;
    function GetProgressBar : TProgressBar;
    function SetIntervalo (AValue : integer) : iParametrosContador;
    function GetIntervalo : integer;
    function &End : iContador;
  end;

implementation

uses
  System.SysUtils;

{ TContador }

function TParametrosContador.&End: iContador;
begin
  Result := FParent;
end;

function TParametrosContador.GetIntervalo: integer;
begin
  Result := FIntervalo;
end;

function TParametrosContador.GetProgressBar: TProgressBar;
begin
  if not Assigned(FProgressBar) then
    raise Exception.Create('Nenhum ProgressBar foi atribuida');

  Result := FProgressBar;
end;

constructor TParametrosContador.Create(Parent : iContador);
begin
  FParent := Parent;
end;

destructor TParametrosContador.Destroy;
begin

  inherited;
end;

class function TParametrosContador.New(Parent : iContador) : iParametrosContador;
begin
  Result := Self.Create(Parent);
end;

function TParametrosContador.SetIntervalo(AValue: integer): iParametrosContador;
begin
  Result := Self;
  FIntervalo := AValue;
end;

function TParametrosContador.SetProgressBar(AValue: TProgressBar): iParametrosContador;
begin
  Result := Self;
  FProgressBar := AValue;
end;

end.
