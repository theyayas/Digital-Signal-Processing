unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, TAGraph, TASeries, math;

type

  { TForm1 }
  arraysaya = array[-20..10000] of extended;
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries10: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart1LineSeries4: TLineSeries;
    Chart1LineSeries5: TLineSeries;
    Chart1LineSeries6: TLineSeries;
    Chart1LineSeries7: TLineSeries;
    Chart1LineSeries8: TLineSeries;
    Chart1LineSeries9: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries1: TLineSeries;
    Chart4LineSeries2: TLineSeries;
    Chart4LineSeries3: TLineSeries;
    Chart4LineSeries4: TLineSeries;
    Chart5: TChart;
    Chart5LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    Chart6LineSeries3: TLineSeries;
    Chart7: TChart;
    Chart7LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    ScrollBar5: TScrollBar;
    ScrollBar6: TScrollBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
    function DFT(sinyal : arraysaya; range : integer): arraysaya;

  private

  public

  end;

var
  ecg : textfile;
  N, i, j, fc1, fc2, x_y, k, l, m, kk, ll, mm, kkk, lll, mmm: integer;
  bpm, T, fs, w1, w2, th, ymax, total: extended;
  secg, LPF, HPF, dev, square, peak, x, w, wfix, ww, wwfix, www, wwwfix, rr, fourier : arraysaya;
  ambil:tstringlist;
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  buang1 : string;
  buang2 : string;
begin
  Chart1LineSeries1.Clear;
  if opendialog1.Execute then
  begin
       ambil:= tstringlist.Create;
       i := 0;
       assignfile(ecg,opendialog1.FileName);
       reset(ecg);
       readln(ecg, buang1);
       ambil.delimiter := '(';
       readln(ecg, buang2);
       ambil.delimitedtext := buang2;
       T := (strtofloat(ambil[1]));
       while not EOF (ecg) do
       begin
            i := i + 1;
            readln(ecg,N,Secg[N]);
       end;
       closefile(ecg);
       N := i;
       fs := (1/t);
       edit5.Text:= inttostr(n);
       edit2.Text:= floattostr(roundto(fs, -2));
  end;
  for j := 0 to N do
  begin
       Chart1LineSeries1.addxy(j,Secg[j]);
  end;
  Chart1LineSeries2.clear;
  Chart1LineSeries3.clear;
  Chart1LineSeries4.clear;
  Chart1LineSeries5.clear;
  Chart1LineSeries6.clear;
  Chart1LineSeries7.clear;
  Chart1LineSeries8.clear;
  Chart1LineSeries9.clear;
  Chart1LineSeries10.clear;
  Chart2LineSeries1.clear;
  Chart3LineSeries1.clear;
  Chart4LineSeries1.clear;
  Chart5LineSeries1.clear;
  Chart6LineSeries1.clear;
  Chart6LineSeries2.clear;
  Chart6LineSeries3.clear;
  Chart7LineSeries1.clear;

  Listbox1.Items.clear;
  Listbox2.Items.clear;

  Edit1.text := floattostr(0);
end;

//Untuk nilai minimum Henning Window
procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  ScrollBar1.max := ScrollBar2.position;
  k := ScrollBar1.position;
  chart1lineseries3.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries3.addxy(k,i);
  end;
  m := l-k;
  Chart1LineSeries2.clear;
  w[i]:=0;
  j := 0;
  for i := 0 to m do
  begin
       w[i+k] := 0.5 - (0.5*cos(2*pi*i/(m-1)));
       wfix[j] := Secg[i+k]*w[i+k];
       Chart1LineSeries2.addxy(i+k,w[i+k]);
       j := j + 1;
  end;
end;

//Untuk nilai maksimum Henning Window
procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  ScrollBar2.max := N;
  ScrollBar2.Min := ScrollBar1.position + 1;
  l := ScrollBar2.position;
  chart1lineseries4.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries4.addxy(l,i);
  end;
  m := l-k;
  Chart1LineSeries2.clear;
  w[i]:=0;
  j := 0;
  for i := 0 to m do
  begin
       w[i+k] := 0.5 - (0.5*cos(2*pi*i/(m-1)));
       wfix[j] := Secg[i+k]*w[i+k];
       Chart1LineSeries2.addxy(i+k,w[i+k]);
       j := j + 1;
  end;
end;


procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  ScrollBar3.max := ScrollBar4.position;
  kk := ScrollBar3.position;
  chart1lineseries5.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries5.addxy(kk,i);
  end;
  mm := ll-kk;
  Chart1LineSeries6.clear;
  ww[i]:=0;
  j := 0;
  for i := 0 to mm do
  begin
       ww[i+kk] := 0.5 - (0.5*cos(2*pi*i/(mm-1)));
       wwfix[j] := Secg[i+kk]*ww[i+kk];
       Chart1LineSeries6.addxy(i+kk,ww[i+kk]);
       j := j + 1;
  end;
end;

procedure TForm1.ScrollBar4Change(Sender: TObject);
begin
  ScrollBar4.max := N;
  ScrollBar4.Min := ScrollBar3.position + 1;
  ll := ScrollBar4.position;
  chart1lineseries7.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries7.addxy(ll,i);
  end;
  mm := ll-kk;
  Chart1LineSeries6.clear;
  ww[i]:=0;
  j := 0;
  for i := 0 to mm do
  begin
       ww[i+kk] := 0.5 - (0.5*cos(2*pi*i/(mm-1)));
       wwfix[j] := Secg[i+kk]*ww[i+kk];
       Chart1LineSeries6.addxy(i+kk,ww[i+kk]);
       j := j + 1;
  end;
end;

procedure TForm1.ScrollBar5Change(Sender: TObject);
begin
  ScrollBar5.max := ScrollBar6.position;
  kkk := ScrollBar5.position;
  chart1lineseries8.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries8.addxy(kkk,i);
  end;
  mmm := lll-kkk;
  Chart1LineSeries9.clear;
  www[i]:=0;
  j := 0;
  for i := 0 to mmm do
  begin
       www[i+kkk] := 0.5 - (0.5*cos(2*pi*i/(mmm-1)));
       wwwfix[j] := Secg[i+kkk]*www[i+kkk];
       Chart1LineSeries9.addxy(i+kkk,www[i+kkk]);
       j := j + 1;
  end;
end;

procedure TForm1.ScrollBar6Change(Sender: TObject);
begin
  ScrollBar6.max := N;
  ScrollBar6.Min := ScrollBar5.position + 1;
  lll := ScrollBar6.position;
  chart1lineseries10.clear;
  for i := -1 to 2 do
  begin
       chart1lineseries10.addxy(lll,i);
  end;
  mmm := lll-kkk;
  Chart1LineSeries9.clear;
  www[i]:=0;
  j := 0;
  for i := 0 to mmm do
  begin
       www[i+kkk] := 0.5 - (0.5*cos(2*pi*i/(mmm-1)));
       wwwfix[j] := Secg[i+kkk]*www[i+kkk];
       Chart1LineSeries9.addxy(i+kkk,www[i+kkk]);
       j := j + 1;
  end;
end;

