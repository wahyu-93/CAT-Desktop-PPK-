unit fJuknis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons;

type
  Tfjukknis = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    grp1: TGroupBox;
    lbl5: TLabel;
    grp2: TGroupBox;
    lbl4: TLabel;
    img1: TImage;
    btnSubmit: TBitBtn;
    procedure btnSubmitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fjukknis: Tfjukknis;

implementation

uses
  uInputNama, uDm;

{$R *.dfm}

procedure Tfjukknis.btnSubmitClick(Sender: TObject);
begin
   with DM.qryListSoal do
    begin
      close;
      sql.Clear;
      SQL.Text := 'SELECT * FROM tbl_soal order By rnd(len(soal))';
      Open;
    end;
    
  finputNama.show;
  Self.Hide;
end;

end.
