unit api.server;

interface

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  Horse.StaticFiles,
  api.controller.login,
  api.controller.pdv;

type
  TStatusCode = Integer;

  TResponse = record
    StatusCode: TStatusCode;
    Body: String;
  end;

  IServer = interface
    function Start(APort: Integer): IServer;
    procedure Stop();
  end;

  TServer = class(TInterfacedObject, IServer)
  private
  public
    constructor Create();
    destructor Destroy();
    function Start(APort: Integer): IServer;
    procedure Stop();
  end;

implementation

{ TServer }

constructor TServer.Create;
const
  prefix = '/api';
begin
  //Dependências
  THorse.use(Jhonson());
  THorse.Use(CORS);

  //Registro das rotas
  THorse.Use('/', HorseStaticFile('www', ['index.html']));
  LoginController(prefix);
  PdvController(prefix);
end;

destructor TServer.Destroy;
begin
  Stop();
end;

function TServer.Start(APort: Integer): IServer;
begin
  Result := TServer.Create();
  if not THorse.IsRunning then
    THorse.Listen(APort);
end;

procedure TServer.Stop;
begin
  THorse.StopListen();
end;

end.
