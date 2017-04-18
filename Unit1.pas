unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, dateutils, printers, comobj, Vcl.ImgList;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Pomoc1: TMenuItem;
    Importdanych1: TMenuItem;
    Koniec1: TMenuItem;
    Oprogramie1: TMenuItem;
    Pomoc2: TMenuItem;
    Opcje1: TMenuItem;
    Dodajszko1: TMenuItem;
    Dodajnauczyciela1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    TrackBar1: TTrackBar;
    Widok1: TMenuItem;
    Powiksztabel1: TMenuItem;
    Pomniejsztabel1: TMenuItem;
    PrintDialog1: TPrintDialog;
    SaveDialog2: TSaveDialog;
    ListBox2: TListBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StringGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure StringGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Dodajnauczyciela1Click(Sender: TObject);
    procedure Dodajszko1Click(Sender: TObject);
    procedure Importdanych1Click(Sender: TObject);
    procedure Zapiszprojekt1Click(Sender: TObject);
    procedure Koniec1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AutoSizeCol(Grid: TStringGrid; Column: integer);
    procedure StringGrid1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Drukuj1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Oprogramie1Click(Sender: TObject);
    procedure Pomoc2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bmp : array[1..50] of tbitmap;
    iloscstron : byte;
  end;

const
  wersja='1.0.1.4';

var
  Form1: TForm1;
  kolumna, wiersz : byte;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i : byte;
  dn : array[1..7] of shortstring;
begin
  listbox1.Clear;
  dn[1]:='Pon';
  dn[2]:='Wt';
  dn[3]:='Śr';
  dn[4]:='Czw';
  dn[5]:='Pt';
  dn[6]:='Sob';
  dn[7]:='Nd';
  if (datetimepicker1.Date<>datetimepicker2.Date) and (datetimepicker1.Date<datetimepicker2.Date) and (weeksbetween(datetimepicker1.Date,datetimepicker2.Date)<=11) then
  begin
    listbox1.Clear;
    for I := 0 to daysbetween(datetimepicker1.Date,datetimepicker2.Date) do listbox1.Items.Add(datetostr(datetimepicker1.Date+i)+' ('+dn[dayoftheweek(datetimepicker1.Date+i)]+')');
  end
  else showmessage('Wybierz prawidłowe daty');
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
var
  xls, wb, range : olevariant;
  arrdata : variant;
  rowcount, colcount, i, j, j1 : integer;
  smax : array[1..50] of integer;
  wmax : array[1..100] of byte;
  il : byte;
  koniec : shortstring;
