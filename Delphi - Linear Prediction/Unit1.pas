unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, math,
  Vcl.Samples.Spin, Vcl.Grids;

type
  array2D = array of array of Extended;
  TForm1 = class(TForm)
    Chart1: TChart;
    Button1: TButton;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Button2: TButton;
    Label8: TLabel;
    Chart3: TChart;
    Series3: TLineSeries;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Series4: TLineSeries;
    Button6: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure inversmatriks(input_matriks : array2D; orde: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  input : textfile;
  N, lag : integer;
  pcg, autocorr, sigma, alph, k, y, error, inc, LP : array [-200..1000000] of extended;
  alpha, invers, matrix : array2D;

implementation

{$R *.dfm}

//input data
procedure TForm1.Button1Click(Sender: TObject);
var
  I : integer;
  buang : extended;
begin
  series1.Clear;
  if opendialog1.Execute then
  begin
       i := 0;
       assignfile(input,opendialog1.FileName);
       reset(input);
       while not EOF (input) do
       begin
          readln(input, buang, pcg[i]);
          i := i + 1;
       end;
       closefile(input);
       N := i;
  end;
  for I := 0 to N-1 do
  begin
       Series1.addxy(i,pcg[i]);
  end;
end;

//mencari auto correlation dengan time lag
procedure TForm1.Button6Click(Sender: TObject);
var
  I, J : integer;
begin
  series2.Clear;
  listbox1.items.Clear;
  listbox2.items.Clear;

  lag := strtoint(edit1.Text);

  for I := 0 to lag do
  begin
    for J := 0 to N-1 do
    begin
      inc[i] := inc[i] + pcg[j]*pcg[j-i];
    end;
    series2.AddXY(i,inc[i]);
    listbox1.items.add(floattostr(inc[i]));
  end;

end;

//Mencari matriks
procedure TForm1.Button2Click(Sender: TObject);
var
  I, J : integer;
begin
  SetLength(matrix, lag, lag);
  StringGrid1.ColCount := lag;
  StringGrid1.RowCount := lag;
  StringGrid2.ColCount := lag;
  StringGrid2.RowCount := lag;

  for i := 0 to lag-1 do
  begin
     for j := 0 to lag -1 do
     begin
       matrix[i,j] := inc[Abs(j-i)];
       StringGrid1.Cells[j,i] := FloatToStr(matrix[i,j]);
     end;
  end;

 inversmatriks(matrix, lag);
 for i:= 0 to lag-1 do
 begin
   for j:=0 to lag-1 do
   begin
     StringGrid2.Cells[j,i] := FloatToStr(invers[i,j]);
   end;
 end;
end;

//PredictorCoefficient Alpha
procedure TForm1.Button3Click(Sender: TObject);
var
  I,J : integer;
begin
  ListBox2.clear;
  for i:= 0 to lag-1 do
  begin
    alph[i] := 0;
    for j:=0 to lag-1 do
    begin
      alph[i] := alph[i] + invers[i,j]*inc[j+1];
    end;
    Listbox2.Items.Add(floattostr(alph[i]));
  end;
end;

//Linear Prediction
procedure TForm1.Button4Click(Sender: TObject);
var
  I, J : integer;
begin
  for I := 0 to N-1 do
   begin
    LP[i]:=0;
     for J := 0 to lag-1 do
       begin
         LP[i] := LP[i] + alph[j]*pcg[i-j] ;
       end;
     Series3.AddXY(i, LP[i]);
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  I : integer;
begin
  for I := 0 to N-1 do
  begin
    error[i] := pcg[i] - LP[i];
    series4.AddXY(i, error[i]);
  end;
end;

Procedure Tform1.inversmatriks(input_matriks : array2D; orde: Integer);
var
i,j,k : integer;
constanta : extended;
  begin
   SetLength(invers, lag, lag);
   for i:= 0 to  orde-1 do
   begin
     for j := 0 to orde-1 do
     begin
       if i = j then invers[i,j] :=1 else
       invers[i,j] := 0;
     end;
   end;
   for k:= 0 to orde-1 do
   begin
      constanta := input_matriks[k,k] ;
      for j:= 0 to orde-1 do
      begin
        input_matriks[k,j] := input_matriks[k,j]/constanta;
        invers[k,j] := invers[k,j]/constanta;
      end;
      for i:=0 to orde-1 do
      begin
        if i <> k then
        begin
          constanta := input_matriks[i,k];
          for j:= 0 to orde-1 do
          begin
            input_matriks[i,j] := input_matriks[i,j] - constanta*input_matriks[k,j];
            invers[i,j] := invers[i,j] - constanta*invers[k,j];
          end;
        end;
      end;
   end;
  end;

end.
