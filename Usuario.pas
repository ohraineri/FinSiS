unit Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls;

type
  TUsuarioForm = class(TForm)
    Panel: TPanel;
    CreateUsuarioButton: TBitBtn;
    EditUsuarioButton: TBitBtn;
    DeleteUsuarioButton: TBitBtn;
    SearchLabel: TLabel;
    SearchUsuarioInput: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    UsuariosDataSource: TDataSource;
    UsuarioGrid: TDBGrid;
    UsuarioFormGroupBox: TGroupBox;
    Label1: TLabel;
    NameInput: TDBEdit;
    Label2: TLabel;
    UsernameInput: TDBEdit;
    Label4: TLabel;
    EmailInput: TDBEdit;
    SaveUsuarioFormButton: TBitBtn;
    CancelUsuarioFormButton: TBitBtn;
    CountUsuariosLabel: TLabel;
    Label3: TLabel;
    PasswordInput: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure EditUsuarioButtonClick(Sender: TObject);
    procedure CancelUsuarioFormButtonClick(Sender: TObject);
    procedure SaveUsuarioFormButtonClick(Sender: TObject);
    procedure CreateUsuarioButtonClick(Sender: TObject);
    procedure DeleteUsuarioButtonClick(Sender: TObject);
    procedure SearchUsuarioInputChange(Sender: TObject);
    procedure RefreshCounter();
    procedure EnableHeader();
    procedure DisableHeader();
    procedure EnableFormButtons();
    procedure DisableFormButtons();
    procedure EnableUsuarioGrid();
    procedure DisableUsuarioGrid();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsuarioForm: TUsuarioForm;

implementation

uses DataModule;
{$R *.dfm}

procedure TUsuarioForm.CancelUsuarioFormButtonClick(Sender: TObject);
begin
  EnableHeader;
  DisableFormButtons;
  EnableUsuarioGrid;
  MainData.UsuarioDataSet.Cancel;
end;

procedure TUsuarioForm.CreateUsuarioButtonClick(Sender: TObject);
begin
  MainData.UsuarioDataSet.Insert;
  DisableHeader;
  EnableFormButtons;
  DisableUsuarioGrid;
end;

procedure TUsuarioForm.DeleteUsuarioButtonClick(Sender: TObject);
begin
    if not MainData.UsuarioDataSet.isEmpty then
    begin
     if Application.MessageBox('Voce deseja apagar este usuario?', 'Exclusão', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
     begin
     try
        MainData.UsuarioDataSet.Delete;
        MainData.UsuarioDataSet.ApplyUpdates(0);
        Application.MessageBox('Usuario apagado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
     Except
     Application.MessageBox('Erro em apagar o usuario!', 'Erro',
      MB_ICONERROR + MB_OK);
      end;
     end;
    end;
    RefreshCounter;
end;

procedure TUsuarioForm.DisableUsuarioGrid;
begin
    UsuarioGrid.Enabled := false;
end;

procedure TUsuarioForm.DisableFormButtons;
begin
    UsuarioFormGroupBox.Enabled := false;
    SaveUsuarioFormButton.Enabled := false;
    CancelUsuarioFormButton.Enabled := false;
end;

procedure TUsuarioForm.DisableHeader;
begin
    CreateUsuarioButton.Enabled := false;
    EditUsuarioButton.Enabled := false;
    DeleteUsuarioButton.Enabled := false;
    SearchUsuarioInput.Enabled := false;
end;

procedure TUsuarioForm.EditUsuarioButtonClick(Sender: TObject);
begin
  MainData.UsuarioDataSet.Edit;
  NameInput.SetFocus;
  DisableHeader;
  EnableFormButtons;
  DisableUsuarioGrid;
end;

procedure TUsuarioForm.EnableUsuarioGrid;
begin
  UsuarioGrid.Enabled := true;
end;

procedure TUsuarioForm.EnableFormButtons;
begin
    UsuarioFormGroupBox.Enabled := true;
    SaveUsuarioFormButton.Enabled := true;
    CancelUsuarioFormButton.Enabled := true;
end;

procedure TUsuarioForm.EnableHeader;
begin
    CreateUsuarioButton.Enabled := true;
    EditUsuarioButton.Enabled := true;
    DeleteUsuarioButton.Enabled := true;
    SearchUsuarioInput.Enabled := true;
    UsuarioGrid.Enabled := true;
end;

procedure TUsuarioForm.FormShow(Sender: TObject);
begin
    EnableHeader;
    DisableFormButtons;
    if MainData.UsuarioDataSet.isEmpty then
    begin
      EditUsuarioButton.Enabled := false;
      DeleteUsuarioButton.Enabled := false;
    end;
    RefreshCounter;
end;

procedure TUsuarioForm.RefreshCounter;
var
  TotalUsuarios : integer;
begin
TotalUsuarios := MainData.UsuarioDataSet.RecordCount;
       if TotalUsuarios = 1 then
          CountUsuariosLabel.Caption := IntToStr(TotalUsuarios) + ' Registro encontrado.';
       if TotalUsuarios > 1 then
          CountUsuariosLabel.Caption := IntToStr(TotalUsuarios) + ' Registros encontrados.';
end;

procedure TUsuarioForm.SaveUsuarioFormButtonClick(Sender: TObject);
var
  PriorState: TDataSetState;
begin
  try
    PriorState := MainData.UsuarioDataSet.State;
    MainData.UsuarioDataSet.Post;
    MainData.UsuarioDataSet.ApplyUpdates(0);
    MainData.UsuarioDataSet.Refresh;
    case PriorState of
      dsInsert:
        Application.MessageBox('Usuario criado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
      dsEdit:
        Application.MessageBox('Usuario alterado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
    end;
  Except
    Application.MessageBox('Erro em cadastrar o usuario!', 'Erro',
      MB_ICONERROR + MB_OK);
  end;
    EnableHeader;
    DisableFormButtons;
    RefreshCounter;
end;

procedure TUsuarioForm.SearchUsuarioInputChange(Sender: TObject);
begin
       UsuariosDataSource.DataSet.Filter := 'LOWER(NAME) LIKE ' + QuotedStr('%' + LowerCase(SearchUsuarioInput.Text) + '%');
       UsuariosDataSource.DataSet.Filtered := true;
       RefreshCounter;
end;
end.
