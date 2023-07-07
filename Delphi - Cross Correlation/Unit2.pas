unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, math,
  Vcl.Grids;

type
  TForm2 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    OpenDialog1: TOpenDialog;
    ScrollBar1: TScrollBar;
    Chart2: TChart;
    Series3: TLineSeries;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  N : integer;
  Heel, Toe, Crosscor : array[0..10000] of extended;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Gait : textfile;
  i, j: integer;
begin
  Series1.Clear;
  opendialog1.Execute();

  i := 0;
  assignfile(gait,opendialog1.FileName);
  reset(gait);
  while not EOF (gait) do
  begin
    i := i + 1;
    readln(gait, heel[i], toe[i]);
    Series1.addxy(i, heel[i]);
    Series2.addxy(i, toe[i]);
  end;
  closefile(gait);
  N := i;

  stringgrid1.Cells[0, 0] := ('No');
  stringgrid1.Cells[1, 0] := ('Heel');
  stringgrid1.Cells[2, 0] := ('Toe');
  stringgrid1.Cells[3, 0] := ('Crosscorr');
  for I := 0 to N do
  begin
    crosscor[i] := 0;
    for j := 0 to N-1-i do
    begin
      crosscor[i] := crosscor[i] + (toe[j]*heel[j+i])/N;
    end;
    Series3.addxy(i, crosscor[i]);

    stringgrid1.Cells[0, i+1] := inttostr(i+1);
    stringgrid1.Cells[1, i+1] := floattostr(heel[i+1]);
    stringgrid1.Cells[2, i+1] := floattostr(toe[i+1]);
    stringgrid1.Cells[3, i+1] := floattostr(crosscor[i]);

  end;

end;

procedure TForm2.Edit1Change(Sender: TObject);
var
  a : string;
  i, j : integer;
begin
  series2.Clear;
  series3.Clear;

  a := Edit1.Text;
  scrollbar1.Position := strtoint(a);
  for I := 0 to N do
  begin
    crosscor[i] := 0;
    for j := 0 to N-1-i do
    begin
      crosscor[i] := crosscor[i] + (heel[i + j]*toe[j-scrollbar1.Position])/N;
    end;

    Series2.addxy(i,toe[i - scrollbar1.Position]);
    Series3.addxy(i, crosscor[i]);
  end;

end;

procedure TForm2.ScrollBar1Change(Sender: TObject);
var
  a, i, j : integer;
begin
  series2.Clear;
  series3.Clear;

  a := scrollbar1.Position;
  edit1.Text := inttostr(a);
  for I := 0 to N do
  begin
    crosscor[i] := 0;
    for j := 0 to N-1-i do
    begin
      crosscor[i] := crosscor[i] + (heel[i + j]*toe[j-a])/N;
    end;

    Series2.addxy(i,toe[i - a]);
    Series3.addxy(i, crosscor[i]);
  end;
end;

end.
