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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;
  api: TServer;

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
  //Remover o devtools do context menu
  for i := model.GetCount - 1 downto 0 do
  begin
    itemLabel := LowerCase(model.GetLabelAt(i));

    if (Pos('nspect', itemLabel) > 0) or (Pos('nspecionar', itemLabel) > 0) then
      model.RemoveAt(i);

    if (Pos('source', itemLabel) > 0) or (Pos('fonte', itemLabel) > 0) then
      model.RemoveAt(i);
  end;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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
