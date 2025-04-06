program WebServer;

uses
  uCEFApplication,
  uCEFConstants,
  uCEFInterfaces,
  Vcl.Forms,
  api.view.main in 'src\view\api.view.main.pas' {ViewMain},
  api.server in 'src\server\api.server.pas',
  api.database in 'src\database\api.database.pas' {Database: TDataModule},
  api.utils.json in 'src\utils\api.utils.json.pas',
  api.utils.guid in 'src\utils\api.utils.guid.pas',
  api.database.migrations.v0001 in 'src\database\migrations\api.database.migrations.v0001.pas',
  api.utils.database in 'src\utils\api.utils.database.pas',
  api.database.migrations in 'src\database\migrations\api.database.migrations.pas',
  api.controller.login in 'src\controller\api.controller.login.pas',
  api.controller.pdv in 'src\controller\api.controller.pdv.pas',
  api.utils.windows in 'src\utils\api.utils.windows.pas',
  api.view.pdv in 'src\view\api.view.pdv.pas' {PdvView};

{$R *.res}

procedure GlobalCEFApp_OnUncaughtException(const browser: ICefBrowser; const frame: ICefFrame; const context: ICefv8Context; const exception: ICefV8Exception; const stackTrace: ICefV8StackTrace);
begin
  // This code runs in the render process and we can't set a breakpoint to debug it from the main application process.
  // Read this for more information about debugging CEF subprocesses :
  // https://www.briskbard.com/index.php?lang=en&pageid=cef#debugging
  // In this example we only use the "console trick" explained in the DOMVisitor demo to send some custom text to the
  // main process that will be received in TChromiumCore.OnConsoleMessage
  // Load the following page and delete the try..catch lines to test this event :
  // https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_state_throw_error
  if assigned(frame) and frame.IsValid then
    frame.ExecuteJavaScript('console.log("GlobalCEFApp_OnUncaughtException");', '', 0);
end;

begin
  System.ReportMemoryLeaksOnShutdown := True;

  GlobalCEFApp                            := TCefApplication.Create;
  GlobalCEFApp.cache                      := 'cache';
  GlobalCEFApp.EnablePrintPreview         := True;
  GlobalCEFApp.EnableGPU                  := True;
  GlobalCEFApp.LogFile                    := 'debug.log';
  GlobalCEFApp.LogSeverity                := LOGSEVERITY_INFO;
  GlobalCEFApp.UncaughtExceptionStackSize := 50;
  GlobalCEFApp.OnUncaughtException        := GlobalCEFApp_OnUncaughtException;

  if GlobalCEFApp.StartMainProcess then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TDatabase, Database);
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
  end;

  DestroyGlobalCEFApp;
end.
