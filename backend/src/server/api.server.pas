unit api.server;

interface

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  api.controller.perguntas,
  api.controller.respostas,
  api.controller.home,
  api.controller.login,
  Horse.StaticFiles;

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
var
  perguntas: TPerguntasController;
  respostas: TRespostasController;
  home: THomeController;
  login: TLoginController;
begin
  THorse.use(Jhonson());
  //Carregar as rotas
  perguntas.New();
  respostas.New();
  THorse.Use('/', HorseStaticFile('www', ['index.html']));

  THorse.Use(CORS);

  login.New();
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
