unit api.view.pdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TPdvView = class(TForm)
    ImagemFundo: TImage;
    EdCod: TMaskEdit;
    lblVezes: TLabel;
    EdQtd: TMaskEdit;
    LabTr: TStaticText;
    LabSubTotal: TLabel;
    PanTitulo: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PdvView: TPdvView;

implementation

{$R *.dfm}

procedure TPdvView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Escape:
      Self.Close();
  end;
end;

end.