//Operasi untuk mencari Heart Rate
procedure TForm1.Button2Click(Sender: TObject);
begin
  // frekuensi cut off 1 dan 2
  fc1 := strtoint(Edit3.Text);
  fc2 := strtoint(Edit4.Text);

  // omega 1 dan 2
  w1 := 2*pi*fc1;
  w2 := 2*pi*fc2;

  //Band Pass Filter (BPF)
  Chart2LineSeries1.clear;
  for i := 0 to N-1 do
  begin
       lpf[i] := ((8/sqr(T) - 2*sqr(w1))*lpf[i-1] - (4/sqr(T) - (2*sqrt(2)*w1)/T + sqr(w1))*lpf[i-2] + sqr(w1)*secg[i] + 2*sqr(w1)*secg[i-1] + sqr(w1)*secg[i-2])/(4/sqr(T) + (2*sqrt(2)*w1)/T + sqr(w1));
       hpf[i] := ((8/sqr(T) - 2*sqr(w2))*hpf[i-1] - (4/sqr(T) - 2*sqrt(2)*w2/T + sqr(w2))*hpf[i-2] + 4/sqr(T)*lpf[i] - 8/sqr(T)*lpf[i-1] + 4/sqr(T)*lpf[i-2])/(4/sqr(T) + 2*sqrt(2)*w2/T + sqr(w2));       //Band Pass Filter

       Chart2LineSeries1.addxy(i,hpf[i]);
  end;

  //Mencari Fourier Transform dari Sinyal ECG setelah dilakukan Band Pass Filter (BPF)
  Chart7LineSeries1.clear;
  DFT(hpf,mm);
  for i := 0 to round((mm-1)/2) do
  begin
    Chart7LineSeries1.AddXY(i*fs/(mm),fourier[i]);
  end;

  // derivatif dan kuadrat
  Chart3LineSeries1.clear;
  Chart4LineSeries1.clear;
  for i := 0 to N-1 do
  begin
       dev[i] := (1/8)*(-hpf[i - 2] - 2*hpf[i - 1] + 2*hpf[i + 1] + hpf[i + 2]);
       square[i] := sqr(dev[i]);

       Chart3LineSeries1.addxy(i,dev[i]);
       Chart4LineSeries1.addxy(i,square[i]);
  end;

  //Low Pass Filter (LPF) untuk mendapatkan 1 puncak
  w1 := 2*pi*5;
  Chart5LineSeries1.clear;
  for i := 0 to N-1 do
  begin
       lpf[i] := ((8/sqr(T) - 2*sqr(w1))*lpf[i-1] - (4/sqr(T) - (2*sqrt(2)*w1)/T + sqr(w1))*lpf[i-2] + sqr(w1)*square[i] + 2*sqr(w1)*square[i-1] + sqr(w1)*square[i-2])/(4/sqr(T) + (2*sqrt(2)*w1)/T + sqr(w1)); // lpf untuk menjadikan 1 puncak
       Chart5LineSeries1.addxy(i,lpf[i]);
  end;

  //mencari titik tertinggi dari semua peak untuk menentukan Treshold
  ymax := 0;
  x_y := 0;
  for i := 0 to N-1 do
  begin
    if ymax < lpf[i] then
    begin
      ymax := lpf[i];
      x_y := i;
    end;
  end;

  //Penentuan treshold
  th := ymax*sqrt(2)/2;

  //Mencari Heart Rate
  j := 0;
  total := 0;
  for i := 0 to N-1 do
  begin
       if lpf[i] > th then
       begin
            if (lpf[i] > lpf[i-1]) and (lpf[i] > lpf[i+1]) then
            begin
                 peak[i] := lpf[i];
                 x[j] := i;
                 rr[j] := x[j] - x[j-1];
                 total := total + rr[j];
                 Listbox1.Items.add(floattostr(roundto(peak[i], -4)));
                 Listbox2.Items.add(floattostr(x[j]));
                 j := j + 1;
            end;
            bpm := 60*fs/(total/j);         // rumus mencari heart rate
            Edit1.text := floattostr(roundto(bpm,-2));
       end;
  end;
end;

//Mencari Fourier Transform dari Sinyal ECG untuk menentukan frekuensi cut off
//Fourier untuk sinyal P
procedure TForm1.Button3Click(Sender: TObject);
begin
  Chart6LineSeries1.Clear;
  DFT(wfix,m);
  for i := 0 to round((m-1)/2) do
  begin
    Chart6LineSeries1.AddXY(i*fs/(m),fourier[i]);
  end;
end;

//Fourier untuk sinyal QRS
procedure TForm1.Button4Click(Sender: TObject);
begin
  Chart6LineSeries2.Clear;
  DFT(wwfix,mm);
  for i := 0 to round((mm-1)/2) do
  begin
    Chart6LineSeries2.AddXY(i*fs/(mm),fourier[i]);
  end;
end;

//Fourier untuk sinyal T
procedure TForm1.Button5Click(Sender: TObject);
begin
  Chart6LineSeries3.Clear;
  DFT(wwwfix,mmm);
  for i := 0 to round((mmm-1)/2) do
  begin
    Chart6LineSeries3.AddXY(i*fs/(mmm),fourier[i]);
  end;
end;

//Fungsi untuk mencari transformasi fourier
function Tform1.DFT(sinyal : arraysaya; range : integer): arraysaya;
var
  Real, Imaginer : arraysaya;
begin
  for i := 0 to round((range-1)/2) do
  begin
    Real[i] :=0;
    Imaginer[i] :=0;
    for j := 0 to range-1 do
    begin
         Real[i] := Real[i] + sinyal[j]*cos(2*pi*i*j/range);
         Imaginer[i] := Imaginer[i] - sinyal[j]*sin(2*pi*i*j/range);
    end;
    fourier[i] := sqrt(sqr(Real[i]) + sqr(Imaginer[i]));
    DFT := fourier;
  end;
end;

end.

