object Database: TDatabase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 180
  Width = 260
  object Connection: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'GCOM'
    Username = 'sa'
    Server = '.'
    Left = 64
    Top = 56
    EncryptedPassword = 'BFFFB8FF8CFF90FF99FF8BFFCEFFCDFFCFFFCEFFCFFFCAFFC6FFCFFF'
  end
  object SQLServerUniProvider: TSQLServerUniProvider
    Left = 160
    Top = 88
  end
  object UniSQLMonitor: TUniSQLMonitor
    Left = 56
    Top = 112
  end
end
