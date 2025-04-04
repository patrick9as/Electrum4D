unit api.utils.database;

interface

uses
  api.database,
  Uni;

type
  TRowsAffected = Integer;

  TDatabaseUtils = class
  private
  public
    class function ExecSQL(ASQL: String): TRowsAffected;
    class function TableExists(ATableName: String): Boolean;
  end;

implementation

class function TDatabaseUtils.ExecSQL(ASQL: String): TRowsAffected;
var
  qrySQL: TUniQuery;
begin
  Result := 0;

  qrySQL := TUniQuery.Create(nil);
  try
    qrySQL.Connection := Database.Connection;
    qrySQL.Close();
    qrySQL.SQL.Clear();
    qrySQL.SQL.Add(ASQL);
    qrySQL.ExecSQL();

    Result := qrySQL.RowsAffected;
  finally
    qrySQL.Free();
  end;
end;

class function TDatabaseUtils.TableExists(ATableName: String): Boolean;
var
  qrySQL: TUniQuery;
begin
  Result := False;

  qrySQL := TUniQuery.Create(nil);
  try
    qrySQL.Close();
    qrySQL.Connection := Database.Connection;
    qrySQL.SQL.Clear();
    qrySQL.SQL.Add('SELECT name FROM sys.tables t');
    qrySQL.SQL.Add('WHERE name = :TableName');
    qrySQL.ParamByName('TableName').AsString := ATableName;
    qrySQL.Open();

    if not qrySQL.IsEmpty then
      Result := True;
  finally
    qrySQL.Free();
  end;
end;

end.
