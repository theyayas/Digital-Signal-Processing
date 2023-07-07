unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, TAGraph, TASeries, TACustomSeries, TARadialSeries, TAMultiSeries,
  math;

type

  { TForm1 }

  arraysaya = array[-50..100000] of extended;
  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Chart1: TChart;
    Chart10: TChart;
    Chart10LineSeries1: TLineSeries;
    Chart11: TChart;
    Chart11LineSeries1: TLineSeries;
    Chart12: TChart;
    Chart12LineSeries1: TLineSeries;
    Chart13: TChart;
    Chart13LineSeries1: TLineSeries;
    Chart13LineSeries2: TLineSeries;
    Chart13LineSeries3: TLineSeries;
    Chart13LineSeries4: TLineSeries;
    Chart13LineSeries5: TLineSeries;
    Chart15: TChart;
    Chart15LineSeries1: TLineSeries;
    Chart16: TChart;
    Chart16LineSeries1: TLineSeries;
    Chart17: TChart;
    Chart17LineSeries1: TLineSeries;
    Chart18: TChart;
    Chart18LineSeries1: TLineSeries;
    Chart19: TChart;
    Chart19LineSeries1: TLineSeries;
    Chart19LineSeries2: TLineSeries;
    Chart19LineSeries3: TLineSeries;
    Chart19LineSeries4: TLineSeries;
    Chart19LineSeries5: TLineSeries;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart22: TChart;
    Chart22LineSeries1: TLineSeries;
    Chart23: TChart;
    Chart23LineSeries1: TLineSeries;
    Chart24: TChart;
    Chart24LineSeries1: TLineSeries;
    Chart25: TChart;
    Chart25LineSeries1: TLineSeries;
    Chart25LineSeries2: TLineSeries;
    Chart25LineSeries3: TLineSeries;
    Chart25LineSeries4: TLineSeries;
    Chart25LineSeries5: TLineSeries;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries1: TLineSeries;
    Chart5: TChart;
    Chart5LineSeries1: TLineSeries;
    Chart5LineSeries2: TLineSeries;
    Chart5LineSeries3: TLineSeries;
    Chart5LineSeries4: TLineSeries;
    Chart5LineSeries5: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    Chart7: TChart;
    Chart7LineSeries1: TLineSeries;
    Chart7LineSeries5: TLineSeries;
    Chart7LineSeries6: TLineSeries;
    Chart7LineSeries7: TLineSeries;
    Chart8: TChart;
    Chart8LineSeries1: TLineSeries;
    Chart8LineSeries2: TLineSeries;
    Chart8LineSeries3: TLineSeries;
    Chart8LineSeries4: TLineSeries;
    Chart8LineSeries5: TLineSeries;
    Chart8LineSeries6: TLineSeries;
    Chart9: TChart;
    Chart9LineSeries2: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox7: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Timer1: TTimer;
    Timer2: TTimer;
    //procedure Button10Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
    procedure CheckBox12Change(Sender: TObject);
    procedure CheckBox13Change(Sender: TObject);
    procedure CheckBox14Change(Sender: TObject);
    procedure CheckBox15Change(Sender: TObject);
    procedure CheckBox16Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function SetelahFilter(filtered : arraysaya): arraysaya;
    function polezero(r : extended; fc : extended) : arraysaya;
    function DFT(sinyal : arraysaya; range : integer): arraysaya;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);



  private

  public

  end;

var
  ecg : textfile;
  a, N, i, j, fchpf, fclpf, window, k, pos1, pos2, range : integer;
  bpm, ymax, T, fs, xi, y, total, poler, polefc, nilaik, tet, magnitudemax, thmagnitude, w1, w2, th, realtotal, realbpm, poletotal : extended;
  ymax2, spkf, npkf, secg, LPF, HPF, dev, square, real, imaginer, x, th1, th2, spki, npki, peak, rr, num, denum, magnitude, xp1, yp1, xp11, yp11: arraysaya;
  dev2, square2, digital2, realx2, realrr2, poleMWI, spki1, npki1, th11, th12, filter, panlpf, panhpf, lpf4, hpf4, digital, w, wfix, fourier, reallpf, realhpf, realdev, realsquare, realMWI, real2lpf, MWI, realdigital, realx, realrr, polex, polerr: arraysaya;
  realtotal2, panth2max2, th1max, th2max2, omg, r1, r2, r3, r4, tet1, tet2, tet3, tet4 : extended;
  ambil:tstringlist;
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  xi := -1;
  while xi <= 1 do
  begin
       y := sqrt(1-(xi*xi));
       chart8lineseries1.addxy(xi,y);
       chart8lineseries2.addxy(xi,-y);
       xi := xi + 0.01;
  end;