begin
  try
    trackbar1.Position:=5;
    autosizecol(stringgrid1,0);
    RowCount := StringGrid1.RowCount;
    ColCount := StringGrid1.ColCount;
    for I := 1 to colcount-1 do
      for j := 1 to rowcount-1 do if length(stringgrid1.Cells[i,j])>0 then if stringgrid1.Cells[i,j][length(stringgrid1.Cells[i,j])-1]=',' then stringgrid1.Cells[i,j]:=copy(stringgrid1.Cells[i,j],1,length(stringgrid1.Cells[i,j])-2);
    arrData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
    for i := 1 to RowCount do
      for j := 1 to ColCount do arrData[i, j] := StringGrid1.Cells[j-1, i-1];
    xls := CreateOLEObject('Excel.Application');
    wb := xls.Workbooks.Add;
    for I := 1 to 50 do smax[i]:=0;
    for I := 0 to colcount-1 do
    begin
      smax[i+1]:=0;
      for j := 0 to rowcount-1 do if length(stringgrid1.Cells[i,j])>smax[i+1] then smax[i+1]:=length(stringgrid1.Cells[i,j]);
    end;
    for I := 1 to 100 do wmax[i]:=0;
    for I := 1 to rowcount-1 do
    begin
      wmax[i]:=0;
      for j := 1 to colcount-1 do
        begin
          il:=0;
          for j1 := 1 to length(stringgrid1.Cells[j,i]) do if stringgrid1.Cells[j,i][j1]=',' then inc(il);
          if il>wmax[i] then wmax[i]:=il;
          if wmax[i]>0 then inc(wmax[i]);
        end;
    end;
    for I :=1 to colcount do
    begin
      wb.worksheets[1].cells[1,i].font.bold:=true;
      if i=1 then wb.worksheets[1].columns[i].columnwidth:=smax[1]
      else wb.worksheets[1].columns[i].columnwidth:=23;
      wb.worksheets[1].cells[1,i].interior.color:=colortorgb(clsilver);
      if i>1 then
      begin
        wb.worksheets[1].cells[1,i].verticalalignment:=-4108;
        wb.worksheets[1].cells[1,i].horizontalalignment := -4108;
      end;
    end;
    for I :=1 to rowcount do
    begin
      wb.worksheets[1].cells[i,1].font.bold:=true;
      //if i=1 then wb.worksheets[1].rows[i].rowheight:=stringgrid1.Font.Size+15
      //else wb.worksheets[1].rows[i].rowheight:=stringgrid1.Font.Size*wmax[i-1]+15;
      wb.worksheets[1].cells[i,1].verticalalignment:=-4108;
      wb.worksheets[1].cells[i,1].interior.color:=colortorgb(clsilver);
    end;
    for I := 2 to colcount do
      for j := 2 to rowcount do wb.worksheets[1].cells[j,i].verticalalignment:=-4108;
    koniec:=chr(64+colcount)+inttostr(rowcount);
    wb.Worksheets[1].Range['A1',koniec].Borders.LineStyle:=7;
    wb.Worksheets[1].Range['A1',koniec].Borders.color:=clblack;
    wb.worksheets[1].range['A1',koniec].entirerow.autofit;
    wb.worksheets[1].range['A1',koniec].entirecolumn.autofit;
    Range := wb.WorkSheets[1].Range[wb.WorkSheets[1].Cells[1, 1],wb.WorkSheets[1].Cells[RowCount, ColCount]];
    Range.Value := arrData;
    range.cells[rowcount+1,1]:='Planer v'+wersja+' | © Tomasz Krzywicki | www.krzywicki.pro';
    xls.Visible := True;
    xls:=unassigned;
  except
    on e: exception do showmessage('Pojawił się poważny błąd - prawdopodobnie dotyczy on Excela (jego braku, lub problemów z dostępem).'+#13+'Treść błędu: '+e.ClassName+' '+e.Message);
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  i : byte;
begin
  listbox2.Clear;
  case combobox2.itemindex of
    0 : for I := 0 to round(60/5)-1 do
        begin
          if i*5>=10 then listbox2.Items.Add(inttostr(combobox1.itemindex)+':'+inttostr(i*5))
          else listbox2.Items.Add(inttostr(combobox1.itemindex)+':0'+inttostr(i*5))
        end;
    1 : for I := 0 to round(60/10)-1 do
        begin
          if i*10>=10 then listbox2.Items.Add(inttostr(combobox1.itemindex)+':'+inttostr(i*10))
          else listbox2.Items.Add(inttostr(combobox1.itemindex)+':0'+inttostr(i*10));
        end;
    2 : for I := 0 to round(60/15)-1 do
        begin
          if i*15>=10 then listbox2.Items.Add(inttostr(combobox1.itemindex)+':'+inttostr(i*15))
          else listbox2.Items.Add(inttostr(combobox1.itemindex)+':0'+inttostr(i*15));
        end;
    3 : for I := 0 to round(60/20)-1 do
        begin
          if i*20>=10 then listbox2.Items.Add(inttostr(combobox1.itemindex)+':'+inttostr(i*20))
          else listbox2.Items.Add(inttostr(combobox1.itemindex)+':0'+inttostr(i*20));
        end;
    4 : for I := 0 to round(60/30)-1 do
        begin
          if i*30>=10 then listbox2.Items.Add(inttostr(combobox1.itemindex)+':'+inttostr(i*30))
          else listbox2.Items.Add(inttostr(combobox1.itemindex)+':0'+inttostr(i*30));
        end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  xls, wb, range : olevariant;
  arrdata : variant;
  rowcount, colcount, i, j, j1 : integer;
  smax : array[1..50] of integer;
  wmax : array[1..100] of byte;
  il : byte;
  koniec : shortstring;
begin
  try
    trackbar1.Position:=5;
    RowCount := StringGrid1.RowCount;
    ColCount := StringGrid1.ColCount;
    for I := 1 to colcount-1 do
      for j := 1 to rowcount-1 do if length(stringgrid1.Cells[i,j])>0 then if stringgrid1.Cells[i,j][length(stringgrid1.Cells[i,j])-1]=',' then stringgrid1.Cells[i,j]:=copy(stringgrid1.Cells[i,j],1,length(stringgrid1.Cells[i,j])-2);
    arrData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
    for i := 1 to RowCount do
      for j := 1 to ColCount do arrData[i, j] := StringGrid1.Cells[j-1, i-1];
    xls := CreateOLEObject('Excel.Application');
    wb := xls.Workbooks.Add;
    for I := 1 to 50 do smax[i]:=0;
    for I := 0 to colcount-1 do
    begin
      smax[i+1]:=0;
      for j := 0 to rowcount-1 do if length(stringgrid1.Cells[i,j])>smax[i+1] then smax[i+1]:=length(stringgrid1.Cells[i,j]);
    end;
    for I := 1 to 100 do wmax[i]:=0;
    for I := 1 to rowcount-1 do
    begin
      wmax[i]:=0;
      for j := 1 to colcount-1 do
        begin
          il:=0;
          for j1 := 1 to length(stringgrid1.Cells[j,i]) do if stringgrid1.Cells[j,i][j1]=',' then inc(il);
          if il>wmax[i] then wmax[i]:=il;
          if wmax[i]>0 then inc(wmax[i]);
        end;
    end;
    for I :=1 to colcount do
    begin
      wb.worksheets[1].cells[1,i].font.bold:=true;
      if i=1 then wb.worksheets[1].columns[i].columnwidth:=smax[1]
      else wb.worksheets[1].columns[i].columnwidth:=23;
      wb.worksheets[1].cells[1,i].interior.color:=colortorgb(clsilver);
      if i>1 then
      begin
        wb.worksheets[1].cells[1,i].verticalalignment:=-4108;
        wb.worksheets[1].cells[1,i].horizontalalignment := -4108;
      end;
    end;
    for I :=1 to rowcount do
    begin
      wb.worksheets[1].cells[i,1].font.bold:=true;
      //if i=1 then wb.worksheets[1].rows[i].rowheight:=stringgrid1.Font.Size+15
      //else wb.worksheets[1].rows[i].rowheight:=stringgrid1.Font.Size*wmax[i-1]+15;
      wb.worksheets[1].cells[i,1].verticalalignment:=-4108;
      wb.worksheets[1].cells[i,1].interior.color:=colortorgb(clsilver);
    end;
    for I := 2 to colcount do
      for j := 2 to rowcount do wb.worksheets[1].cells[j,i].verticalalignment:=-4108;
    koniec:=chr(64+colcount)+inttostr(rowcount);
    wb.Worksheets[1].Range['A1',koniec].Borders.LineStyle:=7;
    wb.Worksheets[1].Range['A1',koniec].Borders.color:=clblack;
    wb.worksheets[1].range['A1',koniec].entirerow.autofit;
    wb.worksheets[1].range['A1',koniec].entirecolumn.autofit;
    Range := wb.WorkSheets[1].Range[wb.WorkSheets[1].Cells[1, 1],wb.WorkSheets[1].Cells[RowCount, ColCount]];
    Range.Value := arrData;
    range.cells[rowcount+1,1]:='Planer v'+wersja+' | © Tomasz Krzywicki | www.krzywicki.pro';
    xls.Visible := True;
    xls:=unassigned;
  except
    on e: exception do showmessage('Pojawił się poważny błąd - prawdopodobnie dotyczy on Excela (jego braku, lub problemów z dostępem).'+#13+'Treść błędu: '+e.ClassName+' '+e.Message);
  end;
end;

procedure TForm1.Dodajnauczyciela1Click(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.Dodajszko1Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm1.Drukuj1Click(Sender: TObject);
var
  i, j : byte;
  px, py, szer, wys : integer;
  r : trect;
begin
  if printdialog1.Execute then
  begin
    if printer.Copies<=255 then
    begin
      printer.Orientation:=poLandscape;
      printer.BeginDoc;
      for I := 1 to printer.Copies do
      begin
        for j := 1 to iloscstron do
        begin
          px:=printer.PageWidth div bmp[j].Width;
          py:=printer.PageHeight div bmp[j].Height;
          szer:=bmp[j].Width*px;
          wys:=bmp[j].Height*py;
          r:=rect((printer.PageWidth div 2)-(szer div 2),(printer.PageHeight div 2)-(wys div 2),(printer.PageWidth div 2)+(szer div 2),(printer.PageHeight div 2)+(wys div 2));
          if j>1 then printer.NewPage;
          printer.Canvas.StretchDraw(r,bmp[j]);
        end;
      end;
      printer.EndDoc;
      showmessage('Drukowanie zakończone');
    end
    else showmessage('Nie możesz wybrać więcej niż 255 kopii');
  end;
end;

procedure TForm1.AutoSizeCol(Grid: TStringGrid; Column: integer);
var
  i, w, wmax, j: integer;
begin
  for I := column to grid.ColCount-1 do
  begin
    wmax:=0;
    for j := 0 to grid.RowCount-1 do
    begin
      w:=grid.Canvas.TextWidth(grid.Cells[i,j]);
      if w>wmax then wmax:=w;
    end;
    grid.ColWidths[i]:=wmax+10;
  end;
end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : byte;
begin
  for I := 1 to 50 do bmp[i].Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : byte;
begin
  formatsettings.ShortDateFormat:='dd.MM.yyyy';
  formatsettings.LongDateFormat:='dd.MM.yyyy';
  datetimepicker1.Date:=now;
  datetimepicker2.Date:=now;
  stringgrid1.Cells[0,0]:='Nauczyciel\Szkoła';
  for I := 1 to stringgrid1.RowCount-1 do stringgrid1.Cells[0,i]:='Nauczyciel '+inttostr(i);
  for I := 1 to stringgrid1.ColCount-1 do stringgrid1.Cells[i,0]:='Szkoła '+inttostr(i);
  for I := 1 to 50 do bmp[i]:=tbitmap.Create;
  listbox3.Items[0]:='';
end;

procedure TForm1.Importdanych1Click(Sender: TObject);
begin
  form4.show;
end;

procedure TForm1.Koniec1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then tlistbox(sender).begindrag(false);
end;

procedure TForm1.ListBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then tlistbox(sender).begindrag(false);
end;

procedure TForm1.ListBox3DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if TListBox(Source).Items.Count > 0 then listbox3.Items[0]:=listbox3.Items[0]+' '+TListBox(Source).Items[TListBox(Source).ItemIndex];
  if tlistbox(source).Items[tlistbox(source).ItemIndex]='Wyczyść' then listbox3.items[0]:='';
  tlistbox(source).ClearSelection;
  listbox1.ClearSelection;
  listbox2.ClearSelection;
  listbox4.ClearSelection;
end;

procedure TForm1.ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  accept := sender <> source;
end;

procedure TForm1.ListBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then tlistbox(sender).begindrag(false);
end;

procedure TForm1.ListBox4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then tlistbox(sender).begindrag(false);
end;

procedure TForm1.Oprogramie1Click(Sender: TObject);
begin
  showmessage('© Tomasz Krzywicki'+#13+'www.krzywicki.pro'+#13+'Program rozpowszechniany jest na licencji freeware.');
end;

procedure TForm1.Pomoc2Click(Sender: TObject);
begin
  showmessage('Pomoc jest aktualnie w fazie przygotowań. '+#13+'Więcej pod adresem http://krzywicki.pro/planer10.html');
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  autosizecol(stringgrid1,0);
end;

procedure TForm1.StringGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i, s : byte;
begin
  if (listbox3.Items.Count>0) and ((tlistbox(source)=listbox3) or (tlistbox(source)=listbox4)) then
  begin
    if tlistbox(source)=listbox3 then
    begin
      s:=0;
      for I := 1 to stringgrid1.ColCount-1 do if pos(listbox3.Items[listbox3.itemindex],stringgrid1.Cells[i,stringgrid1.Selection.top])>0 then inc(s);
      if s=0 then
      begin
        if length(stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top])>2 then
        begin
          if stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top][length(stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top])-1]=',' then stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]:=stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]+listbox3.items[listbox3.itemindex]+','+char(10)
          else stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]:=stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]+','+char(10)+listbox3.items[listbox3.itemindex]+','+char(10);
        end
        else stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]:=listbox3.items[listbox3.itemindex]+','+char(10);
        listbox3.Items[0]:='';
      end
      else showmessage('Data i godzina jest już zarezerwowana dla nauczyciela.');
    end
    else if tlistbox(source).Items[tlistbox(source).ItemIndex]='Wyczyść' then stringgrid1.Cells[stringgrid1.Selection.left,stringgrid1.Selection.top]:='';
    autosizecol(stringgrid1,0);
    tlistbox(source).ClearSelection;
    listbox1.ClearSelection;
    listbox2.ClearSelection;
  end;
