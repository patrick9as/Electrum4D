unit api.database.migrations.v0001;

interface

uses
  System.Classes;

type
  T0001 = class
  private
  public
    class procedure Exec;
  end;

implementation

uses
  api.utils.database;

{ T0001 }

class procedure T0001.Exec;
var
  sql: TStringList;
begin
  sql := TStringList.Create();
  try
    if not TDatabaseUtils.TableExists('NPS_Perguntas') then
    begin
      SQL.Clear();
      SQL.Add('CREATE TABLE NPS_Perguntas (');
      SQL.Add('  ID INT IDENTITY');
      SQL.Add('  ,Descricao VARCHAR(150) NULL');
      SQL.Add('  ,Created_At DATETIME NULL DEFAULT (GETDATE())');
      SQL.Add('  ,CONSTRAINT PK_NPS_Perguntas_id PRIMARY KEY CLUSTERED (ID)');
      SQL.Add(') ON [PRIMARY]');
      TDatabaseUtils.ExecSQL(SQL.Text);
    end;

    if not TDatabaseUtils.TableExists('NPS_Respostas') then
    begin
      SQL.Clear();
      SQL.Add('CREATE TABLE NPS_Respostas (');
      SQL.Add('  ID INT IDENTITY');
      SQL.Add('  ,ID_Pergunta INT NOT NULL');
      SQL.Add('  ,Valor INT NULL');
      SQL.Add('  ,Created_At DATETIME NULL DEFAULT (GETDATE())');
      SQL.Add('  ,CONSTRAINT PK_NPS_Respostas_ID PRIMARY KEY CLUSTERED (ID)');
      SQL.Add(') ON [PRIMARY]');
      TDatabaseUtils.ExecSQL(SQL.Text);

      SQL.Clear();
      SQL.Add('ALTER TABLE NPS_Respostas');
      SQL.Add('ADD CONSTRAINT FK_NPS_Respostas_ID_Pergunta FOREIGN KEY (ID_Pergunta) REFERENCES dbo.NPS_Perguntas (ID)');
      TDatabaseUtils.ExecSQL(SQL.Text);
    end;
  finally
    sql.Free();
  end;
end;

end.
