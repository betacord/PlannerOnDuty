unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if edit1.Text<>'' then
  begin
    if form1.StringGrid1.Enabled=false then
    begin
      form1.stringgrid1.enabled:=true;
      form1.StringGrid1.RowCount:=1;
      form1.StringGrid1.colCount:=1;
      form1.trackbar1.enabled:=true;
    end;
    form1.StringGrid1.RowCount:=form1.StringGrid1.RowCount+1;
    form1.StringGrid1.Cells[0,form1.StringGrid1.rowCount-1]:=edit1.Text;
    if (form1.StringGrid1.ColCount>1) and (form1.StringGrid1.rowCount>1) then
    begin
      form1.StringGrid1.FixedCols:=1;
      form1.StringGrid1.FixedRows:=1;
    end;
    edit1.Clear;
  end
  else showmessage('Uzupe³nij pole z nazwiskiem i imieniem nauczyciela');
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then bitbtn1.Click;
  if key=#27 then close;
end;

end.
