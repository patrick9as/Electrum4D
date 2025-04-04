object PerguntasRepository: TPerguntasRepository
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Table: TUniTable
    TableName = 'NPS_Perguntas'
    Connection = Database.Connection
    Left = 72
    Top = 48
    object TableID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object TableDescricao: TStringField
      FieldName = 'Descricao'
      Size = 150
    end
    object TableCreated_At: TDateTimeField
      FieldName = 'Created_At'
    end
  end
  object QrySQL: TUniQuery
    Connection = Database.Connection
    Left = 128
    Top = 80
  end
end
