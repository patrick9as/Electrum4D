unit api.controller.home;

interface

uses
  JSON,
  api.controller.contract,
  Horse,
  Horse.Core,
  api.service.perguntas;

type
  THomeController = class(TInterfacedObject, IController)
  private
    function RegisterMethods(): Boolean;
  public
    constructor Create();
    function New(): IController;
    function Get(): THorseCore;
    function Post(): THorseCore;
    function Put(): THorseCore;
    const RouteName = '/';
  end;

implementation

{ THomeController }

constructor THomeController.Create;
begin
  RegisterMethods();
end;

function THomeController.Get: THorseCore;
begin
  Result := THorse.Get(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    var
      service: TPerguntasService;
    begin
      Res.Status(200).Send('C:\GSOFT\react\index.html');
//      Res.Status(200).Send<TJSONArray>(
//        service
//          .New
//          .GetAll());
    end);
end;

function THomeController.New: IController;
begin
  Result := THomeController.Create();
end;

function THomeController.Post: THorseCore;
begin
  Result := THorse.Post(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Status(201).Send('Pergunta publicada com sucesso!');
    end);
end;

function THomeController.Put: THorseCore;
begin

end;

function THomeController.RegisterMethods: Boolean;
begin
  Get();
  Post();
  Put();
end;

end.
