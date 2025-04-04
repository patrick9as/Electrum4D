program API_Atendimento;

uses
  Vcl.Forms,
  api.view.main in 'src\view\api.view.main.pas' {ViewMain},
  api.controller.perguntas in 'src\controller\api.controller.perguntas.pas',
  api.server in 'src\server\api.server.pas',
  api.controller.respostas in 'src\controller\api.controller.respostas.pas',
  api.controller.contract in 'src\controller\contract\api.controller.contract.pas',
  api.repository.perguntas in 'src\repository\api.repository.perguntas.pas' {PerguntasRepository: TDataModule},
  api.database in 'src\database\api.database.pas' {Database: TDataModule},
  api.service.perguntas in 'src\service\api.service.perguntas.pas',
  api.model.perguntas in 'src\model\api.model.perguntas.pas',
  api.utils.json in 'src\utils\api.utils.json.pas',
  api.utils.guid in 'src\utils\api.utils.guid.pas',
  api.service.respostas in 'src\service\api.service.respostas.pas',
  api.model.respostas in 'src\model\api.model.respostas.pas',
  api.repository.respostas in 'src\repository\api.repository.respostas.pas' {RespostasRepository: TDataModule},
  api.database.migrations.v0001 in 'src\database\migrations\api.database.migrations.v0001.pas',
  api.utils.database in 'src\utils\api.utils.database.pas',
  api.database.migrations in 'src\database\migrations\api.database.migrations.pas',
  api.controller.home in 'src\controller\api.controller.home.pas';

{$R *.res}

begin
  System.ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDatabase, Database);
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
