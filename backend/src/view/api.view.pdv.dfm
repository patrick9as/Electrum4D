object PdvView: TPdvView
  Left = 0
  Top = 0
  Caption = 'PdvView'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 72
    Width = 62
    Height = 13
    Caption = 'CAIXA LIVRE'
  end
  object DBGrid1: TDBGrid
    Left = 168
    Top = 112
    Width = 320
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 64
    Top = 270
    Width = 529
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
end
