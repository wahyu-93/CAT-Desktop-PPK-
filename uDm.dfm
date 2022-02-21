object dm: Tdm
  OldCreateOrder = False
  Left = 507
  Top = 316
  Height = 519
  Width = 731
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=db_ca' +
      't.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB' +
      ':System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Databas' +
      'e Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking' +
      ' Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bul' +
      'k Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Cr' +
      'eate System Database=False;Jet OLEDB:Encrypt Database=False;Jet ' +
      'OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Witho' +
      'ut Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 36
    Top = 16
  end
  object qryListDetailTransaksi: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 48
    Top = 96
  end
  object qrylistTransaksi: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 112
    Top = 64
  end
  object qrySimpanJawaban: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 160
    Top = 112
  end
  object qryListSoal: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_soal')
    Left = 40
    Top = 184
  end
  object ds1: TDataSource
    DataSet = qryListSoal
    Left = 88
    Top = 256
  end
  object qry2: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT a.* FROM tbl_jawaban a, tbl_soal b where b.ID = a.soal_id')
    Left = 88
    Top = 184
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 40
    Top = 256
  end
  object qryListSoalPeserta: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.*, b.* from tbl_detail_transaksi a, tbl_soal b where b.' +
        'id=a.soal_id')
    Left = 232
    Top = 64
  end
  object dsListSoalPeserta: TDataSource
    DataSet = qryListSoalPeserta
    Left = 296
    Top = 120
  end
  object qrylistJawabanPeserta: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_jawaban')
    Left = 328
    Top = 40
  end
  object ds3: TDataSource
    DataSet = qrylistJawabanPeserta
    Left = 480
    Top = 128
  end
  object XPManifest1: TXPManifest
    Left = 88
    Top = 24
  end
  object qryPenilaian: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 552
    Top = 56
  end
  object qrySimpanTransaksi: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 576
    Top = 120
  end
  object qryLogin: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 576
    Top = 208
  end
  object dsRekapNilai: TDataSource
    DataSet = qryRekapNilai
    Left = 264
    Top = 368
  end
  object qryRekapNilai: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_transaksi')
    Left = 216
    Top = 328
  end
end
