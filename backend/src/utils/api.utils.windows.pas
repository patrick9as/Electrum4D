unit api.utils.windows;

interface

uses
  Windows, Forms;

procedure BringToFront;

implementation

procedure BringToFront;
var
  ForegroundThreadID, ThisThreadID: DWORD;
begin
  // Se já está em primeiro plano, não faz nada
  if GetForegroundWindow = Application.Handle then
    Exit;

  // Garante que a thread da janela atual tenha permissão para mudar o foco
  ForegroundThreadID := GetWindowThreadProcessId(GetForegroundWindow, nil);
  ThisThreadID := GetCurrentThreadId;

  AttachThreadInput(ThisThreadID, ForegroundThreadID, True);
  SetForegroundWindow(Application.Handle);
  BringWindowToTop(Application.Handle);
  SetFocus(Application.Handle);
  AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
end;

end.
