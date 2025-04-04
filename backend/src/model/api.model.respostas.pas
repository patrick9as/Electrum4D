unit api.model.respostas;

interface

uses
  SysUtils,
  api.utils.guid;

type
  TResposta = class
  private
    FID: Integer;
    FID_Pergunta: Integer;
    FValor: Integer;
  public
    property ID: Integer read FID write FID;
    property ID_Pergunta: Integer read FID_Pergunta write FID_Pergunta;
    property Valor: Integer read FValor write FValor;
  end;

implementation

{ TResposta }

end.
