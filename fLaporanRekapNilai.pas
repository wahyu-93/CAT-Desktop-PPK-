unit fLaporanRekapNilai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, jpeg, Buttons;

type
  TfRekapNilai = class(TForm)
    dbgrd1: TDBGrid;
    btnTutup: TBitBtn;
    img1: TImage;
    btnExcel: TBitBtn;
    procedure btnTutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRekapNilai: TfRekapNilai;
  iXls, iWb, iRange : OleVariant;
  iArrData : Variant;
  iCnt : Integer;

implementation

uses
  uDm, uFormNama, ComObj;

{$R *.dfm}

procedure TfRekapNilai.btnTutupClick(Sender: TObject);
begin
  fTransaksiCat.Show;
  Self.Close;
end;

procedure TfRekapNilai.FormShow(Sender: TObject);
begin
  with dm.qryRekapNilai do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_transaksi';
      Open;
    end;
end;

procedure TfRekapNilai.btnExcelClick(Sender: TObject);
begin
  with dm.qryRekapNilai do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_transaksi';
      Open;
    end;

  //alokasi array size
  iArrData := VarArrayCreate([1,dm.qryRekapNilai.RecordCount+2,0,dm.qryRekapNilai.FieldCount+2],varVariant);

  // Put Fieldname as header row into Array
  for iCnt := 0 to dm.qryRekapNilai.FieldCount-1 do
    begin
      iArrData[1 , iCnt] := dm.qryRekapNilai.fields[iCnt].FieldName;
    end;

  // Load SQL data into Array

  while not(dm.qryRekapNilai.eof ) do
    begin
      for iCnt := 0 to dm.qryRekapNilai.FieldCount-1 do
        begin
          iArrData[dm.qryRekapNilai.recNo+1 , iCnt] := dm.qryRekapNilai.fields[iCnt].asString;
        end;

      dm.qryRekapNilai.Next;
    end;

  // initialize an instance of Excel
  iXls := CreateOLEObject('Excel.Application');

  // create workbook
  iWb := iXls.Workbooks.Add;

  // retrieve a range where data must be placed
  iRange := iWb.WorkSheets[1].Range[iWb.WorkSheets[1].Cells[1, 1],
  iWb.WorkSheets[1].Cells[dm.qryRekapNilai.RecordCount+2, dm.qryRekapNilai.FieldCount+2 ]];

  // copy data from allocated variant array
  iRange.Value := iArrData;

  // show Excel with our data
  iXls.Visible := True;
end;

end.
