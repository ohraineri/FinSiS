program SCF;

uses
  Forms,
  Dashboard in 'Dashboard.pas' {DashboardForm},
  Customer in 'Customer.pas' {CustomerForm},
  DataModule in 'DataModule.pas' {MainData: TDataModule},
  Supplier in 'Supplier.pas' {SupplierForm},
  Usuario in 'Usuario.pas' {UsuarioForm},
  ContasAPagar in 'ContasAPagar.pas' {ContasAPagarForm},
  ContasAReceber in 'ContasAReceber.pas' {ContasAReceberForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDashboardForm, DashboardForm);
  Application.CreateForm(TMainData, MainData);
  Application.Run;
end.
