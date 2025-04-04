unit api.model.perguntas;

interface

type
  TPergunta = class
  private
    FID: Integer;
    FDescricao: String;
  public
    property ID: Integer read FID write FID;
    property Descricao: String read FDescricao write FDescricao;
  end;

implementation

end.
