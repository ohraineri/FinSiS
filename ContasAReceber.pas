unit ContasAReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls, ComCtrls;

type
  TContasAReceberForm = class(TForm)
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
    CustomerInput: TDBEdit;
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
  ContasAReceberForm: TContasAReceberForm;

implementation

uses DataModule;
{$R *.dfm}

procedure TContasAReceberForm.CancelButtonClick(Sender: TObject);
begin
  EnableHeader;
  DisableFormButtons;
  EnableGrid;
  MainData.ContasAReceberDataSet.Cancel;
end;

procedure TContasAReceberForm.CreateButtonClick(Sender: TObject);
begin
  MainData.ContasAReceberDataSet.Insert;
  MainData.ContasAReceberDataSet.FieldByName('STATUS').AsString := 'PENDENTE';
  DisableHeader;
  EnableFormButtons;
  DisableGrid;
end;

procedure TContasAReceberForm.DeleteButtonClick(Sender: TObject);
begin
    if not MainData.ContasAReceberDataSet.isEmpty then
    begin
     if Application.MessageBox('Voce deseja apagar esta conta?', 'Exclusão', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
     begin
     try
        MainData.ContasAReceberDataSet.Delete;
        MainData.ContasAReceberDataSet.ApplyUpdates(0);
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

procedure TContasAReceberForm.DisableGrid;
begin
    Grid.Enabled := false;
end;

procedure TContasAReceberForm.DisableFormButtons;
begin
    FormGroupBox.Enabled := false;
    SaveButton.Enabled := false;
    CancelButton.Enabled := false;
end;

procedure TContasAReceberForm.DisableHeader;
begin
    CreateButton.Enabled := false;
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
    SearchInput.Enabled := false;
end;

procedure TContasAReceberForm.EditButtonClick(Sender: TObject);
begin
  MainData.ContasAReceberDataSet.Edit;
  DescriptionInput.SetFocus;
  DisableHeader;
  EnableFormButtons;
  DisableGrid;
end;

procedure TContasAReceberForm.EnableGrid;
begin
  Grid.Enabled := true;
end;

procedure TContasAReceberForm.EnableFormButtons;
begin
    FormGroupBox.Enabled := true;
    SaveButton.Enabled := true;
    CancelButton.Enabled := true;
end;

procedure TContasAReceberForm.EnableHeader;
begin
    CreateButton.Enabled := true;
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
    SearchInput.Enabled := true;
    Grid.Enabled := true;
end;

procedure TContasAReceberForm.FormShow(Sender: TObject);
begin
    EnableHeader;
    DisableFormButtons;
    if MainData.ContasAReceberDataSet.isEmpty then
    begin
      EditButton.Enabled := false;
      DeleteButton.Enabled := false;
    end;
    RefreshCounter;
end;

procedure TContasAReceberForm.RefreshCounter;
var
  Total : integer;
begin
Total := MainData.ContasAReceberDataSet.RecordCount;
       if Total = 1 then
          CountLabel.Caption := IntToStr(Total) + ' Registro encontrado.';
       if Total > 1 then
          CountLabel.Caption := IntToStr(Total) + ' Registros encontrados.';
end;

procedure TContasAReceberForm.SaveButtonClick(Sender: TObject);
var
  PriorState: TDataSetState;
begin
  try
    PriorState := MainData.ContasAReceberDataSet.State;
    MainData.ContasAReceberDataSet.Post;
    MainData.ContasAReceberDataSet.ApplyUpdates(0);
    MainData.ContasAReceberDataSet.Refresh;
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

procedure TContasAReceberForm.SearchInputChange(Sender: TObject);
begin
       DataSource1.DataSet.Filter := 'LOWER(DESCRIPTION) LIKE ' + QuotedStr('%' + LowerCase(SearchInput.Text) + '%');
       DataSource1.DataSet.Filtered := true;
       RefreshCounter;
end;
end.