end;

procedure TForm1.RadioButton3Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  buang1 : string;
  buang2 : string;
begin
  Chart1LineSeries1.Clear;
  Chart7LineSeries1.Clear;
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
       edit2.Text:= inttostr(n);
       edit3.Text:= floattostr(roundto(fs,-2));
  end;
  for j := 0 to N do
  begin
       Chart1LineSeries1.addxy(j,Secg[j]);
       Chart7LineSeries1.addxy(j,Secg[j]);
  end;
  chart7lineseries5.clear;
  chart7lineseries6.clear;
  chart7lineseries7.clear;
end;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Pan-Thompkins~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
procedure TForm1.Button2Click(Sender: TObject);
var
  th2max : extended;
begin
  Chart2LineSeries1.clear;
  Chart3LineSeries1.clear;
  Chart4LineSeries1.clear;
  Chart5LineSeries1.clear;
  Chart5LineSeries2.clear;
  Chart5LineSeries3.clear;
  Chart5LineSeries4.clear;
  //Chart5LineSeries5.clear;

  //Band Pass Filter (BPF) dengan LPF dan HPF
  for i := 0 to N-1 do
  begin
       panlpf[i] := 2*panlpf[i-1] - panlpf[i-2] + secg[i] - 2*secg[i-6] + secg[i-12];
       //panhpf[i]:= panhpf[i-1]-(panlpf[i]/32)+panlpf[i-16]-panlpf[i-17]+(panlpf[i-32]/32);
       panhpf[i] := 32*panlpf[i-16] - ( panhpf[i-1] + panlpf[i] - panlpf[i-32] ) ;
       Chart2LineSeries1.addxy(i,panhPF[i]);
  end;

  //mencari Derivative dan Square
  for i := 0 to N-1 do
  begin
       dev[i] := (1/8)*(-panhpf[i - 2] - 2*panhpf[i - 1] + 2*panhpf[i + 1] + panhpf[i + 2]);
       square[i] := sqr(dev[i]);

       Chart3LineSeries1.addxy(i,dev[i-2]);
       Chart4LineSeries1.addxy(i,square[i-2]);
  end;

  //Moving Window Integration (Chart19LineSeries1)
  window := round(fs*12/100);
  for i := 0 to N-1 do
  begin
       MWI[i] := 0;
       for j := 1 to window do
       begin
            MWI[i] := MWI[i] + (square[i - (window-j)])/window;
       end;
       Chart5LineSeries1.addxy(i,MWI[i]);
  end;

  {th1max := 0;
  for i := 0 to N-1 do
  begin
    if th1max < MWI[i] then
    begin
         th1max := MWI[i];
    end;
  end;}

  //algoritma mencari Treshold
  for i := 0 to N-1 do
  begin
       spki[i] := 0.125*MWI[i] + 0.875*spki[i-1];
       npki[i] := 0.125*MWI[i]*0.5 + 0.875*0.0015;
       Chart5LineSeries2.addxy(i,spki[i]);
       Chart5LineSeries3.addxy(i,npki[i]);
  end;

  th2max := 0;
  for i := 0 to N-1 do
  begin
    if th2max < spki[i] then
    begin
         th2max := spki[i];
    end;
  end;

  panth2max2 := th2max*sqrt(2)/2;

  for i := 0 to N-1 do
  begin
    spki1[i] := 0.125*panth2max2 + 0.875*spki1[i-1];
    th1[i] := npki1[i] + 0.25*(spki1[i] - npki1[i]);
    Chart5LineSeries4.addxy(i,th1[i]);
  end;

  for i := 0 to N-1 do
  begin
    if spki[i] > th1[i] then
    begin
         digital[i] := 1;
    end
    else if spki[i] < th1[i] then
    begin
         digital[i] := 0;

    end;
    Chart5LineSeries5.addxy(i,digital[i]*th2max);
  end;

  j := 0;
  total := 0;
  for i := 0 to N-1 do
  begin
       if spki[i] > th1[i] then
       begin
            if (spki[i] > spki[i-1]) and (spki[i] > spki[i+1]) then
            begin
                x[j] := i;
                rr[j] := x[j] - x[j-1];
                total := total + rr[j];

                j := j + 1;
            end;
       end;
  end;
  bpm := 60*fs/(total/j);
  Edit1.text := floattostr(roundto(bpm,-2));
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if (checkbox1.checked = false) then
  begin
     chart5lineseries1.ShowLines := false;
  end
  else if (checkbox1.checked = true) then
     chart5lineseries1.ShowLines := true;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  if (checkbox2.checked = false) then
  begin
     chart5lineseries2.ShowLines := false;
  end
  else if (checkbox2.checked = true) then
     chart5lineseries2.ShowLines := true;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  if (checkbox3.checked = false) then
  begin
     chart5lineseries3.ShowLines := false;
  end
  else if (checkbox3.checked = true) then
     chart5lineseries3.ShowLines := true;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
  if (checkbox4.checked = false) then
  begin
     chart5lineseries4.ShowLines := false;
  end
  else if (checkbox4.checked = true) then
     chart5lineseries4.ShowLines := true;
