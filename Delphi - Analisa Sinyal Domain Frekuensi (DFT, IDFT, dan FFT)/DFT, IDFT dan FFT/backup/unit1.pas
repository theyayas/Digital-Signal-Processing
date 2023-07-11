unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries, math;

type

  { TForm1 }
  arraysaya = array[0..10000] of extended;
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart1LineSeries4: TLineSeries;
    Chart2: TChart;
    Chart2BarSeries1: TBarSeries;
    Chart2PieSeries1: TPieSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart4: TChart;
    Chart4BarSeries1: TBarSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    function  sinjil(a:extended):extended;
    function  cosjil(a:extended):extended;
    function change(fft:arraysaya):arraysaya;
    function reversebin(inp:integer):integer;
    function prosesfft():arraysaya;
  private

  public

  end;

var
  Form1: TForm1;
  Amplitudo1, Amplitudo2, Amplitudo3, Frekuensi1, Frekuensi2, Frekuensi3, Frekuensi : integer;
  SigSum, DFT, IDFT, Real, Imaginer, AmpDFT, InvReal, InvImaginer, x,  plot : array[0..10000] of extended;
  xre, xim : extended;
  N, N2, iterasiFFT, i, p : integer;


implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
begin
  Chart1LineSeries1.Clear;
  Chart1LineSeries2.Clear;
  Chart1LineSeries3.Clear;
  Chart1LineSeries4.Clear;
  Amplitudo1 := strtoint(Edit1.Text);
  Frekuensi1 := strtoint(Edit2.Text);
  Amplitudo2 := strtoint(Edit3.Text);
  Frekuensi2 := strtoint(Edit4.Text);
  Amplitudo3 := strtoint(Edit5.Text);
  Frekuensi3 := strtoint(Edit6.Text);
  N := strtoint (Edit7.Text);
  Frekuensi := strtoint(Edit8.Text);

  for i := 0 to N-1 do
  begin
    SigSum[i] := (Amplitudo1 * sin(2*pi*Frekuensi1*i/Frekuensi)) + (Amplitudo2 * sin(2*pi*Frekuensi2*i/Frekuensi)) + (Amplitudo3 * sin(2*pi*Frekuensi3*i/Frekuensi));
    Chart1LineSeries1.AddXY(i,SigSum[i]);
    Chart1LineSeries2.AddXY(i,(Amplitudo1 * sin(2*pi*Frekuensi1*i/Frekuensi)));
    Chart1LineSeries3.AddXY(i,(Amplitudo2 * sin(2*pi*Frekuensi2*i/Frekuensi)));
    Chart1LineSeries4.AddXY(i,(Amplitudo3 * sin(2*pi*Frekuensi3*i/Frekuensi)));
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  j : integer;
  ymax, ymax2 : extended;
  pisah : array[0..10000] of extended;
begin
  Chart2BarSeries1.Clear;
  for i := 0 to round(N/2)-1 do
  begin
    Real[i] :=0;
    Imaginer[i] :=0;
    for p := 0 to N-1 do
    begin
         Real[i] := Real[i] + SigSum[p]*cos(2*pi*i*p/N);
         Imaginer[i] := Imaginer[i] - SigSum[p]*sin(2*pi*i*p/N);
    end;
    DFT[i] := sqrt(sqr(Real[i]) + sqr(Imaginer[i]))/N;
    Chart2BarSeries1.AddXY(i*Frekuensi/(N),DFT[i]);
  end;

  ymax := 0;
  for i := 0 to round(N/2)-1 do
  begin
    if ymax < DFT[i] then
    ymax := DFT[i];
  end;

  ymax2 := ymax*sqrt(2)/2;

  j := 0;
  for i := 0 to round(N/2)-1 do
  begin
    if DFT[i] > ymax2 then
    begin
      pisah[j] := DFT[i];
      //listbox1.items.add(floattostr(pisah[j]));
      j := j + 1;
    end;
  end;

end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  Chart3LineSeries1.Clear;
  for p := 0 to N-1 do
  begin
    InvReal[p] := 0;
    InvImaginer[p] := 0;
    for i := 0 to N-1 do
    begin
      InvReal[p] := InvReal[p] + DFT[i]*cos(2*pi*i*p/N)/N;
      InvImaginer[p] := InvImaginer[p] + DFT[i]*sin(2*pi*i*p/N)/N;
    end;
    IDFT[p] := (InvReal[p] + InvImaginer[p]);
  end;
  for p:=0 to N-1 do
  begin
    Chart3LineSeries1.AddXY(p,IDFT[p]);
  end;
