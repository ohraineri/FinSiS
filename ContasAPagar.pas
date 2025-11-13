unit ContasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls, ComCtrls;

type
  TContasAPagarForm = class(TForm)
    Panel: TPanel;
    CreateButton: TBitBtn;
    EditButton: TBitBtn;
    DeleteButton: TBitBtn;
    SearchLabel: TLabel;
    SearchInput: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Grid: TDBGrid;
    FormGroupBox: TGroupBox;
    Label1: TLabel;
    DescriptionInput: TDBEdit;
    Label2: TLabel;
    ValueInput: TDBEdit;
    SaveButton: TBitBtn;
    CancelButton: TBitBtn;
    CountLabel: TLabel;
    Label3: TLabel;
    DueDateInput: TDBEdit;
    Label4: TLabel;
    SupplierInput: TDBEdit;
    Label5: TLabel;
    StatusInput: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SearchInputChange(Sender: TObject);
    procedure RefreshCounter();
    procedure EnableHeader();
    procedure DisableHeader();
    procedure EnableFormButtons();
    procedure DisableFormButtons();
    procedure EnableGrid();
    procedure DisableGrid();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContasAPagarForm: TContasAPagarForm;

implementation

uses DataModule;
{$R *.dfm}

procedure TContasAPagarForm.CancelButtonClick(Sender: TObject);
begin
  EnableHeader;
  DisableFormButtons;
  EnableGrid;
  MainData.ContasAPagarDataSet.Cancel;
end;

procedure TContasAPagarForm.CreateButtonClick(Sender: TObject);
begin
  MainData.ContasAPagarDataSet.Insert;
  MainData.ContasAPagarDataSet.FieldByName('STATUS').AsString := 'PENDENTE';
  DisableHeader;
  EnableFormButtons;
  DisableGrid;
end;

procedure TContasAPagarForm.DeleteButtonClick(Sender: TObject);
begin
    if not MainData.ContasAPagarDataSet.isEmpty then
    begin
     if Application.MessageBox('Voce deseja apagar esta conta?', 'Exclusão', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
     begin
     try
        MainData.ContasAPagarDataSet.Delete;
        MainData.ContasAPagarDataSet.ApplyUpdates(0);
        Application.MessageBox('Conta apagada com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
     Except
     Application.MessageBox('Erro em apagar a conta!', 'Erro',
      MB_ICONERROR + MB_OK);
      end;
     end;
    end;
    RefreshCounter;
end;

procedure TContasAPagarForm.DisableGrid;
begin
    Grid.Enabled := false;
end;

procedure TContasAPagarForm.DisableFormButtons;
begin
    FormGroupBox.Enabled := false;
    SaveButton.Enabled := false;
    CancelButton.Enabled := false;
end;

procedure TContasAPagarForm.DisableHeader;
begin
    CreateButton.Enabled := false;
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
    SearchInput.Enabled := false;
end;

procedure TContasAPagarForm.EditButtonClick(Sender: TObject);
begin
  MainData.ContasAPagarDataSet.Edit;
  DescriptionInput.SetFocus;
  DisableHeader;
  EnableFormButtons;
  DisableGrid;
end;

procedure TContasAPagarForm.EnableGrid;
begin
  Grid.Enabled := true;
end;

procedure TContasAPagarForm.EnableFormButtons;
begin
    FormGroupBox.Enabled := true;
    SaveButton.Enabled := true;
    CancelButton.Enabled := true;
end;

procedure TContasAPagarForm.EnableHeader;
begin
    CreateButton.Enabled := true;
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
    SearchInput.Enabled := true;
    Grid.Enabled := true;
end;

procedure TContasAPagarForm.FormShow(Sender: TObject);
begin
    EnableHeader;
    DisableFormButtons;
    if MainData.ContasAPagarDataSet.isEmpty then
    begin
      EditButton.Enabled := false;
      DeleteButton.Enabled := false;
    end;
    RefreshCounter;
end;

procedure TContasAPagarForm.RefreshCounter;
var
  Total : integer;
begin
Total := MainData.ContasAPagarDataSet.RecordCount;
       if Total = 1 then
          CountLabel.Caption := IntToStr(Total) + ' Registro encontrado.';
       if Total > 1 then
          CountLabel.Caption := IntToStr(Total) + ' Registros encontrados.';
end;

procedure TContasAPagarForm.SaveButtonClick(Sender: TObject);
var
  PriorState: TDataSetState;
begin
  try
    PriorState := MainData.ContasAPagarDataSet.State;
    MainData.ContasAPagarDataSet.Post;
    MainData.ContasAPagarDataSet.ApplyUpdates(0);
    MainData.ContasAPagarDataSet.Refresh;
    case PriorState of
      dsInsert:
        Application.MessageBox('Conta criada com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
      dsEdit:
        Application.MessageBox('Conta alterada com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
    end;
  Except
    Application.MessageBox('Erro em cadastrar a conta!', 'Erro',
      MB_ICONERROR + MB_OK);
  end;
    EnableHeader;
    DisableFormButtons;
    RefreshCounter;
end;

procedure TContasAPagarForm.SearchInputChange(Sender: TObject);
begin
       DataSource1.DataSet.Filter := 'LOWER(DESCRIPTION) LIKE ' + QuotedStr('%' + LowerCase(SearchInput.Text) + '%');
       DataSource1.DataSet.Filtered := true;
       RefreshCounter;
end;
end.
