unit api.service.perguntas;

interface

uses
  JSON,
  REST.JSON,
  api.utils.json,
  System.Generics.Collections,
  api.repository.perguntas,
  api.model.perguntas,
  SysUtils;

type

  IPerguntasService = interface
    function New: IPerguntasService;
    function GetAll(): TJSONArray;
  end;

  TPerguntasService = class(TInterfacedObject, IPerguntasService)
  public
    function New: IPerguntasService;
    function GetAll(): TJSONArray;
  end;

implementation

{ TPerguntasService }

function TPerguntasService.GetAll(): TJSONArray;
var
  repository: TPerguntasRepository;
  perguntas: TObjectList<TPergunta>;
  pergunta: TPergunta;
  JSONArray: TJSONArray;
begin

  repository := TPerguntasRepository.Create(nil);
  try
    perguntas := repository.GetAll();
    JSONArray := TJSONArray.Create();
    try
      for pergunta in perguntas do
        JSONArray.AddElement(TJSON.ObjectToJsonObject(pergunta, [joDateFormatISO8601]));
      Result := JSONArray;
    finally
      perguntas.Free();
    end;
  finally
    repository.Free();
  end;
end;

function TPerguntasService.New: IPerguntasService;
begin
  Result := TPerguntasService.Create();
end;

end.
