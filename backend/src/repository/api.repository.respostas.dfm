object RespostasRepository: TRespostasRepository
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Table: TUniTable
    TableName = 'NPS_Respostas'
    Connection = Database.Connection
    Left = 64
    Top = 48
    object TableID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object TableID_Pergunta: TIntegerField
      FieldName = 'ID_Pergunta'
    end
    object TableValor: TIntegerField
      FieldName = 'Valor'
    end
    object TableCreated_At: TDateTimeField
      FieldName = 'Created_At'
    end
  end
  object qrySQL: TUniQuery
    Connection = Database.Connection
    Left = 120
    Top = 72
  end
end
