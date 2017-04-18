unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ilstron : byte;
  end;

var
  Form5: TForm5;
  aktstr : byte=1;

implementation

{$R *.dfm}

uses unit1;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  dec(aktstr);
  image1.Picture.Bitmap.Assign(form1.bmp[aktstr]);
  label1.Caption:='Strona '+inttostr(aktstr)+' z '+inttostr(ilstron);
  if aktstr=ilstron then bitbtn2.Enabled:=false
  else bitbtn2.Enabled:=true;
  if aktstr=1 then bitbtn1.Enabled:=false
  else bitbtn1.Enabled:=true;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  inc(aktstr);
  image1.Picture.Bitmap.Assign(form1.bmp[aktstr]);
  label1.Caption:='Strona '+inttostr(aktstr)+' z '+inttostr(ilstron);
  if aktstr=1 then bitbtn1.Enabled:=false
  else bitbtn1.Enabled:=true;
  if aktstr=ilstron then bitbtn2.Enabled:=false
  else bitbtn2.Enabled:=true;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  label1.Caption:='Strona '+inttostr(aktstr)+' z '+inttostr(ilstron);
  image1.Picture.Bitmap.Assign(form1.bmp[aktstr]);
end;

end.
