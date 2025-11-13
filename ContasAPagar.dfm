object ContasAPagarForm: TContasAPagarForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar'
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
  object CreateButton: TBitBtn
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Novo'
    TabOrder = 1
    OnClick = CreateButtonClick
  end
  object EditButton: TBitBtn
    Left = 176
    Top = 10
    Width = 129
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = EditButtonClick
  end
  object DeleteButton: TBitBtn
    Left = 328
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Apagar'
    TabOrder = 3
    OnClick = DeleteButtonClick
  end
  object SearchInput: TEdit
    Left = 515
    Top = 11
    Width = 182
    Height = 21
    TabOrder = 4
    OnChange = SearchInputChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 778
    Height = 204
    Align = alBottom
    TabOrder = 5
    object CountLabel: TLabel
      Left = 5
      Top = 0
      Width = 121
      Height = 13
      Caption = '0 Registros encontrados.'
    end
    object Grid: TDBGrid
      Left = 1
      Top = 16
      Width = 776
      Height = 187
      Align = alBottom
      DataSource = DataSource1
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
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Descricao'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALUE'
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DUE_DATE'
          Title.Caption = 'Vencimento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPPLIER'
          Title.Caption = 'Fornecedor'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 80
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
    object FormGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 776
      Height = 215
      Align = alClient
      Caption = 'Dados da conta a pagar'
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Descricao'
        FocusControl = DescriptionInput
      end
      object Label2: TLabel
        Left = 7
        Top = 62
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = ValueInput
      end
      object Label3: TLabel
        Left = 199
        Top = 62
        Width = 56
        Height = 13
        Caption = 'Vencimento'
        FocusControl = DueDateInput
      end
      object Label4: TLabel
        Left = 7
        Top = 108
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
        FocusControl = SupplierInput
      end
      object Label5: TLabel
        Left = 199
        Top = 108
        Width = 31
        Height = 13
        Caption = 'Status'
        FocusControl = StatusInput
      end
      object DescriptionInput: TDBEdit
        Left = 7
        Top = 35
        Width = 500
        Height = 21
        DataField = 'DESCRIPTION'
        DataSource = DataSource1
        TabOrder = 0
      end
      object ValueInput: TDBEdit
        Left = 7
        Top = 81
        Width = 160
        Height = 21
        DataField = 'VALUE'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DueDateInput: TDBEdit
        Left = 199
        Top = 81
        Width = 160
        Height = 21
        DataField = 'DUE_DATE'
        DataSource = DataSource1
        TabOrder = 2
      end
      object SupplierInput: TDBEdit
        Left = 7
        Top = 127
        Width = 160
        Height = 21
        DataField = 'SUPPLIER'
        DataSource = DataSource1
        TabOrder = 3
      end
      object StatusInput: TDBEdit
        Left = 199
        Top = 127
        Width = 160
        Height = 21
        DataField = 'STATUS'
        DataSource = DataSource1
        TabOrder = 4
      end
    end
    object SaveButton: TBitBtn
      Left = 8
      Top = 175
      Width = 166
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = SaveButtonClick
    end
    object CancelButton: TBitBtn
      Left = 192
      Top = 175
      Width = 153
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = CancelButtonClick
    end
  end
  object DataSource1: TDataSource
    DataSet = MainData.ContasAPagarDataSet
    Left = 720
    Top = 280
  end
end