end;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Real Time Calculation 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
procedure TForm1.Button6Click(Sender: TObject);
begin
  k := 0;
  j := 0;
  a := 0;

  realtotal := 0;
  bpm := 0;

  for i := 0 to N-1 do
  begin
    spki1[i] := 0; reallpf[i] := 0; realhpf[k] := 0; realdev[i] := 0; realsquare[i] := 0; realMWI[i] := 0; spki[i] := 0; npki[i] := 0; th1[i] := 0; th2[i] := 0; digital[i] := 0; realrr[i] := 0;
  end;

  Chart15LineSeries1.Clear;
  Chart16LineSeries1.Clear;
  Chart17LineSeries1.Clear;
  Chart18LineSeries1.Clear;
  Chart19LineSeries1.Clear;
  Chart19LineSeries2.Clear;
  Chart19LineSeries3.Clear;
  Chart19LineSeries4.Clear;
  //Chart19LineSeries5.Clear;

  timer1.enabled := true;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  timer1.enabled := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  th2max : arraysaya;
  tresh : extended;
begin
  Chart15LineSeries1.addxy(k,Secg[k]);

  reallpf[k]:= (2*reallpf[k-1])-reallpf[k-2]+ secg[k]-(2*secg[k-6])+ secg[k-12];
  realhpf[k]:= realhpf[k-1]-(reallpf[k]/32)+reallpf[k-16]-reallpf[k-17]+(reallpf[k-32]/32);
  //realhpf[i] := 32*reallpf[i-16] - ( realhpf[i-1] + reallpf[i] - reallpf[i-32] ) ;
  Chart16LineSeries1.addxy(k,realhPF[k]);

  realdev[k] := (1/8)*(-realhpf[k - 2] - 2*realhpf[k - 1] + 2*realhpf[k + 1] + realhpf[k + 2]);
  Chart17LineSeries1.addxy(k,realdev[k]);

  realsquare[k] := sqr(realdev[k]);
  Chart18LineSeries1.addxy(k,realsquare[k]);

  window := round(fs*4.16/100);
  for j := 1 to  window do
  begin
       realMWI[k] := realMWI[k] + (realsquare[k - (window-j)])/window;
  end;
  Chart19LineSeries1.addxy(k,realMWI[k]);

  spki[k] := 0.125*realMWI[k] + 0.875*spki[k-1];
  npki[k] := 0.125*realMWI[k]*0.5 + 0.875*npki[k-1];
  Chart19LineSeries2.addxy(k,spki[k]);
  Chart19LineSeries3.addxy(k,npki[k]);

  tresh := panth2max2/20;
  spki1[k] := 0.125*tresh + 0.875*spki1[k-1];
  th1[k] := npki1[k] + 0.25*(spki1[k] - npki1[k]);
  Chart19LineSeries4.addxy(k,th1[k]);

  if spki[k] > th1[k] then
  begin
       digital[k] := 1;
  end
  else if spki[k] < th1[k] then
  begin
       digital[k] := 0;
  end;
  Chart19LineSeries5.addxy(k,digital[k]*60);

  if (digital[k] = 1) and (digital[k-1] = 0) then
  begin
       realx[a] := k;
       realrr[a] := realx[a] - realx[a-1];
       realtotal := realtotal + realrr[a];
       inc(a);
       end;

       // rumus mencari heart rate
       bpm := 60*fs/(realtotal/a);
       if (bpm < 0) and (bpm > 200)then
       begin
           Edit7.text := ' ';
       end
       else
       begin
           Edit7.text := floattostr(roundto(bpm,-2));
           listbox1.items.add(floattostr(roundto(bpm,-2)));
       end;
  if (k < N) then
  begin
     k := k + 1;
  end
  else if (k = N) then
     timer1.enabled := False;
