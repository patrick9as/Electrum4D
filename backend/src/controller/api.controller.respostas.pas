unit api.controller.respostas;

interface

uses
  SysUtils,
  api.controller.contract,
  JSON,
  api.service.respostas,
  Horse,
  Horse.Core;

type
  TRespostasController = class(TInterfacedObject, IController)
  private
    function Get(): THorseCore;
    function Post(): THorseCore;
    function Put(): THorseCore;
    function RegisterMethods(): Boolean;
  public
    constructor Create();
    function New(): IController;
    const RouteName = '/respostas';
  end;

implementation

{ TRespostasController }

constructor TRespostasController.Create;
begin
  RegisterMethods();
end;

function TRespostasController.Get: THorseCore;
begin
  Result := THorse.Get(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Status(200).Send('1');
    end);
end;

function TRespostasController.New: IController;
begin
  Result := TRespostasController.Create();
end;

function TRespostasController.Post: THorseCore;
begin
  Result := THorse.Post(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    var
      service: TRespostasService;
    begin
      try
        service
          .New
          .Post(Req);

        Res.Status(201).Send('OK');
      except on E: Exception do
        Res.Status(404).Send('Error 404: ' + E.Message);
      end;
    end);
end;

function TRespostasController.Put: THorseCore;
begin

end;

function TRespostasController.RegisterMethods(): Boolean;
begin
  Get();
  Post();
  Put();
end;

end.
