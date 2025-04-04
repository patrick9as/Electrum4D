unit api.server;

interface

uses
  Horse,
  Horse.Jhonson,
  api.controller.perguntas,
  api.controller.respostas, api.controller.home,
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
begin
  THorse.use(Jhonson());
  //Carregar as rotas
  perguntas.New();
  respostas.New();
  THorse.Use('/', HorseStaticFile('dist', ['index.html']));


//  THorse.Get('/',
//    procedure (Req: THorseRequest; Res: THorseResponse)
//    begin
//      Res.Send('API de Atendimento');
//    end);
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
