unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs,
  Vcl.Buttons;

type
  TForm4 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    OpenTextFileDialog1: TOpenTextFileDialog;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure access(o, l : byte);
    procedure excel(o, l : byte);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1;

procedure tform4.access(o, l : byte);
var
  p : textfile;
  s : string;
  i : integer;
  z : array[1..2] of integer;
  nazw : shortstring;
  lista : tstringlist;
  li : byte;
begin
  lista:=tstringlist.Create;
  assignfile(p,edit1.text);
  reset(p);
  while not eof(p) do
  begin
    li:=1;
    nazw:='';
    readln(p,s);
    for I := 1 to length(s) do if s[i]=edit3.text then
    begin
      z[li]:=i;
      inc(li);
    end;
    for I := z[1]+1 to z[2]-1 do nazw:=nazw+s[i];
    lista.Add(nazw);
  end;
  if form1.stringgrid1.Enabled=false then
  begin
    form1.StringGrid1.Enabled:=true;
    form1.trackbar1.enabled:=true;
    form1.StringGrid1.RowCount:=1;
    form1.StringGrid1.ColCount:=1;
  end;
  if l=0 then
  begin
    if o=0 then
    begin
      form1.StringGrid1.RowCount:=1;
    end;
    for I := 0 to lista.Count-1 do
    begin
      form1.StringGrid1.rowCount:=form1.StringGrid1.rowCount+1;
      form1.StringGrid1.Cells[0,form1.StringGrid1.rowCount-1]:=lista[i];
    end;
  end;
  if l=1 then
  begin
    if o=0 then
    begin
      form1.StringGrid1.ColCount:=1;
    end;
    for I := 0 to lista.Count-1 do
    begin
      form1.StringGrid1.colCount:=form1.StringGrid1.colCount+1;
      form1.StringGrid1.Cells[form1.StringGrid1.colCount-1,0]:=lista[i];
    end;
  end;
  if (form1.StringGrid1.ColCount>1) and (form1.StringGrid1.rowCount>1) then
  begin
    form1.StringGrid1.FixedCols:=1;
    form1.StringGrid1.FixedRows:=1;
  end;
  closefile(p);
  lista.Free;
end;

procedure tform4.excel(o: Byte; l: Byte);
var
  p : textfile;
  lista : tstringlist;
  s : string;
  i : integer;
  z : byte;
  nazw : shortstring;
begin
  lista:=tstringlist.Create;
  assignfile(p,edit1.text);
  reset(p);
  while not eof(p) do
  begin
    nazw:='';
    readln(p,s);
    for I := 1 to length(s) do if s[i]=#9 then z:=i;
    for I := z+1 to length(s) do nazw:=nazw+s[i];
    lista.Add(nazw);
  end;
  if form1.stringgrid1.Enabled=false then
  begin
    form1.StringGrid1.Enabled:=true;
    form1.StringGrid1.RowCount:=1;
    form1.StringGrid1.ColCount:=1;
    form1.trackbar1.enabled:=true;
  end;
  if l=0 then
  begin
    if o=0 then
    begin
      form1.StringGrid1.RowCount:=1;
    end;
    for I := 0 to lista.Count-1 do
    begin
      form1.StringGrid1.rowCount:=form1.StringGrid1.rowCount+1;
      form1.StringGrid1.Cells[0,form1.StringGrid1.rowCount-1]:=lista[i];
    end;
  end;
  if l=1 then
  begin
    if o=0 then
    begin
      form1.StringGrid1.ColCount:=1;
    end;
    for I := 0 to lista.Count-1 do
    begin
      form1.StringGrid1.colCount:=form1.StringGrid1.colCount+1;
      form1.StringGrid1.Cells[form1.StringGrid1.colCount-1,0]:=lista[i];
    end;
  end;
  if (form1.StringGrid1.ColCount>1) and (form1.StringGrid1.rowCount>1) then
  begin
    form1.StringGrid1.FixedCols:=1;
    form1.StringGrid1.FixedRows:=1;
  end;
  closefile(p);
  lista.Free;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  if (radiogroup1.ItemIndex>-1) and (radiogroup2.ItemIndex>-1) and (radiogroup3.ItemIndex>-1) then
  begin
    if (radiogroup1.ItemIndex=0) then
    begin
      if (edit2.Text<>'') and (edit3.text<>'') then access(radiogroup2.ItemIndex, radiogroup3.ItemIndex)
      else showmessage('Uzupe³nij wszystkie pola');
    end
    else excel(radiogroup2.ItemIndex,radiogroup3.ItemIndex);
    radiogroup1.ItemIndex:=-1;
    radiogroup2.ItemIndex:=-1;
    radiogroup3.ItemIndex:=-1;
    edit1.Clear;
    edit2.Clear;
    edit3.Clear;
    opentextfiledialog1.FileName:='';
    close;
  end
  else showmessage('Zaznacz wszystkie pola');
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
  opentextfiledialog1.Execute;
  if opentextfiledialog1.FileName<>'' then
  begin
    edit1.Text:=opentextfiledialog1.filename;
    bitbtn1.enabled:=true;
    edit1.ShowHint:=true;
    edit1.Hint:=edit1.Text;
  end;
end;

procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex=0 then groupbox1.Enabled:=true
  else groupbox1.Enabled:=false;
end;

end.
