unit api.view.main;

interface

uses
  api.server,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TViewMain = class(TForm)
    btnIniciar: TButton;
    btnParar: TButton;
    lblStatus: TLabel;
    edtPorta: TEdit;
    TrayIcon: TTrayIcon;
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
end;

procedure TViewMain.btnPararClick(Sender: TObject);
begin
  api.Stop();
  lblStatus.Caption := 'Serviço parado';
  edtPorta.Enabled := True;
  btnIniciar.Enabled := True;
  btnParar.Enabled := False;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btnIniciar.Enabled then
    Exit;

  Action := caNone;
  Self.Hide();
  TrayIcon.Visible := True;
end;

procedure TViewMain.FormShow(Sender: TObject);
begin
  btnIniciar.Click();
end;

procedure TViewMain.TrayIconClick(Sender: TObject);
begin
  Self.Show();
  TrayIcon.Visible := False;
end;

end.
