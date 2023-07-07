unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, math;

type
  myarray = array [-100..10000] of extended;
  TForm2 = class(TForm)
    Button1: TButton;
    Chart2: TChart;
    Chart4: TChart;
    Series3: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Series4: TLineSeries;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label11: TLabel;
    Chart3: TChart;
    Series7: TLineSeries;
    GroupBox2: TGroupBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit26: TEdit;
    Label20: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure IDFT(real : myarray; imaginer : myarray);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Parameter();
    procedure Rungekutta4();
    procedure plot(iterasi : integer; hasil:extended) ;
    procedure plotsakit(hasiln, hasils:myarray) ;
    function TriDStatePhase(t, x, y, z : extended; pilih : integer): extended;
    function Omega(parameter : extended): extended;
    function modulus(a : extended; b : extended): extended;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  N, cycle : integer;
  dt, fecg, Amplitude, hmean, hstd, f1, f2, c1, c2, gamma, x, y, z : extended;
  tet, alpha, beta, hasilx, hasily, hasilz : array [0..4] of extended;
  mayer, rsa, s, sbalik, mirror, sre, sim, InverseDFT, offset : myarray;

  fmayer, frsa, fs, fsbalik, fmirror, fsre, fsim, hasilznormal, hasilzsakit, hasilzsakitfix : myarray;

