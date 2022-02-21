unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TfLogin = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    btnSubmit: TBitBtn;
    img1: TImage;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure btnSubmitClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses
  uDm, uInputNama, fJuknis;

{$R *.dfm}

procedure TfLogin.FormShow(Sender: TObject);
begin
  edt1.Clear; edt1.SetFocus;
  edt2.Clear;
end;

procedure TfLogin.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then edt2.SetFocus;
end;

procedure TfLogin.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btnSubmit.Click;
end;

procedure TfLogin.btnSubmitClick(Sender: TObject);
begin
  with dm.qryLogin do
    begin
      Close;
      sql.Clear;
      sql.Text := 'select * from tbl_login where user='+QuotedStr(edt1.Text)+' and pass='+QuotedStr(edt2.Text)+'';
      Open;
    end;

  if dm.qryLogin.IsEmpty then
    begin
      MessageDlg('Login Gagal',mtError,[mbok],0);
    end
  else
    begin
      fjukknis.Show;
      Self.Hide;
    end;
end;

procedure TfLogin.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