end;

procedure TForm1.CheckBox6Change(Sender: TObject);
begin
  if (checkbox6.checked = false) then
  begin
     chart19lineseries1.ShowLines := false;
  end
  else if (checkbox6.checked = true) then
     chart19lineseries1.ShowLines := true;
end;

procedure TForm1.CheckBox7Change(Sender: TObject);
begin
  if (checkbox7.checked = false) then
  begin
     chart19lineseries2.ShowLines := false;
  end
  else if (checkbox7.checked = true) then
     chart19lineseries2.ShowLines := true;
end;

procedure TForm1.CheckBox8Change(Sender: TObject);
begin
  if (checkbox8.checked = false) then
  begin
     chart19lineseries3.ShowLines := false;
  end
  else if (checkbox8.checked = true) then
     chart19lineseries3.ShowLines := true;
end;

procedure TForm1.CheckBox9Change(Sender: TObject);
begin
  if (checkbox9.checked = false) then
  begin
     chart19lineseries4.ShowLines := false;
  end
  else if (checkbox9.checked = true) then
     chart19lineseries4.ShowLines := true;
end;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Pole-Zero~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Scrollbar1.Max := Scrollbar2.Position;
  pos1 := Scrollbar1.Position;
  Label1.caption := 'Min :' + inttostr(pos1);
  chart7lineseries5.clear;
  for i := -1 to 2 do
  begin
       chart7lineseries5.addxy(pos1,i);
  end;
  range := pos2 - pos1;
  Chart7LineSeries6.clear;
  w[i]:=0;
  j := 0;
  for i := 0 to range do
  begin
       w[i+pos1] := 0.5 - (0.5*cos(2*pi*i/(range-1)));
       wfix[j] := Secg[i+pos1]*w[i+pos1];
       Chart7LineSeries6.addxy(i+pos1,w[i+pos1]);
       j := j + 1;
  end;
  DFT(wfix,range);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Scrollbar2.max := N;
  Scrollbar2.min := Scrollbar1.Position + 1;
  pos2 := scrollbar2.position;
  Label6.caption := 'Max :' + inttostr(pos2);
  chart7lineseries7.clear;
  for i := -1 to 2 do
  begin
       chart7lineseries7.addxy(pos2,i);
  end;
  range := pos2 - pos1;
  Chart7LineSeries6.clear;
  w[i]:=0;
  j := 0;
  for i := 0 to range do
  begin
       w[i+pos1] := 0.5 - (0.5*cos(2*pi*i/(range-1)));
       wfix[j] := Secg[i+pos1]*w[i+pos1];
       Chart7LineSeries6.addxy(i+pos1,w[i+pos1]);
       j := j + 1;
  end;
  DFT(wfix,range);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  maxfourier : extended;
begin
  Chart9LineSeries2.Clear;
  DFT(wfix,range);
  for i := 0 to round((range-1)/2) do
  begin
    Chart9LineSeries2.AddXY(i*fs/(range),fourier[i]);
  end;

  maxfourier := 0;
  for i := 0 to round((range-1)/2) do
  begin
    if maxfourier < fourier[i] then
       maxfourier := fourier[i];
  end;

  Chart6lineseries2.clear;
  for i := 0 to round((range-1)/2) do
  begin
    fourier[i] := fourier[i]/maxfourier;
    Chart6lineseries2.addxy(i*fs/(range),fourier[i]);
  end;
