unit api.controller.login;

interface

uses
  api.utils.json,
  JSON,
  REST.JSON,
  api.controller.contract,
  Horse,
  Horse.Core,
  api.service.perguntas;

type
  TLoginController = class(TInterfacedObject, IController)
  private
    function RegisterMethods(): Boolean;
  public
    constructor Create();
    function New(): IController;
    function Get(): THorseCore;
    function Post(): THorseCore;
    function Put(): THorseCore;
    const RouteName = '/login';
  end;

implementation

{ TLoginController }

constructor TLoginController.Create;
begin
  RegisterMethods();
end;

function TLoginController.Get: THorseCore;
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

function TLoginController.New: IController;
begin
  Result := TLoginController.Create();
end;

function TLoginController.Post: THorseCore;
var
  JSONObject: TJSONObject;
  tempValue: TJSONValue;
  usuario: string;
  senha: string;
begin
  Result := THorse.Post(RouteName,
    procedure (Req: THorseRequest; Res: THorseResponse)
    begin

      if not TJSONUtils.TryStrToJSONObject(Req.Body, JSONObject) then
        Res.Status(401).Send('Payload inválido!');

      if Assigned(JSONObject) then
      JSONObject.Free();

      JSONObject := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;

      if (not JSONObject.TryGetValue('usuario', tempValue)) then
        Res.Status(401).Send('Payload inválido!');

      if (not JSONObject.TryGetValue('senha', tempValue)) then
        Res.Status(401).Send('Payload inválido!');

      usuario := JSONObject.GetValue<string>('usuario');
      senha := JSONObject.GetValue<string>('senha');

      Res.Status(200).Send('Login efetuado ' + usuario + ' ' + senha);
    end);
end;

function TLoginController.Put: THorseCore;
begin

end;

function TLoginController.RegisterMethods: Boolean;
begin
  Get();
  Post();
  Put();
end;

end.
