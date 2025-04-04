unit api.utils.json;

interface

uses
  System.Generics.Collections,
  REST.JSON,
  JSON,
  SysUtils;

type
  TJSONUtils = class
  private
  public
    class function TestAndGetValue<T>(AJSONObject: TJSONObject; APath: String): T;
    class function UTF8(AJSONString: String): String;
    class function TryStrToJSONObject(const AJSONString: string; out AJSONObject: TJSONObject): Boolean;
  end;

implementation

{ TJSONUtils }

class function TJSONUtils.TestAndGetValue<T>(AJSONObject: TJSONObject; APath: String): T;
var
  tempValue: TJSONValue;
begin
  try
    if AJSONObject.TryGetValue(APath, TempValue) then
      Result := AJSONObject.GetValue<T>(APath);
  finally
    if Assigned(tempValue) then
      tempValue.Free();
  end;

end;

class function TJSONUtils.UTF8(AJSONString: String): String;
var
  UTF8Bytes: TBytes;
begin
  UTF8Bytes := TEncoding.UTF8.GetBytes(AJSONString);
  Result := TEncoding.UTF8.GetString(UTF8Bytes);
end;

class function TJSONUtils.TryStrToJSONObject(const AJSONString: string; out AJSONObject: TJSONObject): Boolean;
begin
  AJSONObject := nil;  // Inicializa o valor de saída como nil
  try
    // Tenta converter a string JSON para um TJSONObject
    AJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
    Result := AJSONObject <> nil;  // Retorna True se o parsing foi bem-sucedido e é um TJSONObject
  except
    // Se ocorrer uma exceção, retorna False
    Result := False;
  end;
end;

end.
