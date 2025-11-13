unit Dashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Customer, Supplier, Usuario, ContasAPagar, ContasAReceber;

type
  TDashboardForm = class(TForm)
    MainMenu1: TMainMenu;
    c1: TMenuItem;
    C2: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Usuarios1: TMenuItem;
    Apagar1: TMenuItem;
    Areceber1: TMenuItem;
    Sair1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure Areceber1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DashboardForm: TDashboardForm;
implementation

{$R *.dfm}

procedure TDashboardForm.Clientes1Click(Sender: TObject);
var
  CustomerForm : TCustomerForm;
begin
  CustomerForm := TCustomerForm.Create(Application);
  try
    CustomerForm.ShowModal;
  finally
    CustomerForm.Free;
  end;
end;

procedure TDashboardForm.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TDashboardForm.Fornecedores1Click(Sender: TObject);
var
  SupplierForm : TSupplierForm;
begin
  SupplierForm := TSupplierForm.Create(Application);
  try
    SupplierForm.ShowModal;
  finally
    SupplierForm.Free;
  end;
end;

procedure TDashboardForm.Usuarios1Click(Sender: TObject);
var
  UsuarioForm : TUsuarioForm;
begin
  UsuarioForm := TUsuarioForm.Create(Application);
  try
    UsuarioForm.ShowModal;
  finally
    UsuarioForm.Free;
  end;
end;

procedure TDashboardForm.Apagar1Click(Sender: TObject);
var
  ContasAPagarForm : TContasAPagarForm;
begin
  ContasAPagarForm := TContasAPagarForm.Create(Application);
  try
    ContasAPagarForm.ShowModal;
  finally
    ContasAPagarForm.Free;
  end;
end;

procedure TDashboardForm.Areceber1Click(Sender: TObject);
var
  ContasAReceberForm : TContasAReceberForm;
begin
  ContasAReceberForm := TContasAReceberForm.Create(Application);
  try
    ContasAReceberForm.ShowModal;
  finally
    ContasAReceberForm.Free;
  end;
end;

end.
