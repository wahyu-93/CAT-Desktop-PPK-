unit uFormNama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, jpeg;

type
  TfTransaksiCat = class(TForm)
    grp2: TGroupBox;
    dbtxtsoal: TDBText;
    lblNo: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    btnSimpanlanjut: TBitBtn;
    btnLewati: TBitBtn;
    btnMulai: TBitBtn;
    dbgrd1: TDBGrid;
    grp3: TGroupBox;
    dbtxtsoal1: TDBText;
    tmr1: TTimer;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    pnl15: TPanel;
    pnl16: TPanel;
    pnl17: TPanel;
    pnl18: TPanel;
    pnl19: TPanel;
    pnl20: TPanel;
    pnl21: TPanel;
    pnl22: TPanel;
    pnl23: TPanel;
    pnl24: TPanel;
    pnl25: TPanel;
    pnl26: TPanel;
    pnl27: TPanel;
    pnl28: TPanel;
    pnl29: TPanel;
    pnl30: TPanel;
    pnl31: TPanel;
    pnl32: TPanel;
    pnl33: TPanel;
    pnl34: TPanel;
    pnl35: TPanel;
    btnSubmit: TBitBtn;
    btnTutup: TBitBtn;
    grp4: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lblHasilNilai: TLabel;
    lbl13: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    btnHabis: TBitBtn;
    img1: TImage;
    lbl14: TLabel;
    lblJam: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl20: TLabel;
    procedure btnMulaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb5Click(Sender: TObject);
    procedure btnLewatiClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnSimpanlanjutClick(Sender: TObject);
    procedure klikNomorSoal(nomorSoal : Integer);
    procedure pnl1Click(Sender: TObject);
    procedure pnl2Click(Sender: TObject);
    procedure pnl3Click(Sender: TObject);
    procedure pnl4Click(Sender: TObject);
    procedure pnl5Click(Sender: TObject);
    procedure pnl6Click(Sender: TObject);
    procedure pnl7Click(Sender: TObject);
    procedure pnl8Click(Sender: TObject);
    procedure pnl9Click(Sender: TObject);
    procedure pnl10Click(Sender: TObject);
    procedure pnl11Click(Sender: TObject);
    procedure pnl12Click(Sender: TObject);
    procedure pnl13Click(Sender: TObject);
    procedure pnl14Click(Sender: TObject);
    procedure pnl15Click(Sender: TObject);
    procedure pnl16Click(Sender: TObject);
    procedure pnl17Click(Sender: TObject);
    procedure pnl18Click(Sender: TObject);
    procedure pnl19Click(Sender: TObject);
    procedure pnl20Click(Sender: TObject);
    procedure pnl21Click(Sender: TObject);
    procedure pnl22Click(Sender: TObject);
    procedure pnl23Click(Sender: TObject);
    procedure pnl24Click(Sender: TObject);
    procedure pnl25Click(Sender: TObject);
    procedure pnl26Click(Sender: TObject);
    procedure pnl27Click(Sender: TObject);
    procedure pnl28Click(Sender: TObject);
    procedure pnl29Click(Sender: TObject);
    procedure pnl30Click(Sender: TObject);
    procedure pnl31Click(Sender: TObject);
    procedure pnl32Click(Sender: TObject);
    procedure pnl33Click(Sender: TObject);
    procedure pnl34Click(Sender: TObject);
    procedure pnl35Click(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnHabisClick(Sender: TObject);
    procedure lbl14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTransaksiCat: TfTransaksiCat;
  noSoal, a, noAkhirSoal : Integer;
  idSoal, idPilA, idPilB, idPilC, idPild, idPilE, idTransaksi, idJawaban : string;
  urutSoal, waktusia : Integer;
  nilaibobot, nilaiAkhir : Real;
  acak, acak2 : integer;

implementation

uses uDm, ADODB, DB, fLaporanRekapNilai, uLogin, Math;

{$R *.dfm}              

procedure TfTransaksiCat.btnMulaiClick(Sender: TObject);
begin
  urutSoal := 1;
  waktusia:=strtoint('1800');
  tmr1.Enabled:=true;
  
  with DM.qrylistTransaksi do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_transaksi';
      Open;
      Last;
    end;

  idTransaksi := DM.qrylistTransaksi.fieldbyname('id').AsString;
  lbl5.Caption := DM.qrylistTransaksi.fieldbyname('no_daftar').AsString + ' / ' + dm.qrylistTransaksi.fieldbyname('sesi').AsString;
  lbl6.Caption := Dm.qrylistTransaksi.fieldbyname('nama').AsString;
  lbl20.Caption := Dm.qrylistTransaksi.fieldbyname('kecamatan').AsString;

  Randomize;
  acak := RandomRange(100,1000);
  with DM.qryListSoal do
    begin
      close;
      sql.Clear;
      SQL.Text := 'SELECT * FROM tbl_soal order By Rnd(-Timer() * [id])';
      Open;
    end;

  with DM.qryListDetailTransaksi do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_detail_transaksi';
      Open;
    end;

  for a:=1 to DM.qryListSoal.RecordCount do
    begin
      DM.qryListSoal.RecNo := a;

      DM.qryListDetailTransaksi.Append;
      DM.qryListDetailTransaksi.FieldByName('transaksi_id').AsString  := idTransaksi;
      DM.qryListDetailTransaksi.FieldByName('soal_id').AsString       := DM.qryListSoal.fieldbyname('id').AsString;
      DM.qryListDetailTransaksi.FieldByName('bantu_urut').AsString    := IntToStr(a);
      DM.qryListDetailTransaksi.FieldByName('status_jawab').AsString  := '0';
      DM.qryListDetailTransaksi.Post;
    end;

  with DM.qryListSoalPeserta do
    begin
      close;
      SQL.Clear;
      sql.Text := 'select a.*, b.* from tbl_detail_transaksi a, tbl_soal b where b.id=a.soal_id and transaksi_id = '+idTransaksi+' order by bantu_urut ASC';
      Open;
      First;
    end;

  noSoal := dm.qryListSoalPeserta.fieldbyname('soal_id').AsInteger;

  rb1.Caption := '';
  rb2.Caption := '';
  rb3.Caption := '';
  rb4.Caption := '';
  rb5.Caption := '';

  rb1.Checked := false;
  rb2.Checked := false;
  rb3.Checked := false;
  rb4.Checked := false;
  rb5.Checked := false;

  with DM.qrylistJawabanPeserta do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'SELECT a.* FROM tbl_jawaban a, tbl_soal b where b.ID = a.soal_id and a.soal_id = '+IntToStr(noSoal)+' order By rnd(a.id * 100)';
      Open;
    end;
  
  if DM.qrylistJawabanPeserta.RecordCount <> 0 then
    begin
      lblNo.Caption := IntToStr(urutSoal)+'. '+dm.qryListSoalPeserta.fieldbyname('soal').AsString;
      with DM.qrylistJawabanPeserta do
        begin
          RecNo:=1;
          rb1.Caption := 'A. ' + fieldbyname('jawaban').AsString;
          idPilA      := fieldbyname('id').AsString;

          RecNo:=2;
          rb2.Caption := 'B. ' + fieldbyname('jawaban').AsString;
          idPilB      := fieldbyname('id').AsString;

          RecNo:=3;
          rb3.Caption := 'C. ' + fieldbyname('jawaban').AsString;
          idPilC      := fieldbyname('id').AsString;

          RecNo:=4;
          rb4.Caption := 'D. ' + fieldbyname('jawaban').AsString;
          idPilD      := fieldbyname('id').AsString;

          RecNo:=5;
          rb5.Caption := 'E. ' + fieldbyname('jawaban').AsString;
          idPilE      := fieldbyname('id').AsString;
        end;
    end;
end;

procedure TfTransaksiCat.FormCreate(Sender: TObject);
begin
  tmr1.Enabled := false;
  idJawaban    := '';
end;

procedure TfTransaksiCat.rb1Click(Sender: TObject);
begin
  idJawaban := idPilA;
end;

procedure TfTransaksiCat.rb2Click(Sender: TObject);
begin
  idJawaban := idPilB;
end;

procedure TfTransaksiCat.rb4Click(Sender: TObject);
begin
  idJawaban := idPilD;
end;

procedure TfTransaksiCat.rb3Click(Sender: TObject);
begin
  idJawaban := idPilC;
end;

procedure TfTransaksiCat.rb5Click(Sender: TObject);
begin
  idJawaban := idPilE;
end;

procedure TfTransaksiCat.btnLewatiClick(Sender: TObject);
begin
  DM.qryListSoalPeserta.Next;
  //ShowMessage(IntToStr(urutSoal));
  urutSoal  := dm.qryListSoalPeserta.fieldbyname('bantu_urut').AsInteger;
  idJawaban := '';
  
  if dm.qryListSoalPeserta.FieldByName('jawaban_id').AsString <> '' then
    begin
      idJawaban := dm.qryListSoalPeserta.FieldByName('jawaban_id').AsString
    end;

  noSoal := dm.qryListSoalPeserta.fieldbyname('soal_id').AsInteger;
  if dm.qryListSoalPeserta.Eof then
    begin
      MessageDlg('Soal Sudah Habis',mtInformation,[mbOK],0);
      btnTutup.Visible := True;
    end
  else
    begin
      with DM.qrylistJawabanPeserta do
        begin
          close;
          SQL.Clear;
          SQL.Text := 'SELECT a.* FROM tbl_jawaban a, tbl_soal b where b.ID = a.soal_id and a.soal_id = '+IntToStr(noSoal)+' order By rnd(a.id * 100)';
          Open;
        end;

      rb1.Checked := false;
      rb2.Checked := false;
      rb3.Checked := false;
      rb4.Checked := false;
      rb5.Checked := false;

      if DM.qrylistJawabanPeserta.RecordCount <> 0 then
        begin
          lblNo.Caption := IntToStr(urutSoal)+'. '+dm.qryListSoalPeserta.fieldbyname('soal').AsString;
          with DM.qrylistJawabanPeserta do
            begin
              RecNo:=1;
              rb1.Caption := 'A. ' + fieldbyname('jawaban').AsString;
              idPilA      := fieldbyname('id').AsString;
              if idPilA = idJawaban then
                begin
                  rb1.Checked := True;
                end;

              RecNo:=2;
              rb2.Caption := 'B. ' + fieldbyname('jawaban').AsString;
              idPilB      := fieldbyname('id').AsString;
              if idPilB = idJawaban then
                begin
                 rb2.Checked := True;
                end;

              RecNo:=3;
              rb3.Caption := 'C. ' + fieldbyname('jawaban').AsString;
              idPilC      := fieldbyname('id').AsString;
              if idPilC = idJawaban then
                begin
                 rb3.Checked := True;
                end;

              RecNo:=4;
              rb4.Caption := 'D. ' + fieldbyname('jawaban').AsString;
              idPilD      := fieldbyname('id').AsString;
              if idPilD = idJawaban then
                begin
                 rb4.Checked := True;
                end;

              RecNo:=5;
              rb5.Caption := 'E. ' + fieldbyname('jawaban').AsString;
              idPilE      := fieldbyname('id').AsString;
              if idPilE = idJawaban then
                begin
                 rb5.Checked := True;
                end;
            end;
        end;

    end;
end;

procedure TfTransaksiCat.tmr1Timer(Sender: TObject);
var jam,menit,detik:word;
begin
  dec(waktusia);
  jam:=waktusia div 3600;
  menit:=waktusia div 60;
  detik:=waktusia-(jam*3600)-(menit*60);
  lblJam.Caption:=Formatdatetime('hh:nn:ss',Encodetime(jam,menit,detik,0));
  if (waktusia=0) then
  begin
    tmr1.Enabled:=false;
    MessageDlg('Waktu Habis',mtInformation,[mbOK],0);

    btnHabis.Click;
  end;
end;

procedure TfTransaksiCat.btnSimpanlanjutClick(Sender: TObject);
var tmpPanel : TPanel;
begin
  // jika belum ada jawaban munculkan pesan
  if idJawaban = '' then
    begin
      MessageDlg('Jawaban Belum Dipilih',mtWarning,[mbOK],0);
    end
  else
    begin
      //ShowMessage('transaksi '+idTransaksi+' Soal '+IntToStr(noSoal)+' jawaban '+idJawaban);
      with DM.qrySimpanJawaban do
        begin
          close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM tbl_detail_transaksi where transaksi_id='+idTransaksi+' AND soal_id = '+IntToStr(noSoal);
          Open;

          Edit;
          FieldByName('jawaban_id').AsString := idJawaban;
          FieldByName('status_jawab').AsString := '1';
          Post;
        end;

        // ubah warna panel sudah dijawab
        tmpPanel := FindComponent('pnl'+IntToStr(urutSoal)) as TPanel;
        tmpPanel.Color := clGreen;

        btnLewati.Click;
    end;
end;

procedure TfTransaksiCat.klikNomorSoal(nomorSoal: Integer);
begin
  with DM.qryListSoalPeserta do
    begin
      close;
      SQL.Clear;
      sql.Text := 'select a.*, b.* from tbl_detail_transaksi a, tbl_soal b where b.id=a.soal_id and transaksi_id = '+idTransaksi;
      Open;
      Locate('transaksi_id;bantu_urut',VarArrayOf([idTransaksi,IntToStr(nomorSoal)]),[]);
    end;

  noSoal    := dm.qryListSoalPeserta.fieldbyname('soal_id').AsInteger;
  idJawaban := DM.qryListSoalPeserta.fieldbyname('jawaban_id').AsString;
  //ShowMessage(Dm.qryListSoalPeserta.fieldbyname('jawaban_id').asstring);
  urutSoal  := DM.qryListSoalPeserta.fieldbyname('bantu_urut').AsInteger;

  rb1.Caption := '';
  rb2.Caption := '';
  rb3.Caption := '';
  rb4.Caption := '';
  rb5.Caption := '';

  rb1.Checked := false;
  rb2.Checked := false;
  rb3.Checked := false;
  rb4.Checked := false;
  rb5.Checked := false;

  with DM.qrylistJawabanPeserta do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'SELECT a.* FROM tbl_jawaban a, tbl_soal b where b.ID = a.soal_id and a.soal_id = '+IntToStr(noSoal)+' order By rnd(a.id * 100)';
      Open;
    end;
    
  if DM.qrylistJawabanPeserta.RecordCount <> 0 then
    begin
      lblNo.Caption := IntToStr(nomorSoal)+'. '+dm.qryListSoalPeserta.fieldbyname('soal').AsString;
      with DM.qrylistJawabanPeserta do
        begin
          RecNo:=1;
          rb1.Caption := 'A. ' + fieldbyname('jawaban').AsString;
          idPilA      := fieldbyname('id').AsString;
          if idPilA = idJawaban then
            begin
              rb1.Checked := True;
            end;

          RecNo:=2;
          rb2.Caption := 'B. ' + fieldbyname('jawaban').AsString;
          idPilB      := fieldbyname('id').AsString;
          if idPilB = idJawaban then
            begin
              rb2.Checked := True;
            end;

          RecNo:=3;
          rb3.Caption := 'C. ' + fieldbyname('jawaban').AsString;
          idPilC      := fieldbyname('id').AsString;
          if idPilC = idJawaban then
            begin
              rb3.Checked := True;
            end;

          RecNo:=4;
          rb4.Caption := 'D. ' + fieldbyname('jawaban').AsString;
          idPilD      := fieldbyname('id').AsString;
          if idPild = idJawaban then
            begin
              rb4.Checked := True;
            end;

          RecNo:=5;
          rb5.Caption := 'E. ' + fieldbyname('jawaban').AsString;
          idPilE      := fieldbyname('id').AsString;
          if idPilE = idJawaban then
            begin
              rb5.Checked := True;
            end;
        end;
    end;
end;

procedure TfTransaksiCat.pnl1Click(Sender: TObject);
begin
  klikNomorSoal(pnl1.Tag);
end;

procedure TfTransaksiCat.pnl2Click(Sender: TObject);
begin
  klikNomorSoal(pnl2.Tag);
end;

procedure TfTransaksiCat.pnl3Click(Sender: TObject);
begin
  klikNomorSoal(pnl3.Tag);
end;

procedure TfTransaksiCat.pnl4Click(Sender: TObject);
begin
  klikNomorSoal(pnl4.Tag);
end;

procedure TfTransaksiCat.pnl5Click(Sender: TObject);
begin
  klikNomorSoal(pnl5.Tag);
end;

procedure TfTransaksiCat.pnl6Click(Sender: TObject);
begin
  klikNomorSoal(pnl6.Tag);
end;

procedure TfTransaksiCat.pnl7Click(Sender: TObject);
begin
  klikNomorSoal(pnl7.Tag);
end;

procedure TfTransaksiCat.pnl8Click(Sender: TObject);
begin
  klikNomorSoal(pnl8.Tag);
end;

procedure TfTransaksiCat.pnl9Click(Sender: TObject);
begin
  klikNomorSoal(pnl9.Tag);
end;

procedure TfTransaksiCat.pnl10Click(Sender: TObject);
begin
  klikNomorSoal(pnl10.Tag);
end;

procedure TfTransaksiCat.pnl11Click(Sender: TObject);
begin
  klikNomorSoal(pnl11.Tag);
end;

procedure TfTransaksiCat.pnl12Click(Sender: TObject);
begin
  klikNomorSoal(pnl12.Tag);
end;

procedure TfTransaksiCat.pnl13Click(Sender: TObject);
begin
  klikNomorSoal(pnl13.Tag);
end;

procedure TfTransaksiCat.pnl14Click(Sender: TObject);
begin
  klikNomorSoal(pnl14.Tag);
end;

procedure TfTransaksiCat.pnl15Click(Sender: TObject);
begin
  klikNomorSoal(pnl15.Tag);
end;

procedure TfTransaksiCat.pnl16Click(Sender: TObject);
begin
  klikNomorSoal(pnl16.Tag);
end;

procedure TfTransaksiCat.pnl17Click(Sender: TObject);
begin
  klikNomorSoal(pnl17.Tag);
end;

procedure TfTransaksiCat.pnl18Click(Sender: TObject);
begin
  klikNomorSoal(pnl18.Tag);
end;

procedure TfTransaksiCat.pnl19Click(Sender: TObject);
begin
  klikNomorSoal(pnl19.Tag);
end;

procedure TfTransaksiCat.pnl20Click(Sender: TObject);
begin
  klikNomorSoal(pnl20.Tag);
end;

procedure TfTransaksiCat.pnl21Click(Sender: TObject);
begin
  klikNomorSoal(pnl21.Tag);
end;

procedure TfTransaksiCat.pnl22Click(Sender: TObject);
begin
  klikNomorSoal(pnl22.Tag);
end;

procedure TfTransaksiCat.pnl23Click(Sender: TObject);
begin
  klikNomorSoal(pnl23.Tag);
end;

procedure TfTransaksiCat.pnl24Click(Sender: TObject);
begin
  klikNomorSoal(pnl24.Tag);
end;

procedure TfTransaksiCat.pnl25Click(Sender: TObject);
begin
  klikNomorSoal(pnl25.Tag);
end;

procedure TfTransaksiCat.pnl26Click(Sender: TObject);
begin
  klikNomorSoal(pnl26.Tag);
end;

procedure TfTransaksiCat.pnl27Click(Sender: TObject);
begin
  klikNomorSoal(pnl27.Tag);
end;

procedure TfTransaksiCat.pnl28Click(Sender: TObject);
begin
  klikNomorSoal(pnl28.Tag);
end;

procedure TfTransaksiCat.pnl29Click(Sender: TObject);
begin
  klikNomorSoal(pnl29.Tag);
end;

procedure TfTransaksiCat.pnl30Click(Sender: TObject);
begin
  klikNomorSoal(pnl30.Tag);
end;

procedure TfTransaksiCat.pnl31Click(Sender: TObject);
begin
  klikNomorSoal(pnl31.Tag);
end;

procedure TfTransaksiCat.pnl32Click(Sender: TObject);
begin
  klikNomorSoal(pnl32.Tag);
end;

procedure TfTransaksiCat.pnl33Click(Sender: TObject);
begin
  klikNomorSoal(pnl33.Tag);
end;

procedure TfTransaksiCat.pnl34Click(Sender: TObject);
begin
  klikNomorSoal(pnl34.Tag);
end;

procedure TfTransaksiCat.pnl35Click(Sender: TObject);
begin
  klikNomorSoal(pnl35.Tag);
  btnTutup.Visible := true;
end;

procedure TfTransaksiCat.btnSubmitClick(Sender: TObject);
begin
  if MessageDlg('Yakin Akan Disubmit',mtConfirmation,[mbYes,mbNo],0)=mryes then
    begin
        with dm.qryPenilaian do
          begin
            close;
            SQL.Clear;
            SQL.Text := 'select a.*, b.* from tbl_detail_transaksi a, tbl_jawaban b where b.id = a.jawaban_id and a.transaksi_id='+idTransaksi;
            Open;
          end;

        nilaibobot := 0; nilaiAkhir := 0;
        for a:=1 to dm.qryPenilaian.RecordCount do
          begin
            dm.qryPenilaian.RecNo := a;

            nilaibobot := dm.qryPenilaian.fieldbyname('nilai').AsFloat * 2.87;
            nilaiAkhir := nilaiAkhir + nilaibobot;
          end;

        if nilaiAkhir > 100 then
          begin
            nilaiAkhir := 100;
          end
        else
          begin
            nilaiAkhir := nilaiAkhir;
          end;

        with dm.qrySimpanTransaksi do
          begin
            Close;
            sql.Clear;
            SQL.Text := 'select * from tbl_transaksi where id='+idTransaksi;
            Open;

            Edit;
            FieldByName('nilai').AsString := FloatToStr(nilaiAkhir);
            Post;
          end;

        lblHasilNilai.Caption := FloatToStr(nilaiAkhir);
        btnSimpanlanjut.Enabled := false;
        btnLewati.Enabled := False;
        grp3.Enabled := False;
        tmr1.Enabled := False;

        btnTutup.Visible := True;
        btnSubmit.Enabled := false;
    end;
end;

procedure TfTransaksiCat.FormShow(Sender: TObject);
var tmpPanel : TPanel;
begin
  btnMulai.Click;

  btnTutup.Visible := false;
  btnSubmit.Enabled := True;

  lbl7.Visible  := True; lbl10.Visible  := True; lbl11.Visible := True;
  lbl8.Visible  := True; lbl9.Visible   := True; lbl12.Visible := True;
  lbl21.Visible := True; lbl22.Visible  := True; lbl23.Visible := True;
  lbl13.Visible := True;

  lbl11.Caption := lbl5.Caption;
  lbl12.Caption := lbl6.Caption;

  lbl21.Visible := True; lbl22.Visible := True; lbl23.Visible := True;
  lbl23.Caption := lbl20.Caption;

  btnSimpanlanjut.Enabled := True;
  btnLewati.Enabled := True;
  grp3.Enabled := True;
  lblHasilNilai.Caption := '';

  for a:=1 to 35 do
    begin
      tmpPanel := FindComponent('pnl'+IntToStr(a)) as TPanel;
      tmpPanel.Color := clBtnFace;
    end;
end;

procedure TfTransaksiCat.btnTutupClick(Sender: TObject);
begin
  fLogin.Show;
  Self.Hide;
end;

procedure TfTransaksiCat.btnHabisClick(Sender: TObject);
begin
   with dm.qryPenilaian do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'select a.*, b.* from tbl_detail_transaksi a, tbl_jawaban b where b.id = a.jawaban_id and a.transaksi_id='+idTransaksi;
      Open;
    end;

    nilaibobot := 0; nilaiAkhir := 0;
    for a:=1 to dm.qryPenilaian.RecordCount do
      begin
        dm.qryPenilaian.RecNo := a;

        nilaibobot := dm.qryPenilaian.fieldbyname('nilai').AsFloat * 2.87;
        nilaiAkhir := nilaiAkhir + nilaibobot;
      end;

    with dm.qrySimpanTransaksi do
      begin
        Close;
        sql.Clear;
        SQL.Text := 'select * from tbl_transaksi where id='+idTransaksi;
        Open;

        Edit;
        FieldByName('nilai').AsString := FloatToStr(nilaiAkhir);
        Post;
      end;

    lbl7.Visible := True; lbl8.Visible := True; lbl9.Visible := True;
    lbl10.Visible := True; lbl11.Visible := True; lbl12.Visible := True; lbl13.Visible := True;

    lbl11.Caption := lbl5.Caption;
    lbl12.Caption := lbl6.Caption;

    lbl21.Visible := True; lbl22.Visible := True; lbl23.Visible := True;
    lbl23.Caption := lbl20.Caption;

    if nilaiAkhir > 100 then
      begin
        nilaiAkhir := 100;
      end
    else
      begin
        nilaiAkhir := nilaiAkhir;
      end;

    lblHasilNilai.Caption := FloatToStr(nilaiAkhir);
    btnSimpanlanjut.Enabled := false;
    btnLewati.Enabled := False;
    grp3.Enabled := False;

    btnTutup.Visible := True;
end;

procedure TfTransaksiCat.lbl14Click(Sender: TObject);
begin
  fRekapNilai.Show;
end;

end.
