unit uDm;

interface

uses
  SysUtils, Classes, XPMan, DB, ADODB;

type
  Tdm = class(TDataModule)
    con1: TADOConnection;
    qryListDetailTransaksi: TADOQuery;
    qrylistTransaksi: TADOQuery;
    qrySimpanJawaban: TADOQuery;
    qryListSoal: TADOQuery;
    ds1: TDataSource;
    qry2: TADOQuery;
    ds2: TDataSource;
    qryListSoalPeserta: TADOQuery;
    dsListSoalPeserta: TDataSource;
    qrylistJawabanPeserta: TADOQuery;
    ds3: TDataSource;
    XPManifest1: TXPManifest;
    qryPenilaian: TADOQuery;
    qrySimpanTransaksi: TADOQuery;
    qryLogin: TADOQuery;
    dsRekapNilai: TDataSource;
    qryRekapNilai: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
