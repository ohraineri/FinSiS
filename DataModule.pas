unit DataModule;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, IB_Components,
  IB_Access, IBODataset, Provider, FMTBcd, DBClient;

type
  TMainData = class(TDataModule)
    SQLConnection: TSQLConnection;
    SQLGetCustomers: TSQLTable;
    SQLGetCustomersID: TLargeintField;
    SQLGetCustomersNAME: TStringField;
    SQLGetCustomersPHONE: TStringField;
    SQLGetCustomersBIRTHDAY_DATE: TDateField;
    SQLGetCustomersEMAIL: TStringField;
    DataSetProvider1: TDataSetProvider;
    CustomerDataSet: TClientDataSet;
    CustomerDataSetID: TLargeintField;
    CustomerDataSetNAME: TStringField;
    CustomerDataSetPHONE: TStringField;
    CustomerDataSetBIRTHDAY_DATE: TDateField;
    CustomerDataSetEMAIL: TStringField;
    SQLGetSuppliers: TSQLTable;
    DataSetProvider2: TDataSetProvider;
    SupplierDataSet: TClientDataSet;
    SQLGetUsuarios: TSQLTable;
    DataSetProvider3: TDataSetProvider;
    UsuarioDataSet: TClientDataSet;
    SQLGetContasAPagar: TSQLTable;
    DataSetProvider4: TDataSetProvider;
    ContasAPagarDataSet: TClientDataSet;
    SQLGetContasAReceber: TSQLTable;
    DataSetProvider5: TDataSetProvider;
    ContasAReceberDataSet: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainData: TMainData;

implementation

{$R *.dfm}

end.