const
  {N = 256;        //approximate number of heartbeat
  fecg = 256;     //ECG sampling frequency (Hz)
  fint = 512;     //Internal sampling frequency }
  //Amplitude = 0.1;        //amplitude of additive uniform noise (mV)
  {hmean = 60;     //heart rate mean (bpm)
  hstd = 1;       //heart rate standard deviation (bpm)
  f1 = 2*pi*0.1;  //low frequency (Hz)
  f2 = 2*pi*0.25; //high frwquency (Hz)
  c1 = 0.1;       //low frequency standard deviation (Hz)
  c2 = 0.1;       //high frequency standard deviation (Hz)
  y = 0.5;        //LF/HF ratio    }
  sigma1 = 0.5;
  sigma2 = 1;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  i : integer;
  iterasi : extended;
begin
  series1.Clear;
  series2.Clear;
  Parameter();

  for i := 0 to N-1 do
  begin
    dt := 1/fecg;
    iterasi := 2*pi*i*dt;  //karna fungsi bergerak dalam frekuensi, maka harus diubah ke frekuensi

    mayer[i] := (sigma1 / sqrt(2*pi*sqr(c1))) * exp(-sqr((iterasi-f1)/c1)/2);
    rsa[i] := (sigma2 / sqrt(2*pi*sqr(c2))) * exp(-sqr((iterasi-f2)/c2)/2);

    s[i] := (mayer[i] + rsa[i])*dt;
    sbalik[i] := s[N-i];

    mirror[i] := s[i] + sbalik[i];


  end;

  for I := 0 to round((N-1)/cycle) do
  begin
    dt := 1/fecg;
    iterasi := 2*pi*i*dt;

    fmayer[i] := (sigma1 / sqrt(2*pi*sqr(c1))) * exp(-sqr((iterasi-f1)/c1)/2);
    frsa[i] := (sigma2 / sqrt(2*pi*sqr(c2))) * exp(-sqr((iterasi-f2)/c2)/2);

    fs[i] := (fmayer[i] + frsa[i])*dt;
    fsbalik[i] := fs[round(N/cycle)-i];

    fmirror[i] := fs[i] + fsbalik[i];

    series1.AddXY(i/(fecg), fs[i]);
    series2.AddXY(i/(fecg), fmirror[i]);
  end;

end;

procedure TForm2.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  series3.Clear;
  series4.Clear;
  for I := 0 to N-1 do
  begin
    //mencari random phase
    sre[i] := mirror[i]*cos(2*pi*random(10)/10);
    sim[i] := mirror[i]*sin(2*pi*random(10)/10);
  end;

  for I := 0 to round((N-1)/cycle) do
  begin
    fsre[i] := fmirror[i]*cos(2*pi*random(10)/10);
    fsim[i] := fmirror[i]*sin(2*pi*random(10)/10);
    series3.AddXY(i/(fecg), fsre[i]);
    series4.AddXY(i/(fecg), fsim[i]);
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  I : integer;
begin
  series5.Clear;
  series6.Clear;
  IDFT(sre, sim);

  //penambahan random seed (offset) dan scaling
  for I := 0 to N-1 do
  begin
    offset[i] := inverseDFT[i]*10 + 60/hmean;
    series6.AddXY(i, InverseDFT[i]);
    series5.AddXY(i, offset[i]);
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  I: Integer;
begin
  series7.Clear;

  if radiobutton1.Checked = true then
  begin
    tet[0] := strtofloat(edit11.Text)*pi/180;  alpha[0] := strtofloat(edit12.Text);  beta[0] := strtofloat(edit13.Text);
    tet[1] := strtofloat(edit14.Text)*pi/180;  alpha[1] := strtofloat(edit15.Text);  beta[1] := strtofloat(edit16.Text);
    tet[2] := strtofloat(edit17.Text)*pi/180;  alpha[2] := strtofloat(edit18.Text);  beta[2] := strtofloat(edit19.Text);
    tet[3] := strtofloat(edit20.Text)*pi/180;  alpha[3] := strtofloat(edit21.Text);  beta[3] := strtofloat(edit22.Text);
    tet[4] := strtofloat(edit23.Text)*pi/180;  alpha[4] := strtofloat(edit24.Text);  beta[4] := strtofloat(edit25.Text);
  end
  else if radiobutton2.Checked = true then
  begin
    tet[0] := -60*pi/180;  alpha[0] := 0;    beta[0] := 0.25;
    tet[1] := 15*pi/180;   alpha[1] := -5;   beta[1] := 0.1;
    tet[2] := 0*pi/180;    alpha[2] := 30;   beta[2] := 0.1;
    tet[3] := 15*pi/180;   alpha[3] := -50;  beta[3] := 0.05;
    tet[4] := 90*pi/180;   alpha[4] := -3;   beta[4] := 0.3;

    edit11.Text := floattostr(tet[0]*180/pi);  edit12.Text := floattostr(alpha[0]);  edit13.Text := floattostr(beta[0]);
    edit14.Text := floattostr(tet[1]*180/pi);  edit15.Text := floattostr(alpha[1]);  edit16.Text := floattostr(beta[1]);
    edit17.Text := floattostr(tet[2]*180/pi);  edit18.Text := floattostr(alpha[2]);  edit19.Text := floattostr(beta[2]);
    edit20.Text := floattostr(tet[3]*180/pi);  edit21.Text := floattostr(alpha[3]);  edit22.Text := floattostr(beta[3]);
    edit23.Text := floattostr(tet[4]*180/pi);  edit24.Text := floattostr(alpha[4]);  edit25.Text := floattostr(beta[4]);
  end;

  Rungekutta4();


end;

function Tform2.Omega(parameter : extended): extended;
var
 I : integer;
begin
  // Mengkonvert RR Tachogram ke kecepatan angular
  i := 1 + floor(parameter/dt);
  if offset[i] = 0 then omega := 2*pi
  else omega := 2*pi/offset[i];
end;

function TForm2.modulus(a : extended; b : extended): extended;
begin
  while(a >= b) do a := a - b;
  modulus := a;
end;

procedure Tform2.IDFT(real, imaginer : myarray);
var
  i, j : integer;
  Xreal, Ximaginer : myarray;
begin
  for i := 0 to N-1 do
  begin
    InverseDFT[i] := 0;
    for j := 0 to N-1 do
    begin
      InverseDFT[i] := InverseDFT[i] + real[j]*cos(2*pi*i*j/N) + imaginer[j]*sin(2*pi*i*j/N);
    end;
    InverseDFT[i] := InverseDFT[i]/N;
  end;
end;

procedure Tform2.Parameter();
begin
  cycle := strtoint(edit26.Text);
  N := cycle*strtoint(edit1.Text);
  fecg := strtofloat(edit2.Text);
  Amplitude := strtofloat(edit3.Text);
  hmean := strtofloat(edit4.Text);
  hstd := strtofloat(edit5.Text);
  f1 := strtofloat(edit6.Text)*2*pi;
  f2 := strtofloat(edit7.Text)*2*pi;
  c1 := strtofloat(edit8.Text);
  c2 := strtofloat(edit9.Text);
  gamma := strtofloat(edit10.Text);




end;

function Tform2.TriDStatePhase(t, x, y, z : extended; pilih : integer): extended;
var
  i : integer;
  a, deltaTet, teta, zo, temp : extended;
begin
  a := 1 - sqrt(sqr(x) + sqr(y));

  if pilih = 1 then
  begin
    TriDStatePhase := a*x - omega(t)*y;
  end
  else if pilih = 2 then
  begin
    TriDStatePhase := a*y + omega(t)*x;
  end
  else if pilih = 3 then
  begin
    teta := arctan2(y,x);
    zo := Amplitude*sin(2*pi*f2*t);
    temp := 0;
    for I := 0 to 4 do
    begin
      deltaTet := modulus(teta - tet[i], 2*pi);
      temp := temp - alpha[i]*deltaTet*exp(-0.5*sqr(deltaTet/beta[i]));
    end;
    temp := temp  - (z-zo);
    TriDStatePhase := temp;
  end;
end;

procedure Tform2.plot(iterasi : integer; hasil:extended) ;
var
  I: Integer;
begin
  for I := 0 to N-1 do
  begin
    series7.AddXY(iterasi/fecg, hasil*22.429906542056074766355140186916)
  end;
end;

procedure Tform2.plotsakit(hasiln, hasils:myarray) ;
var
  I: Integer;
begin
  {for I := 0 to N do
  begin
    if i > 255 then
    begin
      if (i mod 512 = 0) then
      begin
        series7.AddXY(i, hasils[i]*22.429906542056074766355140186916);
      end
      else
        series7.AddXY(i, hasiln[i]*22.429906542056074766355140186916);
    end;
  end; }

  for I := 0 to round(N*2/cycle)-1 do
  begin
    series7.AddXY(i/fecg, hasiln[i]*22.429906542056074766355140186916);
  end;
  for I := round(N*2/cycle) to round(N*3/cycle)-1 do
  begin
    series7.AddXY(i/fecg, hasils[i]*22.429906542056074766355140186916);
  end;
  for I := round(N*3/cycle) to N-1 do
  begin
    series7.AddXY(i/fecg, hasiln[i]*22.429906542056074766355140186916);
  end;
end;

procedure Tform2.Rungekutta4();
var
  I, J : Integer;
  time, k1x, k1y, k1z, k2x, k2y, k2z, k3x, k3y, k3z, k4x, k4y, k4z : extended;
begin
  x := 0.1;
  y := 0.0;
  z := 0.04;

  hasilx[0] := x;
  hasily[0] := y;
  if radiobutton1.Checked = true then hasilznormal[0] := z
  else if radiobutton2.Checked = true then hasilzsakit[0] := z;

  time := 0.0;
  for I := 0 to N-1 do
  begin

    k1x := TriDStatePhase(time, x, y, z, 1);
    k1y := TriDStatePhase(time, x, y, z, 2);
    k1z := TriDStatePhase(time, x, y, z, 3);

    k2x := TriDStatePhase(time + dt/2, x + k1x*dt/2, y + k1y*dt/2, z + k1z*dt/2, 1);
    k2y := TriDStatePhase(time + dt/2, x + k1x*dt/2, y + k1y*dt/2, z + k1z*dt/2, 2);
    k2z := TriDStatePhase(time + dt/2, x + k1x*dt/2, y + k1y*dt/2, z + k1z*dt/2, 3);

    k3x := TriDStatePhase(time + dt/2, x + k2x*dt/2, y + k2y*dt/2, z + k2z*dt/2, 1);
    k3y := TriDStatePhase(time + dt/2, x + k2x*dt/2, y + k2y*dt/2, z + k2z*dt/2, 2);
    k3z := TriDStatePhase(time + dt/2, x + k2x*dt/2, y + k2y*dt/2, z + k2z*dt/2, 3);

    k4x := TriDStatePhase(time, x + k3x*dt, y + k3y*dt, z + k3z*dt, 1);
    k4y := TriDStatePhase(time, x + k3x*dt, y + k3y*dt, z + k3z*dt, 2);
    k4z := TriDStatePhase(time, x + k3x*dt, y + k3y*dt, z + k3z*dt, 3);

    x := x + (dt/6)*(k1x + 2*k2x + 2*k3x + k4x);
    y := y + (dt/6)*(k1y + 2*k2y + 2*k3y + k4y);
    z := z + (dt/6)*(k1z + 2*k2z + 2*k3z + k4z);

    time := time + dt;

    hasilx[i] := x;
    hasily[i] := y;

    if radiobutton1.checked = true then
    begin
      hasilznormal[i] := z ;
      plot(i, z);
    end
    else if radiobutton2.Checked = true then
    begin
      hasilzsakit[i] := z;
    end;


    //series7.AddXY(i/fecg, hasilznormal[i]*22.429906542056074766355140186916);
    //series7.AddXY(i/fecg, z);
    {if radiobutton1.Checked = true then
    begin
        series7.AddXY(i/fecg, hasilznormal[i]*22.429906542056074766355140186916);
                                              //scaling berdasarkan paper yang puncaknya 1,2 mV
    end
    else if radiobutton2.Checked = true then
    begin
        series7.AddXY(i/fecg, hasilzsakit[i]*22.429906542056074766355140186916);
    end; }
  end;
  if radiobutton2.Checked = true then
  begin
      plotsakit(hasilznormal, hasilzsakit);
  end;
  {for I := 0 to N-1 do
  begin
    series7.AddXY(i, hasilznormal[i]);
  end; }
end;
end.
