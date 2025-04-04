object ViewMain: TViewMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'API Atendimento'
  ClientHeight = 108
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = 'Servi'#231'o parado'
  end
  object btnIniciar: TButton
    Left = 8
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btnIniciarClick
  end
  object btnParar: TButton
    Left = 89
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Parar'
    Enabled = False
    TabOrder = 1
    OnClick = btnPararClick
  end
  object edtPorta: TEdit
    Left = 8
    Top = 27
    Width = 156
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = '9000'
  end
  object TrayIcon: TTrayIcon
    OnClick = TrayIconClick
    Left = 120
    Top = 8
  end
end