end;

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

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  if (radiobutton1.checked = true) then
  begin
       r1 := 1;
       r2 := 1;
       tet1 := 180*pi/180;
       tet2 := 180*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end
  else if (radiobutton2.checked = true) then
  begin
       r1 := 1;
       r2 := 1;
       tet1 := 0*pi/180;
       tet2 := 0*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end
  else if (radiobutton3.checked = true) then
  begin
       r1 := 1;
       r2 := 1;
       tet1 := 0*pi/180;
       tet2 := 180*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end;
  polezero(poler, polefc);
end;

procedure TForm1.ScrollBar4Change(Sender: TObject);
begin
  if (radiobutton1.checked = true) then
  begin
       tet1 := 180*pi/180;
       tet2 := 180*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end
  else if (radiobutton2.checked = true) then
  begin
       r1 := 1;
       r2 := 1;
       tet1 := 0*pi/180;
       tet2 := 0*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end
  else if (radiobutton3.checked = true) then
  begin
       r1 := 1;
       r2 := 1;
       tet1 := 0*pi/180;
       tet2 := 180*pi/180;

       Chart8Lineseries5.clear;
       Chart8Lineseries6.clear;
       Chart8Lineseries5.addxy(r1*cos(tet1), r1*sin(tet1));
       Chart8Lineseries6.addxy(r2*cos(-tet2), r2*sin(-tet2));
  end;
  polezero(poler, polefc);
end;

function Tform1.polezero(r : extended; fc : extended): arraysaya;
begin
  Chart6Lineseries1.clear;
  Chart8Lineseries3.clear;
  Chart8Lineseries4.clear;

  ScrollBar3.Min := 0;
  ScrollBar3.max := 999;
  poler := 0.001*ScrollBar3.Position;
  r3 := poler;
  r4 := poler;
  label5.caption := 'Radius : ' + floattostr(poler);

  scrollbar4.min := 1;
  scrollbar4.max := round(fs/2);
  polefc := scrollbar4.position;
  tet3 := 2*pi*fc/fs;
  tet4 := -(2*pi*fc/fs);
  label4.caption := 'Angle : ' + floattostr(polefc);

  for i := 0 to round(fs/2) do
  begin
    omg := 2*pi*i/fs;
    num[i] := sqr(cos(2*omg) - (cos(omg)*cos(tet1))-(cos(omg)*cos(tet2))+(cos(tet1+tet2)))+sqr(sin(2*omg)-(sin(omg)*cos(tet1))-(sin(omg)*cos(tet2)));
    denum[i] := sqr(cos(2*omg)-(2*r3*cos(tet3)*cos(omg))+sqr(r3))+sqr(sin(2*omg)-(2*r3*cos(tet3)*sin(omg)));
    magnitude[i]:=sqrt(num[i]/denum[i]);
  end;

  magnitudemax := 0;
  for i := 0 to round(fs/2) do
  begin
    if magnitudemax < magnitude[i] then
    begin
         magnitudemax := magnitude[i];
    end;
  end;

  for i := 0 to round(fs/2) do
  begin
    magnitude[i] := magnitude[i]/magnitudemax;
    chart6lineseries1.AddXY(i, magnitude[i]);
  end;

  xp1[0] := 0;
  yp1[0] := 0;
  xp11[0] := 0;
  yp11[0] := 0;
  for i := 0 to 1 do
  begin
    Chart8Lineseries3.addxy(xp1[i], yp1[i]);
    Chart8Lineseries4.addxy(xp11[i], yp11[i]);

    xp1[i] := r3*cos(tet3);
    yp1[i] := r3*sin(tet3);
    xp11[i] := r4*cos(tet4);
    yp11[i] := r4*sin(tet4);
  end;

  Chart10LineSeries1.clear;

  //Band Pass Filter (BPF)
  for i := 0 to N-1 do
  begin
       filter[i] := secg[i] - (secg[i-1]*cos(tet1)+cos(tet2)) + (secg[i-2]*cos(tet1+tet2)) + (filter[i-1]*2*r3*cos(tet3)) - (filter[i-2]*r3*r3);
       Chart10LineSeries1.addxy(i,filter[i]);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SetelahFilter(filter);
end;

Function TForm1.SetelahFilter(filtered : arraysaya): arraysaya;
var
  th2max : extended;
