unit api.controller.perguntas;

interface

uses
  JSON,
  api.controller.contract,
  Horse,
  Horse.Core,
  api.service.perguntas;

type
  TPerguntasController = class(TInterfacedObject, IController)
  private
    function RegisterMethods(): Boolean;
  public
    constructor Create();
    function New(): IController;
    function Get(): THorseCore;
    function Post(): THorseCore;
    function Put(): THorseCore;
    const RouteName = '/perguntas';
  end;

implementation

{ TPerguntasController }

constructor TPerguntasController.Create;
begin
  RegisterMethods();
end;

function TPerguntasController.Get: THorseCore;
begin
  Result := THorse.Get(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    var
      service: TPerguntasService;
    begin
      Res.Status(200).Send<TJSONArray>(
        service
          .New
          .GetAll());
    end);
end;

function TPerguntasController.New: IController;
begin
  Result := TPerguntasController.Create();
end;

function TPerguntasController.Post: THorseCore;
begin
  Result := THorse.Post(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Status(201).Send('Pergunta publicada com sucesso!');
    end);
end;

function TPerguntasController.Put: THorseCore;
begin

end;

function TPerguntasController.RegisterMethods: Boolean;
begin
  Get();
  Post();
  Put();
end;

end.
