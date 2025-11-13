object UsuarioForm: TUsuarioForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Usuarios'
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
  object CreateUsuarioButton: TBitBtn
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Novo'
    TabOrder = 1
    OnClick = CreateUsuarioButtonClick
  end
  object EditUsuarioButton: TBitBtn
    Left = 176
    Top = 10
    Width = 129
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = EditUsuarioButtonClick
  end
  object DeleteUsuarioButton: TBitBtn
    Left = 328
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Apagar'
    TabOrder = 3
    OnClick = DeleteUsuarioButtonClick
  end
  object SearchUsuarioInput: TEdit
    Left = 515
    Top = 11
    Width = 182
    Height = 21
    TabOrder = 4
    OnChange = SearchUsuarioInputChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 778
    Height = 204
    Align = alBottom
    TabOrder = 5
    object CountUsuariosLabel: TLabel
      Left = 5
      Top = 0
      Width = 121
      Height = 13
      Caption = '0 Registros encontrados.'
    end
    object UsuarioGrid: TDBGrid
      Left = 1
      Top = 16
      Width = 776
      Height = 187
      Align = alBottom
      DataSource = UsuariosDataSource
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
          FieldName = 'USERNAME'
          Title.Caption = 'Usuario'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'E-mail'
          Width = 200
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
    object UsuarioFormGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 776
      Height = 215
      Align = alClient
      Caption = 'Dados do usuario'
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
        Top = 62
        Width = 36
        Height = 13
        Caption = 'Usuario'
        FocusControl = UsernameInput
      end
      object Label4: TLabel
        Left = 7
        Top = 108
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = EmailInput
      end
      object Label3: TLabel
        Left = 199
        Top = 62
        Width = 31
        Height = 13
        Caption = 'Senha'
        FocusControl = PasswordInput
      end
      object NameInput: TDBEdit
        Left = 7
        Top = 35
        Width = 500
        Height = 21
        DataField = 'NAME'
        DataSource = UsuariosDataSource
        TabOrder = 0
      end
      object UsernameInput: TDBEdit
        Left = 7
        Top = 81
        Width = 160
        Height = 21
        DataField = 'USERNAME'
        DataSource = UsuariosDataSource
        TabOrder = 1
      end
      object EmailInput: TDBEdit
        Left = 7
        Top = 127
        Width = 308
        Height = 21
        DataField = 'EMAIL'
        DataSource = UsuariosDataSource
        TabOrder = 2
      end
      object PasswordInput: TDBEdit
        Left = 199
        Top = 81
        Width = 160
        Height = 21
        DataField = 'PASSWORD'
        DataSource = UsuariosDataSource
        PasswordChar = '*'
        TabOrder = 3
      end
    end
    object SaveUsuarioFormButton: TBitBtn
      Left = 8
      Top = 175
      Width = 166
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = SaveUsuarioFormButtonClick
    end
    object CancelUsuarioFormButton: TBitBtn
      Left = 192
      Top = 175
      Width = 153
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = CancelUsuarioFormButtonClick
    end
  end
  object UsuariosDataSource: TDataSource
    DataSet = MainData.UsuarioDataSet
    Left = 720
    Top = 280
  end
end
