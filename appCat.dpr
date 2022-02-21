program appCat;

uses
  Forms,
  uFormNama in 'uFormNama.pas' {fTransaksiCat},
  uDm in 'uDm.pas' {dm: TDataModule},
  uInputNama in 'uInputNama.pas' {finputNama},
  uLogin in 'uLogin.pas' {fLogin},
  fLaporanRekapNilai in 'fLaporanRekapNilai.pas' {fRekapNilai},
  fJuknis in 'fJuknis.pas' {fjukknis};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfjukknis, fjukknis);
  Application.CreateForm(TfinputNama, finputNama);
  Application.CreateForm(TfRekapNilai, fRekapNilai);
  Application.CreateForm(TfTransaksiCat, fTransaksiCat);
  Application.Run;
end.
