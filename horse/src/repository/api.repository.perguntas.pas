unit api.repository.perguntas;

interface

uses
  api.database,
  api.utils.guid,
  System.Generics.Collections,
  api.model.perguntas,
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni;

type
  TPerguntasRepository = class(TDataModule)
    Table: TUniTable;
    QrySQL: TUniQuery;
    TableID: TIntegerField;
    TableDescricao: TStringField;
    TableCreated_At: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAll(): TObjectList<TPergunta>;
  end;

var
  PerguntasRepository: TPerguntasRepository;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TPerguntasModel }

function TPerguntasRepository.GetAll(): TObjectList<TPergunta>;
var
 pergunta: TPergunta;
begin
  with QrySQL do
  begin
    Close();
    SQL.Clear();
    SQL.Add('SELECT * FROM ' + Table.TableName);
    Open();
    First();

    Result := TObjectList<TPergunta>.Create();

    while not Eof do
    begin
      pergunta := TPergunta.Create();
      pergunta.ID := FieldByName('ID').AsInteger;
      pergunta.Descricao := FieldByName('Descricao').AsString;
      Result.Add(pergunta);
      Next();
    end;
  end;
end;

end.
