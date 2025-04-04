unit api.repository.respostas;

interface

uses
  api.database,
  api.model.respostas,
  System.SysUtils, System.Classes, Uni, Data.DB, MemDS, DBAccess;

type
  TLinhasAfetadas = Integer;

  TRespostasRepository = class(TDataModule)
    Table: TUniTable;
    qrySQL: TUniQuery;
    TableID: TIntegerField;
    TableID_Pergunta: TIntegerField;
    TableValor: TIntegerField;
    TableCreated_At: TDateTimeField;
  private
    { Private declarations }
    procedure ObjectToData(AObject: TResposta; ADataSet: TDataSet);
  public
    { Public declarations }
    function Post(AResposta: TResposta): TLinhasAfetadas;
  end;

var
  RespostasRepository: TRespostasRepository;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRespostasRepository }

procedure TRespostasRepository.ObjectToData(AObject: TResposta;
  ADataSet: TDataSet);
begin
  with ADataSet do
  begin
    //AObject.ID é gerado pelo banco de dados
    FieldByName('ID_Pergunta').AsInteger := AObject.ID_Pergunta;
    FieldByName('Valor').AsInteger := AObject.Valor;
  end;
end;

function TRespostasRepository.Post(AResposta: TResposta): TLinhasAfetadas;
begin
  Result := 0;

  with Table do
  begin
    Close();
    FilterSQL := '1 = -1';
    Open();
    Append();
    ObjectToData(AResposta, Table);
    Post();

    Result := RowsAffected;
  end;
end;

end.
