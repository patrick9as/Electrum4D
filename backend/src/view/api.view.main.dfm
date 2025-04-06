object ViewMain: TViewMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'WebServer'
  ClientHeight = 489
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CEFWindowParent1: TCEFWindowParent
    Left = 0
    Top = 97
    Width = 592
    Height = 392
    Align = alClient
    TabStop = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 97
    Align = alTop
    TabOrder = 1
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
    object Button1: TButton
      Left = 496
      Top = 3
      Width = 89
      Height = 25
      Caption = 'Abrir Zustand'
      TabOrder = 3
      OnClick = Button1Click
    end
    object cbxManterAberto: TCheckBox
      Left = 200
      Top = 62
      Width = 265
      Height = 17
      Caption = 'Manter programa aberto na bandeja do Windows'
      TabOrder = 4
    end
    object cbxBloquearDevTools: TCheckBox
      Left = 200
      Top = 39
      Width = 217
      Height = 17
      Caption = 'Bloquear ferramentas de desenvolvedor'
      TabOrder = 5
    end
  end
  object TrayIcon: TTrayIcon
    OnClick = TrayIconClick
    Left = 120
    Top = 8
  end
  object Chromium1: TChromium
    OnBeforeContextMenu = Chromium1BeforeContextMenu
    OnPreKeyEvent = Chromium1PreKeyEvent
    OnAfterCreated = Chromium1AfterCreated
    Left = 32
    Top = 224
  end
end
