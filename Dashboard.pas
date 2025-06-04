unit Dashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Customer;

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
  CustomerForm.Show;
  CustomerForm.FreeOnRelease;
end;

procedure TDashboardForm.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

end.
