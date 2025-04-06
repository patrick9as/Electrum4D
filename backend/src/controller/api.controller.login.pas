unit api.controller.login;

interface

uses
  api.utils.json,
  JSON,
  REST.JSON,
  Horse;

procedure LoginController(prefix: string);

implementation

procedure LoginController(prefix: string);
begin
  THorse.Post(prefix + '/login',
    procedure(req: THorseRequest; res: THorseResponse)
    var
      JSONObject: TJSONObject;
      tempValue: TJSONValue;
      usuario: string;
      senha: string;
    begin

      if not TJSONUtils.TryStrToJSONObject(req.Body, JSONObject) then
        res.Status(401).Send('Payload inválido!');

      if Assigned(JSONObject) then
        JSONObject.Free();

      JSONObject := TJSONObject.ParseJSONValue(req.Body) as TJSONObject;

      if (not JSONObject.TryGetValue('usuario', tempValue)) then
        res.Status(401).Send('Payload inválido!');

      if (not JSONObject.TryGetValue('senha', tempValue)) then
        res.Status(401).Send('Payload inválido!');

      usuario := JSONObject.GetValue<string>('usuario');
      senha := JSONObject.GetValue<string>('senha');

      res.Status(200).Send('Login efetuado ' + usuario + ' ' + senha);

      JSONObject.Free();
    end);
end;

end.
