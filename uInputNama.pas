unit uInputNama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TfinputNama = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btnSubmit: TBitBtn;
    lbl3: TLabel;
    cbb1: TComboBox;
    lbl4: TLabel;
    cbb2: TComboBox;
    img1: TImage;
    procedure FormShow(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSubmitClick(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure cbb1KeyPress(Sender: TObject; var Key: Char);
    procedure cbb2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  finputNama: TfinputNama;
  acak : Integer;

implementation

uses
  uDm, uFormNama, uLogin, Math;

{$R *.dfm}

procedure TfinputNama.FormShow(Sender: TObject);
begin
  edt1.Clear; edt2.Clear; cbb1.Text := ''; cbb2.Text := '';
  edt1.SetFocus;
end;

procedure TfinputNama.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in['0'..'9',#13,#8,#9]) then
    begin
      Key := #0;
    end;

  if Key=#13 then edt2.SetFocus;
end;

procedure TfinputNama.btnSubmitClick(Sender: TObject);
begin
  if (edt1.Text='') or (edt2.Text='') or (cbb1.Text='') or (cbb2.Text='') then
    begin
      MessageDlg('No. Pendaftaran, Nama Peserta dan Kecamatan Tidak Boleh Kosong',mtInformation,[mbok],0);
      edt1.SetFocus;
    end
  else
    begin
      with dm.qrylistTransaksi do
        begin
          close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_transaksi';
          Open;

          Append;
          FieldByName('nama').AsString      := edt2.Text;
          FieldByName('sesi').AsString      := '1';
          FieldByName('no_daftar').AsString := edt1.Text;
          FieldByName('kecamatan').AsString := cbb1.Text;
          FieldByName('sesi').AsString      := cbb2.Text;
          Post;
        end;

      edt1.Clear; edt1.SetFocus; cbb1.Text := ''; cbb2.Text := '';
      edt2.Clear;

      with DM.qryListSoal do
        begin
          close;
          sql.Clear;
          SQL.Text := 'SELECT * FROM tbl_soal order By rnd(len(soal))';
          Open;
        end;

      fTransaksiCat.Show;
      Self.Hide;
    end;
end;

procedure TfinputNama.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btnSubmit.Click;
end;

procedure TfinputNama.cbb1KeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;


procedure TfinputNama.cbb2KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

end.
