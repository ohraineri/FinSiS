unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls;

type
  TSupplierForm = class(TForm)
    Panel: TPanel;
    CreateSupplierButton: TBitBtn;
    EditSupplierButton: TBitBtn;
    DeleteSupplierButton: TBitBtn;
    SearchLabel: TLabel;
    SearchSupplierInput: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    SuppliersDataSource: TDataSource;
    SupplierGrid: TDBGrid;
    SupplierFormGroupBox: TGroupBox;
    Label1: TLabel;
    NameInput: TDBEdit;
    Label2: TLabel;
    PhoneInput: TDBEdit;
    Label4: TLabel;
    EmailInput: TDBEdit;
    SaveSupplierFormButton: TBitBtn;
    CancelSupplierFormButton: TBitBtn;
    CountSuppliersLabel: TLabel;
    Label3: TLabel;
    CNPJInput: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure EditSupplierButtonClick(Sender: TObject);
    procedure CancelSupplierFormButtonClick(Sender: TObject);
    procedure SaveSupplierFormButtonClick(Sender: TObject);
    procedure CreateSupplierButtonClick(Sender: TObject);
    procedure DeleteSupplierButtonClick(Sender: TObject);
    procedure SearchSupplierInputChange(Sender: TObject);
    procedure RefreshCounter();
    procedure EnableHeader();
    procedure DisableHeader();
    procedure EnableFormButtons();
    procedure DisableFormButtons();
    procedure EnableSupplierGrid();
    procedure DisableSupplierGrid();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SupplierForm: TSupplierForm;

implementation

uses DataModule;
{$R *.dfm}

procedure TSupplierForm.CancelSupplierFormButtonClick(Sender: TObject);
begin
  EnableHeader;
  DisableFormButtons;
  EnableSupplierGrid;
  MainData.SupplierDataSet.Cancel;
end;

procedure TSupplierForm.CreateSupplierButtonClick(Sender: TObject);
begin
  MainData.SupplierDataSet.Insert;
  DisableHeader;
  EnableFormButtons;
  DisableSupplierGrid;
end;

procedure TSupplierForm.DeleteSupplierButtonClick(Sender: TObject);
begin
    if not MainData.SupplierDataSet.isEmpty then
    begin
     if Application.MessageBox('Voce deseja apagar este fornecedor?', 'Exclusão', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
     begin
     try
        MainData.SupplierDataSet.Delete;
        MainData.SupplierDataSet.ApplyUpdates(0);
        Application.MessageBox('Fornecedor apagado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
     Except
     Application.MessageBox('Erro em apagar o fornecedor!', 'Erro',
      MB_ICONERROR + MB_OK);
      end;
     end;
    end;
    RefreshCounter;
end;

procedure TSupplierForm.DisableSupplierGrid;
begin
    SupplierGrid.Enabled := false;
end;

procedure TSupplierForm.DisableFormButtons;
begin
    SupplierFormGroupBox.Enabled := false;
    SaveSupplierFormButton.Enabled := false;
    CancelSupplierFormButton.Enabled := false;
end;

procedure TSupplierForm.DisableHeader;
begin
    CreateSupplierButton.Enabled := false;
    EditSupplierButton.Enabled := false;
    DeleteSupplierButton.Enabled := false;
    SearchSupplierInput.Enabled := false;
end;

procedure TSupplierForm.EditSupplierButtonClick(Sender: TObject);
begin
  MainData.SupplierDataSet.Edit;
  NameInput.SetFocus;
  DisableHeader;
  EnableFormButtons;
  DisableSupplierGrid;
end;

procedure TSupplierForm.EnableSupplierGrid;
begin
  SupplierGrid.Enabled := true;
end;

procedure TSupplierForm.EnableFormButtons;
begin
    SupplierFormGroupBox.Enabled := true;
    SaveSupplierFormButton.Enabled := true;
    CancelSupplierFormButton.Enabled := true;
end;

procedure TSupplierForm.EnableHeader;
begin
    CreateSupplierButton.Enabled := true;
    EditSupplierButton.Enabled := true;
    DeleteSupplierButton.Enabled := true;
    SearchSupplierInput.Enabled := true;
    SupplierGrid.Enabled := true;
end;

procedure TSupplierForm.FormShow(Sender: TObject);
begin
    EnableHeader;
    DisableFormButtons;
    if MainData.SupplierDataSet.isEmpty then
    begin
      EditSupplierButton.Enabled := false;
      DeleteSupplierButton.Enabled := false;
    end;
    RefreshCounter;
end;

procedure TSupplierForm.RefreshCounter;
var
  TotalSuppliers : integer;
begin
TotalSuppliers := MainData.SupplierDataSet.RecordCount;
       if TotalSuppliers = 1 then
          CountSuppliersLabel.Caption := IntToStr(TotalSuppliers) + ' Registro encontrado.';
       if TotalSuppliers > 1 then
          CountSuppliersLabel.Caption := IntToStr(TotalSuppliers) + ' Registros encontrados.';
end;

procedure TSupplierForm.SaveSupplierFormButtonClick(Sender: TObject);
var
  PriorState: TDataSetState;
begin
  try
    PriorState := MainData.SupplierDataSet.State;
    MainData.SupplierDataSet.Post;
    MainData.SupplierDataSet.ApplyUpdates(0);
    MainData.SupplierDataSet.Refresh;
    case PriorState of
      dsInsert:
        Application.MessageBox('Fornecedor criado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
      dsEdit:
        Application.MessageBox('Fornecedor alterado com sucesso!', 'Cadastro',
          MB_ICONINFORMATION + MB_OK);
    end;
  Except
    Application.MessageBox('Erro em cadastrar o fornecedor!', 'Erro',
      MB_ICONERROR + MB_OK);
  end;
    EnableHeader;
    DisableFormButtons;
    RefreshCounter;
end;

procedure TSupplierForm.SearchSupplierInputChange(Sender: TObject);
begin
       SuppliersDataSource.DataSet.Filter := 'LOWER(NAME) LIKE ' + QuotedStr('%' + LowerCase(SearchSupplierInput.Text) + '%');
       SuppliersDataSource.DataSet.Filtered := true;
       RefreshCounter;
end;
end.