begin
  Chart11LineSeries1.clear;
  Chart12LineSeries1.clear;
  Chart13LineSeries1.clear;

  // derivatif dan kuadrat
  for i := 0 to N-1 do
  begin
       dev[i] := (1/8)*(-filtered[i - 2] - 2*filtered[i - 1] + 2*filtered[i + 1] + filtered[i + 2]);
       square[i] := sqr(dev[i]);

       Chart11LineSeries1.addxy(i,dev[i-2]);
       Chart12LineSeries1.addxy(i,square[i-2]);
  end;

  window := round(fs*12/100);
  for i := 0 to N-1 do
  begin
       for j := 1 to window do
       begin
            poleMWI[i] := poleMWI[i] + (square[i - (window-j)])/window;
       end;
       Chart13LineSeries1.addxy(i,poleMWI[i]);
  end;

  //mencari titik tertinggi dari semua peak untuk menentukan Treshold
  {ymax := 0;
  for i := 0 to N-1 do
  begin
      if ymax < poleMWI[i] then
      begin
        ymax := poleMWI[i];
      end;
  end;

  for i := 0 to N-1 do
  begin
       spki[i] := 0.125*poleMWI[i] + 0.875*spki[i-1];
       npki[i] := 0.125*poleMWI[i] + 0.875*npki[i-1];
       th1[i] := npki[i] + 0.25*(spki[i] - npki[i]);
       th2[i] := 0.5*th1[i];
       Chart13LineSeries2.addxy(i,th2[i]);
  end;

  th2max := 0;
  for i := 0 to N-1 do
  begin
    if th2max < th2[i] then
    begin
         th2max := th2[i];
    end;
  end;

  th2max2 := th2max*sqrt(2)/2;}

  {ymax := 0;
  for i := 0 to N-1 do
  begin
    if ymax < poleMWI[i] then
    begin
         ymax := poleMWI[i];
    end;
  end;}

  //algoritma mencari Treshold
  for i := 0 to N-1 do
  begin
       spki[i] := 0.125*poleMWI[i] + 0.875*spki[i-1];
       npki[i] := 0.125*poleMWI[i]*0.5 + 0.875*npki[i-1];
       Chart13LineSeries2.addxy(i,spki[i]);
       Chart13LineSeries3.addxy(i,npki[i]);
  end;

  th2max := 0;
  for i := 0 to N-1 do
  begin
    if th2max < spki[i] then
    begin
         th2max := spki[i];
    end;
  end;

  th2max2 := th2max*sqrt(2)/2;

  for i := 0 to N-1 do
  begin
    spki1[i] := 0.125*th2max2 + 0.875*spki1[i-1];
    th1[i] := npki1[i] + 0.25*(spki1[i] - npki1[i]);
    Chart13LineSeries4.addxy(i,th1[i]);
  end;

  for i := 0 to N-1 do
  begin
    if spki[i] > th1[i] then
    begin
         digital[i] := 1;
    end
    else if spki[i] < th1[i] then
    begin
         digital[i] := 0;
    end;
    Chart13LineSeries5.addxy(i,digital[i]*25);
  end;

  //Mencari Heart Rate
  j := 0;
  poletotal := 0;
  for i := 0 to N-1 do
  begin
    //Chart13LineSeries3.addxy(i,th2max2);
       if spki[i] > th1[i] then
       begin
            if (spki[i] > spki[i-1]) and (spki[i] > spki[i+1]) then
            begin
                 polex[j] := i;
                 polerr[j] := polex[j] - polex[j-1];
                 poletotal := poletotal + polerr[j];
                 j := j + 1;
            end;
            // rumus mencari heart rate
            bpm := 60*fs/(poletotal/j);
            Edit6.text := floattostr(roundto(bpm,-2));
       end;
      end;
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
  if (checkbox5.checked = false) then
  begin
     chart13lineseries1.ShowLines := false;
  end
  else if (checkbox5.checked = true) then
     chart13lineseries1.ShowLines := true;
end;

procedure TForm1.CheckBox10Change(Sender: TObject);
begin
  if (checkbox10.checked = false) then
  begin
     chart13lineseries2.ShowLines := false;
  end
  else if (checkbox10.checked = true) then
     chart13lineseries2.ShowLines := true;
end;

