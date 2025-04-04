unit api.database;

interface

uses
  api.database.migrations,
  Vcl.Forms, Vcl.Dialogs,
  System.SysUtils, System.Classes, UniProvider, SQLServerUniProvider,
  Data.DB, DBAccess, Uni, DASQLMonitor, UniSQLMonitor;

type
  TDatabase = class(TDataModule)
    Connection: TUniConnection;
    SQLServerUniProvider: TSQLServerUniProvider;
    UniSQLMonitor: TUniSQLMonitor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Database: TDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDatabase.DataModuleCreate(Sender: TObject);
var
  ConnectionString: TStringList;
begin
  Connection.Disconnect();

//  ConnectionString := TStringList.Create();
//  try
//    try
//      ConnectionString.LoadFromFile('Wincash.dll');
//      Connection.ConnectString := ConnectionString.Text;
//      Connection.Connect();
//    except
//      raise Exception.Create('Falha ao conectar com o banco de dados!');
//    end;
//  finally
//    ConnectionString.Free();
//  end;
//
//  TMigrations.Execute();
end;

end.