end;

procedure TForm1.StringGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  accept := sender <> source;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  stringgrid1.DefaultColWidth:=(trackbar1.Position+4)*20;
  stringgrid1.Defaultrowheight:=(trackbar1.Position+4)*5;
  stringgrid1.Font.Size:=trackbar1.Position+4;
  autosizecol(stringgrid1,0);
end;

procedure TForm1.Zapiszprojekt1Click(Sender: TObject);
var
  p : textfile;
  i, j : byte;
begin
  savedialog1.Execute;
  if savedialog1.FileName<>'' then
  begin
    if not fileexists(savedialog1.FileName) then
    begin
      assignfile(p,savedialog1.FileName+'.prm');
      rewrite(p);
      writeln(p,'[('+datetostr(datetimepicker1.Date)+')('+datetostr(datetimepicker2.Date)+') ('+inttostr(combobox1.itemindex)+') ('+inttostr(combobox2.itemindex)+')]');
      for I := 0 to stringgrid1.rowCount-1 do
      begin
        for j := 0 to stringgrid1.colcount-1 do
        begin
          write(p,'|'+stringgrid1.Cells[j,i]);
        end;
        if i<stringgrid1.RowCount-1 then writeln(p,'|')
        else write(p,'|');
      end;
      closefile(p);
    end
    else showmessage('Plik już istnieje - wybierz inną nazwę, lub usuń istniejący');
  end;
end;

end.