procedure TForm1.CheckBox11Change(Sender: TObject);
begin
  if (checkbox11.checked = false) then
  begin
     chart13lineseries3.ShowLines := false;
  end
  else if (checkbox11.checked = true) then
     chart13lineseries3.ShowLines := true;
end;

procedure TForm1.CheckBox12Change(Sender: TObject);
begin
  if (checkbox12.checked = false) then
  begin
     chart13lineseries4.ShowLines := false;
  end
  else if (checkbox12.checked = true) then
     chart13lineseries4.ShowLines := true;
end;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Real Time Calculation 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
procedure TForm1.Button5Click(Sender: TObject);
begin
  k := 0;
  j := 0;
  a := 0;

  realtotal := 0;
  bpm := 0;

  for i := 0 to N-1 do
  begin
    dev2[i] := 0; square2[i] := 0; poleMWI[i] := 0; spki[i] := 0; npki[i] := 0; th1[i] := 0; th2[i] := 0; digital2[i] := 0; realrr[i] := 0;
  end;

  timer2.enabled := true;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  timer2.enabled := false;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Chart22LineSeries1.addxy(k,filter[k]);

  dev2[k] := (1/8)*(-filter[k - 2] - 2*filter[k - 1] + 2*filter[k + 1] + filter[k + 2]);
  square2[k] := sqr(dev2[k]);

  Chart23LineSeries1.addxy(k,dev2[k]);
  Chart24LineSeries1.addxy(k,square2[k]);

  window := round(fs*12/100);
  for j := 1 to window do
  begin
       poleMWI[k] := poleMWI[k] + (square2[k - (window-j)])/window;
  end;
  Chart25LineSeries1.addxy(k,poleMWI[k]);

  spki[k] := 0.125*poleMWI[k] + 0.875*spki[k-1];
  npki[k] := 0.125*poleMWI[k]*0.5 + 0.875*npki[k-1];
  Chart25LineSeries2.addxy(k,spki[k]);
  Chart25LineSeries3.addxy(k,npki[k]);

  spki1[k] := 0.125*th2max2 + 0.875*spki1[k-1];
  th1[k] := npki1[k] + 0.25*(spki1[k] - npki1[k]);
  Chart25LineSeries4.addxy(k,th1[k]);


  if spki[k] > th1[k] then
  begin
       digital2[k] := 1;
  end
  else if spki[k] < th1[k] then
  begin
       digital2[k] := 0;
  end;
  Chart25LineSeries5.addxy(k,digital2[k]*25);


  if (digital2[k] = 1) and (digital2[k-1] = 0) then
  begin
       realx[a] := k;
       realrr[a] := realx[a] - realx[a-1];
       realtotal := realtotal + realrr[a];
       inc(a);
       end;

       // rumus mencari heart rate
       bpm := 60*fs/(realtotal/a);
       if (bpm < 0) and (bpm > 200)then
       begin
           Edit4.text := ' ';
       end
       else
       begin
           Edit4.text := floattostr(roundto(bpm,-2));
           listbox2.items.add(floattostr(roundto(bpm,-2)));
       end;

  if (k < N) then
  begin
     k := k + 1;
  end
  else if (k = N) then
     timer2.enabled := False;
end;

procedure TForm1.CheckBox13Change(Sender: TObject);
begin
  if (checkbox13.checked = false) then
  begin
     chart25lineseries1.ShowLines := false;
  end
  else if (checkbox13.checked = true) then
     chart25lineseries1.ShowLines := true;
end;

procedure TForm1.CheckBox14Change(Sender: TObject);
begin
  if (checkbox14.checked = false) then
  begin
     chart25lineseries2.ShowLines := false;
  end
  else if (checkbox14.checked = true) then
     chart25lineseries2.ShowLines := true;
end;

procedure TForm1.CheckBox15Change(Sender: TObject);
begin
  if (checkbox15.checked = false) then
  begin
     chart25lineseries3.ShowLines := false;
  end
  else if (checkbox15.checked = true) then
     chart25lineseries3.ShowLines := true;
end;

procedure TForm1.CheckBox16Change(Sender: TObject);
begin
  if (checkbox16.checked = false) then
  begin
     chart25lineseries4.ShowLines := false;
  end
  else if (checkbox16.checked = true) then
     chart25lineseries4.ShowLines := true;
