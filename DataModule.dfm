object MainData: TMainData
  OldCreateOrder = False
  Height = 382
  Width = 642
  object SQLConnection: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=C:\Users\Administrador\Documents\MProject\Database\DBS.' +
        'FDB')
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 56
    Top = 24
  end
  object SQLGetCustomers: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'CUSTOMERS'
    Left = 144
    Top = 24
    object SQLGetCustomersID: TLargeintField
      FieldName = 'ID'
    end
    object SQLGetCustomersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object SQLGetCustomersPHONE: TStringField
      FieldName = 'PHONE'
      Size = 12
    end
    object SQLGetCustomersBIRTHDAY_DATE: TDateField
      FieldName = 'BIRTHDAY_DATE'
    end
    object SQLGetCustomersEMAIL: TStringField
      FieldName = 'EMAIL'
      Required = True
      Size = 254
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLGetCustomers
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 24
  end
  object CustomerDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 320
    Top = 24
    object CustomerDataSetID: TLargeintField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CustomerDataSetNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object CustomerDataSetPHONE: TStringField
      FieldName = 'PHONE'
      Size = 12
    end
    object CustomerDataSetBIRTHDAY_DATE: TDateField
      FieldName = 'BIRTHDAY_DATE'
    end
    object CustomerDataSetEMAIL: TStringField
      FieldName = 'EMAIL'
      Required = True
      Size = 254
    end
  end
  object SQLGetSuppliers: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'SUPPLIERS'
    Left = 144
    Top = 96
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLGetSuppliers
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 96
  end
  object SupplierDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 320
    Top = 96
  end
  object SQLGetUsuarios: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'USUARIOS'
    Left = 144
    Top = 168
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = SQLGetUsuarios
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 168
  end
  object UsuarioDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider3'
    Left = 320
    Top = 168
  end
  object SQLGetContasAPagar: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'CONTAS_A_PAGAR'
    Left = 144
    Top = 240
  end
  object DataSetProvider4: TDataSetProvider
    DataSet = SQLGetContasAPagar
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 240
  end
  object ContasAPagarDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider4'
    Left = 320
    Top = 240
  end
  object SQLGetContasAReceber: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'CONTAS_A_RECEBER'
    Left = 144
    Top = 312
  end
  object DataSetProvider5: TDataSetProvider
    DataSet = SQLGetContasAReceber
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 312
  end
  object ContasAReceberDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider5'
    Left = 320
    Top = 312
  end
end
