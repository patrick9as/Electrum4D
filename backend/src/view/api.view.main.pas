unit api.view.main;

interface

uses
  api.server,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw, uCEFWinControl, uCEFWindowParent,
  uCEFChromiumCore, uCEFChromium, uCEFTypes, uCEFInterfaces;

type
  TViewMain = class(TForm)
    TrayIcon: TTrayIcon;
    CEFWindowParent1: TCEFWindowParent;
    Panel1: TPanel;
    btnIniciar: TButton;
    btnParar: TButton;
    edtPorta: TEdit;
    lblStatus: TLabel;
    Chromium1: TChromium;
    Button1: TButton;
    cbxManterAberto: TCheckBox;
    cbxBloquearDevTools: TCheckBox;
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Chromium1AfterCreated(Sender: TObject;
      const browser: ICefBrowser);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Chromium1BeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure Chromium1PreKeyEvent(Sender: TObject; const browser: ICefBrowser;
      const event: PCefKeyEvent; osEvent: TCefEventHandle;
      out isKeyboardShortcut, Result: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;
  api: TServer;

const
  EVENTFLAG_NONE          = 0;
  EVENTFLAG_CAPS_LOCK_ON  = 1 shl 0;
  EVENTFLAG_SHIFT_DOWN    = 1 shl 1;
  EVENTFLAG_CONTROL_DOWN  = 1 shl 2;
  EVENTFLAG_ALT_DOWN      = 1 shl 3;
  EVENTFLAG_LEFT_MOUSE_BUTTON = 1 shl 4;
  EVENTFLAG_MIDDLE_MOUSE_BUTTON = 1 shl 5;
  EVENTFLAG_RIGHT_MOUSE_BUTTON = 1 shl 6;
  EVENTFLAG_COMMAND_DOWN  = 1 shl 7;
  EVENTFLAG_NUM_LOCK_ON   = 1 shl 8;
  EVENTFLAG_IS_KEY_PAD    = 1 shl 9;
  EVENTFLAG_IS_LEFT       = 1 shl 10;
  EVENTFLAG_IS_RIGHT      = 1 shl 11;

implementation

{$R *.dfm}

procedure TViewMain.btnIniciarClick(Sender: TObject);
begin
  api.Start(StrToInt(edtPorta.Text));
  lblStatus.Caption := 'Serviço iniciado';
  edtPorta.Enabled := False;
  btnIniciar.Enabled := False;
  btnParar.Enabled := True;

  Chromium1.MultiBrowserMode := True;
  Chromium1.DefaultUrl := 'https://zustand-demo.pmnd.rs/';
end;

procedure TViewMain.btnPararClick(Sender: TObject);
begin
  api.Stop();
  lblStatus.Caption := 'Serviço parado';
  edtPorta.Enabled := True;
  btnIniciar.Enabled := True;
  btnParar.Enabled := False;
end;

procedure TViewMain.Button1Click(Sender: TObject);
begin
  Chromium1.LoadURL('https://zustand-demo.pmnd.rs/');
end;

procedure TViewMain.Chromium1AfterCreated(Sender: TObject;
  const browser: ICefBrowser);
begin
//  Chromium1.LoadURL('https://zustand-demo.pmnd.rs/');
  Chromium1.LoadURL('localhost:9000');
end;

procedure TViewMain.Chromium1BeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
var
  i: Integer;
  itemLabel: ustring;
begin
  if not cbxBloquearDevTools.Checked then
    Exit;
  //Deixa só o copiar e colar
  for i := model.GetCount - 1 downto 0 do
  begin
    itemLabel := LowerCase(model.GetLabelAt(i));

    if (Pos('copy', itemLabel) = 0) and (Pos('paste', itemLabel) = 0) then
      model.RemoveAt(i);
  end;
end;

procedure TViewMain.Chromium1PreKeyEvent(Sender: TObject;
  const browser: ICefBrowser; const event: PCefKeyEvent;
  osEvent: TCefEventHandle; out isKeyboardShortcut, Result: Boolean);
var
  key: Integer;
  mods: Integer;
  character: WideString;
begin
  if not cbxBloquearDevTools.Checked then
    Exit;

  Result := False;
  isKeyboardShortcut := False;
  key := event^.windows_key_code;
  mods := event^.modifiers;

  if event^.kind = KEYEVENT_RAWKEYDOWN then
  begin
    if event^.windows_key_code in [VK_F1, VK_F5, VK_F12] then
    begin
      Result := True;
    end;
  end;

  // Ctrl + U
  if (key = Ord('U')) and (mods and EVENTFLAG_CONTROL_DOWN <> 0) then
    Result := True;

  // Ctrl + Shift + I / J / C / M / E
  if (mods and EVENTFLAG_CONTROL_DOWN <> 0) and (mods and EVENTFLAG_SHIFT_DOWN <> 0) then
  begin
    if key in [Ord('I'), Ord('J'), Ord('C'), Ord('M'), Ord('E')] then
      Result := True;
  end;

  // Ctrl + Alt + I (em algumas distros do Chromium)
  if (key = Ord('I')) and
     (mods and EVENTFLAG_CONTROL_DOWN <> 0) and
     (mods and EVENTFLAG_ALT_DOWN <> 0) then
    Result := True;

   // Bloquear Alt + < (voltar) e Alt + > (avançar)
  if (mods and EVENTFLAG_ALT_DOWN <> 0) and
     (key in [VK_LEFT, VK_RIGHT]) then
  begin
    Result := True;
  end;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not cbxManterAberto.Checked then
  begin
    if btnIniciar.Enabled then
      btnParar.Click();
    Exit;
  end;

  if btnIniciar.Enabled then
    Exit;

  Action := caNone;
  Self.Hide();
  TrayIcon.Visible := True;
end;

procedure TViewMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Chromium1.CloseAllBrowsers;
  CEFWindowParent1.Free;
end;

procedure TViewMain.FormShow(Sender: TObject);
var
  I: Integer;
begin
  btnIniciar.Click();

  Chromium1.WebRTCIPHandlingPolicy := hpDisableNonProxiedUDP;
  Chromium1.WebRTCMultipleRoutes   := STATE_DISABLED;
  Chromium1.WebRTCNonproxiedUDP    := STATE_DISABLED;

  Chromium1.CreateBrowser(CEFWindowParent1, '');
end;

procedure TViewMain.TrayIconClick(Sender: TObject);
begin
  Self.Show();
  TrayIcon.Visible := False;
end;

end.