end;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

procedure TForm1.Button4Click(Sender: TObject);
begin
  for i := -50 to 100000 do
  begin
        spki1[i] := 0; npki1[i] := 0;
        w[i] := 0; wfix[i] := 0; fourier[i]:= 0; lpf4[i] := 0; hpf4[i] := 0; digital[i] := 0; reallpf[i] := 0; realhpf[i] := 0; realdev[i] := 0; realsquare[i] := 0;realMWI[i] := 0; real2lpf[i] := 0; realdigital[i] := 0; realx[i] := 0; realrr[i] := 0;
        dev2[i] := 0; square2[i] := 0; digital2[i] := 0; realx2[i] := 0; realrr2[i] := 0; poleMWI[i] := 0; polex[i] := 0; polerr[i] := 0; panlpf[i] := 0; panhpf[i] := 0; secg[i] := 0; LPF[i] := 0; HPF[i] := 0; dev[i] := 0; square[i] := 0; MWI[i] := 0; real[i] := 0; imaginer[i] := 0; {DFT[i] := 0;} x[i] := 0; th1[i] := 0; th2[i] := 0; spki[i] := 0; npki[i] := 0; peak[i] := 0; rr[i] := 0; num[i] := 0; denum[i] := 0; magnitude[i] := 0; xp1[i] := 0; yp1[i] := 0; xp11[i] := 0; yp11[i] := 0;
  end;

  a := 0; N := 0; i := 0; j := 0; fchpf := 0; fclpf := 0; window := 0; k := 0; pos1 := 0; pos2 := 0; range := 0; realtotal := 0;
  poletotal := 0; realbpm := 0; bpm := 0; ymax := 0; T := 0; fs := 0; xi := 0; y := 0; total := 0; poler := 0; polefc := 0; nilaik := 0; tet := 0; magnitudemax := 0; thmagnitude := 0; w1 := 0; w2 := 0; th := 0;
  realtotal2 := 0; panth2max2 := 0; th1max := 0; th2max2 := 0; omg := 0; r1 := 0; r2 := 0; r3 := 0; r4 := 0; tet1 := 0; tet2 := 0; tet3 := 0; tet4 := 0;


  edit1.text := ' ';
  edit2.text := ' ';
  edit3.text := ' ';
  edit6.text := ' ';
  edit7.text := ' ';

  label1.Caption := ' Min :';
  label5.Caption := ' Max :';
  label4.Caption := ' Radius :';
  label6.Caption := ' Cutoff Frequency :';

  Chart1LineSeries1.Clear;
  Chart2LineSeries1.Clear;
  Chart3LineSeries1.Clear;
  Chart4LineSeries1.Clear;
  Chart5LineSeries1.Clear;
  Chart5LineSeries2.Clear;
  Chart5LineSeries3.Clear;
  Chart5LineSeries4.clear;
  //Chart5LineSeries5.clear;
  Chart6LineSeries1.Clear;
  Chart6LineSeries2.Clear;
  Chart7LineSeries1.Clear;
  Chart7LineSeries5.Clear;
  Chart7LineSeries6.Clear;
  Chart7LineSeries7.Clear;
  Chart9LineSeries2.Clear;
  Chart10LineSeries1.Clear;
  Chart11LineSeries1.Clear;
  Chart12LineSeries1.Clear;
  Chart13LineSeries1.Clear;
  Chart13LineSeries2.Clear;
  Chart13LineSeries3.Clear;
  Chart13LineSeries4.Clear;
  Chart15LineSeries1.Clear;
  Chart16LineSeries1.Clear;
  Chart17LineSeries1.Clear;
  Chart18LineSeries1.Clear;
  Chart19LineSeries1.Clear;
  Chart19LineSeries2.Clear;
  Chart19LineSeries3.Clear;
  Chart19LineSeries4.Clear;
  Chart22LineSeries1.Clear;
  Chart23LineSeries1.Clear;
  Chart24LineSeries1.Clear;
  Chart25LineSeries1.Clear;
  Chart25LineSeries2.Clear;
  Chart25LineSeries3.Clear;
  Chart25LineSeries4.Clear;
  //Chart19LineSeries5.Clear;

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Application.terminate;
end;

end.

