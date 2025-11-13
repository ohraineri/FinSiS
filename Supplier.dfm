object SupplierForm: TSupplierForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Fornecedores'
  ClientHeight = 462
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SearchLabel: TLabel
    Left = 463
    Top = 13
    Width = 46
    Height = 13
    Caption = 'Pesquisar'
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object CreateSupplierButton: TBitBtn
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Novo'
    TabOrder = 1
    OnClick = CreateSupplierButtonClick
  end
  object EditSupplierButton: TBitBtn
    Left = 176
    Top = 10
    Width = 129
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = EditSupplierButtonClick
  end
  object DeleteSupplierButton: TBitBtn
    Left = 328
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Apagar'
    TabOrder = 3
    OnClick = DeleteSupplierButtonClick
  end
  object SearchSupplierInput: TEdit
    Left = 515
    Top = 11
    Width = 182
    Height = 21
    TabOrder = 4
    OnChange = SearchSupplierInputChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 778
    Height = 204
    Align = alBottom
    TabOrder = 5
    object CountSuppliersLabel: TLabel
      Left = 5
      Top = 0
      Width = 121
      Height = 13
      Caption = '0 Registros encontrados.'
    end
    object SupplierGrid: TDBGrid
      Left = 1
      Top = 16
      Width = 776
      Height = 187
      Align = alBottom
      DataSource = SuppliersDataSource
      Options = [dgTitles, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Title.Caption = 'CNPJ'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'E-mail'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE'
          Title.Caption = 'Telefone'
          Width = 120
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 778
    Height = 217
    Align = alClient
    TabOrder = 6
    object SupplierFormGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 776
      Height = 215
      Align = alClient
      Caption = 'Dados do fornecedor'
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 16
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = NameInput
      end
      object Label2: TLabel
        Left = 7
        Top = 108
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = PhoneInput
      end
      object Label4: TLabel
        Left = 199
        Top = 108
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = EmailInput
      end
      object Label3: TLabel
        Left = 7
        Top = 62
        Width = 27
        Height = 13
        Caption = 'CNPJ'
        FocusControl = CNPJInput
      end
      object NameInput: TDBEdit
        Left = 7
        Top = 35
        Width = 500
        Height = 21
        DataField = 'NAME'
        DataSource = SuppliersDataSource
        TabOrder = 0
      end
      object PhoneInput: TDBEdit
        Left = 7
        Top = 127
        Width = 160
        Height = 21
        DataField = 'PHONE'
        DataSource = SuppliersDataSource
        TabOrder = 1
      end
      object EmailInput: TDBEdit
        Left = 199
        Top = 127
        Width = 308
        Height = 21
        DataField = 'EMAIL'
        DataSource = SuppliersDataSource
        TabOrder = 2
      end
      object CNPJInput: TDBEdit
        Left = 7
        Top = 81
        Width = 160
        Height = 21
        DataField = 'CNPJ'
        DataSource = SuppliersDataSource
        TabOrder = 3
      end
    end
    object SaveSupplierFormButton: TBitBtn
      Left = 8
      Top = 175
      Width = 166
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = SaveSupplierFormButtonClick
    end
    object CancelSupplierFormButton: TBitBtn
      Left = 192
      Top = 175
      Width = 153
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = CancelSupplierFormButtonClick
    end
  end
  object SuppliersDataSource: TDataSource
    DataSet = MainData.SupplierDataSet
    Left = 720
    Top = 280
  end
end
