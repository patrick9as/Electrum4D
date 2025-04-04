unit api.database.migrations;

interface

uses
  api.database.migrations.v0001;

type
  TMigrations = class
  public
    class procedure Execute();
  end;

implementation

{ TMigrations }

class procedure TMigrations.Execute;
begin
  T0001.Exec();
end;

end.
