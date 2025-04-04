unit api.service.respostas;

interface

uses
  api.utils.json,
  Horse,
  JSON,
  REST.JSON,
  api.repository.respostas,
  api.model.respostas;

type
  IRespostasService = interface
    function New(): IRespostasService;
    function Post(Req: THorseRequest): Boolean;
  end;
  TRespostasService = class(TInterfacedObject, IRespostasService)
  private
    procedure JSONToResposta(AJSONObject: TJSONObject; AResposta: TResposta);
  public
    function New(): IRespostasService;
    function Post(Req: THorseRequest): Boolean;
  end;

implementation

{ TRespostasService }

procedure TRespostasService.JSONToResposta(AJSONObject: TJSONObject; AResposta: TResposta);
begin
  AResposta.ID_Pergunta := TJSONUtils.TestAndGetValue<Integer>(AJSONObject, 'ID_Pergunta');
  AResposta.Valor := TJSONUtils.TestAndGetValue<Integer>(AJSONObject, 'Valor');

//  if TJSONUtils.TestValue(AJSONObject, 'Valor') then
//    AResposta.Valor := AJSONObject.GetValue<Integer>('Valor');
end;

function TRespostasService.New(): IRespostasService;
begin
  Result := TRespostasService.Create();
end;

function TRespostasService.Post(Req: THorseRequest): Boolean;
var
  repository: TRespostasRepository;
  JSONObject: TJSONObject;
  valor: Integer;
  resposta: TResposta;
begin
  Result := False;

  if not TJSONUtils.TryStrToJSONObject(Req.Body, JSONObject) then
    Exit();

  if Assigned(JSONObject) then
    JSONObject.Free();

  JSONObject := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
  resposta := TResposta.Create();
  repository := TRespostasRepository.Create(nil);
  try
    JSONToResposta(JSONObject, resposta);
    Result := repository.Post(resposta) > 0;
  finally
    repository.Free();
    resposta.Free();
    JSONObject.Free();
  end;
end;

end.