end;

function TForm1.sinjil(a:extended):extended;
begin
 sinjil  := sin(2*pi*a/N);
 result  := sinjil;
end;

function TForm1.cosjil(a:extended):extended;
begin
 cosjil  := cos(2*pi*a/N);
 result  := cosjil;
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  plot : arraysaya;
  i : integer;
begin
 Chart4BarSeries1.clear;
 plot := prosesfft();
 for i := 0 to round(N/2)-1 do
 Chart4BarSeries1.addXY(i*(Frekuensi/N),plot[i]);
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
 if checkbox1.checked = true then
 begin
   chart1lineseries1.showlines := true;
 end
 else if checkbox1.checked = false then
 begin
   chart1lineseries1.showlines := false;
 end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
 if checkbox2.checked = true then
 begin
   chart1lineseries2.showlines := true;
 end
 else if checkbox2.checked = false then
 begin
   chart1lineseries2.showlines := false;
 end;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
 if checkbox3.checked = true then
 begin
   chart1lineseries3.showlines := true;
 end
 else if checkbox3.checked = false then
 begin
   chart1lineseries3.showlines := false;
 end;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
 if checkbox4.checked = true then
 begin
   chart1lineseries4.showlines := true;
 end
 else if checkbox4.checked = false then
 begin
   chart1lineseries4.showlines := false;
 end;
end;

function tform1.prosesfft():arraysaya;
var
  //jumlah iterasi
  t,d  : integer;
  //Zero-Pad
  a      : integer;
  //Imag Declare
  i        : integer;
  //Perhitungan FFT
  tawal,bagi,b,c      : integer;
  temp                :arraysaya;
  fft,fft1            :array[0..10000,0..1]of extended;

begin
  Chart4BarSeries1.Clear;
  t := 1;
  i := 0;
  d := 0;
  b := 1;

//Jumlah Iterasi
  while (N > t) do  //N = Jumlah data sayang
  begin
   t := t*2;
   d := d + 1;
  end;

//Zero Padding
  a := t - N;
  while (a > 0) do
  begin
   i := a + N - 1;
   x[i] := 0;
   a := a - 1;
  end;

//Imaginer Declare
  N := t;
  for i:=0 to N-1 do
  begin
    fft[i,0] := SigSum[i];
    fft[i,1] := 0;
  end;

//Perhitungan FFT
  for i := 1 to d do //looping iterasi
  begin
   tawal := 0;
   bagi := trunc(power(2,(i-1)));
   for b := 1 to bagi do //looping pembagian kelompok
   begin
    for c := 1 to (t div (2*bagi)) do //looping itungan
    begin
     //iterasi Genap
     fft1[tawal,0] := fft[tawal,0] + fft[tawal + (t div (2*bagi)),0];
     fft1[tawal,1] := fft[tawal,1] + fft[tawal + (t div (2*bagi)),1];
     //Listbox3.items.add(inttostr(tawal));

     //iterasi Ganjil
     xre := fft[tawal,0] - fft[tawal + (t div (2*bagi)),0];
     xim := fft[tawal,1] - fft[tawal + (t div (2*bagi)),1];
     fft1[tawal + (t div (2*bagi)),0] := xre*cosjil(c*power(2,i)/2) + xim*sinjil(c*power(2,i)/2);
     fft1[tawal + (t div (2*bagi)),1] := xim*cosjil(c*power(2,i)/2) - xre*sinjil(c*power(2,i)/2);
     //Listbox4.items.add(inttostr(tawal + t div (2*bagi)));

     inc(tawal);
    end;
    tawal:= tawal + (t div (2*bagi));
    //Listbox3.items.add('~~~iterasi~~~');
    //Listbox4.items.add('~~~iterasi~~~');
   end;

   fft:=fft1;
  end;

  //Plotting FFT
  for i:=0 to t do
  begin
    temp[i] := sqrt(sqr(fft1[i,0]) + sqr(fft1[i,1]))/t;
  end;
    prosesfft:=change(temp);
end;

function tform1.change(fft:arraysaya):arraysaya;
var
  i : integer;
  temp:arraysaya;
begin
     for i:= 0 to N do begin
       temp[i] := fft[reversebin(i)];
     end;
     change := temp;
end;

function tform1.reversebin(inp:integer):integer;
var
  i,temp,rvb:integer;
begin
  temp := 0;
  rvb := inp;
  for i:= round(log2(N)) downto 1 do begin
      temp := temp + trunc(power(2,i-1))*(rvb mod 2);
      rvb := rvb div 2;
  end;
reversebin := temp;
end;
end.

