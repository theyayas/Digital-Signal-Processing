object Form2: TForm2
  Left = 244
  Top = 45
  Caption = 'Synthetic ECG by Yasin'
  ClientHeight = 613
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 27
    Top = 8
    Width = 215
    Height = 45
    Caption = 'Synthetic ECG'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -37
    Font.Name = 'Swis721 BlkCn BT'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 388
    Width = 121
    Height = 31
    Caption = 'Mayer - RSA'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart2: TChart
    Left = 271
    Top = 145
    Width = 627
    Height = 137
    Legend.CheckBoxes = True
    Title.Color = clBlack
    Title.Font.Color = clBlack
    Title.Text.Strings = (
      'Random Phase')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = 'Frequency (Hz)'
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Power'
    View3D = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 0
    object Series3: TLineSeries
      Legend.Text = 'Real'
      LegendTitle = 'Real'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series4: TLineSeries
      Legend.Text = 'Imag'
      LegendTitle = 'Imag'
      SeriesColor = clTeal
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Chart4: TChart
    Left = 271
    Top = 282
    Width = 627
    Height = 137
    Legend.CheckBoxes = True
    Title.Font.Color = clBlack
    Title.Text.Strings = (
      'RR Tachogram')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = 'Sequence'
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 0
    object Series5: TLineSeries
      Legend.Text = 'After'
      LegendTitle = 'After'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series6: TLineSeries
      Legend.Text = 'Before'
      LegendTitle = 'Before'
      Active = False
      SeriesColor = clTeal
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Chart1: TChart
    Left = 271
    Top = 8
    Width = 627
    Height = 137
    Legend.CheckBoxes = True
    Title.Font.Color = clBlack
    Title.Text.Strings = (
      'Spectral Characteristics (Mayer RSA)')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = 'Frequency (Hz)'
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Power [sec^2/Hz]'
    View3D = False
    TabOrder = 3
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 0
    object Series1: TLineSeries
      Legend.Text = 'Mayer-RSA'
      LegendTitle = 'Mayer-RSA'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Legend.Text = 'Mirrored'
      LegendTitle = 'Mirrored'
      Active = False
      SeriesColor = clTeal
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 59
    Width = 257
    Height = 323
    Caption = 'Spectral Parameters'
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Data Amount'
    end
    object Label2: TLabel
      Left = 11
      Top = 77
      Width = 119
      Height = 13
      Caption = 'ECG Sampling Frequency'
    end
    object Label3: TLabel
      Left = 11
      Top = 105
      Width = 171
      Height = 13
      Caption = 'Amplitude of Additive Uniform Noise'
    end
    object Label4: TLabel
      Left = 11
      Top = 132
      Width = 82
      Height = 13
      Caption = 'Heart Rate Mean'
    end
    object Label5: TLabel
      Left = 11
      Top = 159
      Width = 148
      Height = 13
      Caption = 'Heart Rate Standard Deviation'
    end
    object Label6: TLabel
      Left = 11
      Top = 185
      Width = 73
      Height = 13
      Caption = 'Low Frequency'
    end
    object Label7: TLabel
      Left = 11
      Top = 213
      Width = 75
      Height = 13
      Caption = 'High Frequency'
    end
    object Label8: TLabel
      Left = 11
      Top = 240
      Width = 168
      Height = 13
      Caption = 'Low Frequency Standard Deviation'
    end
    object Label9: TLabel
      Left = 11
      Top = 268
      Width = 170
      Height = 13
      Caption = 'High Frequency Standard Deviation'
    end
    object Label10: TLabel
      Left = 11
      Top = 294
      Width = 56
      Height = 13
      Caption = 'LF/HF Ratio'
    end
    object Label20: TLabel
      Left = 11
      Top = 25
      Width = 31
      Height = 13
      Caption = 'Cycles'
    end
    object Edit1: TEdit
      Left = 194
      Top = 48
      Width = 55
      Height = 21
      TabOrder = 0
      Text = '256'
    end
    object Edit2: TEdit
      Left = 194
      Top = 75
      Width = 55
      Height = 21
      TabOrder = 1
      Text = '256'
    end
    object Edit3: TEdit
      Left = 194
      Top = 102
      Width = 55
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object Edit4: TEdit
      Left = 194
      Top = 129
      Width = 55
      Height = 21
      TabOrder = 3
      Text = '60'
    end
    object Edit5: TEdit
      Left = 194
      Top = 156
      Width = 55
      Height = 21
      TabOrder = 4
      Text = '1'
    end
    object Edit6: TEdit
      Left = 194
      Top = 183
      Width = 55
      Height = 21
      TabOrder = 5
      Text = '0,1'
    end
    object Edit7: TEdit
      Left = 194
      Top = 210
      Width = 55
      Height = 21
      TabOrder = 6
      Text = '0,25'
    end
    object Edit8: TEdit
      Left = 194
      Top = 237
      Width = 55
      Height = 21
      TabOrder = 7
      Text = '0,1'
    end
    object Edit9: TEdit
      Left = 194
      Top = 264
      Width = 55
      Height = 21
      TabOrder = 8
      Text = '0,1'
    end
    object Edit10: TEdit
      Left = 194
      Top = 291
      Width = 55
      Height = 21
      TabOrder = 9
      Text = '0,5'
    end
    object Edit26: TEdit
      Left = 194
      Top = 21
      Width = 55
      Height = 21
      TabOrder = 10
      Text = '5'
    end
  end
  object Button2: TButton
    Left = 144
    Top = 388
    Width = 121
    Height = 31
    Caption = 'Random Phase'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 419
    Width = 121
    Height = 33
    Caption = 'IDFT'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 144
    Top = 419
    Width = 121
    Height = 33
    Caption = 'Generate ECG'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Chart3: TChart
    Left = 335
    Top = 419
    Width = 563
    Height = 186
    Legend.CheckBoxes = True
    Legend.Visible = False
    Title.Font.Color = clBlack
    Title.Text.Strings = (
      'Synthesized ECG')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = 'Time (s)'
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Amplitude (mV)'
    View3D = False
    TabOrder = 8
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 5
    object Series7: TLineSeries
      SeriesColor = clBlack
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 461
    Width = 321
    Height = 144
    Caption = 'Morphological Parameters'
    TabOrder = 9
    object Label12: TLabel
      Left = 14
      Top = 43
      Width = 28
      Height = 13
      Caption = 'Theta'
    end
    object Label13: TLabel
      Left = 15
      Top = 69
      Width = 27
      Height = 13
      Caption = 'Alpha'
    end
    object Label14: TLabel
      Left = 15
      Top = 96
      Width = 22
      Height = 13
      Caption = 'Beta'
    end
    object Label15: TLabel
      Left = 68
      Top = 21
      Width = 6
      Height = 13
      Caption = 'P'
    end
    object Label16: TLabel
      Left = 122
      Top = 21
      Width = 8
      Height = 13
      Caption = 'Q'
    end
    object Label17: TLabel
      Left = 172
      Top = 21
      Width = 7
      Height = 13
      Caption = 'R'
    end
    object Label18: TLabel
      Left = 228
      Top = 21
      Width = 6
      Height = 13
      Caption = 'S'
    end
    object Label19: TLabel
      Left = 288
      Top = 21
      Width = 6
      Height = 13
      Caption = 'T'
    end
    object Edit11: TEdit
      Left = 48
      Top = 40
      Width = 45
      Height = 21
      TabOrder = 0
      Text = '-60'
    end
    object Edit12: TEdit
      Left = 48
      Top = 67
      Width = 45
      Height = 21
      TabOrder = 1
      Text = '1,2'
    end
    object Edit13: TEdit
      Left = 48
      Top = 94
      Width = 45
      Height = 21
      TabOrder = 2
      Text = '0,25'
    end
    object Edit14: TEdit
      Left = 99
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '-15,0'
    end
    object Edit15: TEdit
      Left = 99
      Top = 67
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '-5,0'
    end
    object Edit16: TEdit
      Left = 99
      Top = 94
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '0,1'
    end
    object Edit17: TEdit
      Left = 154
      Top = 40
      Width = 47
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object Edit18: TEdit
      Left = 154
      Top = 67
      Width = 47
      Height = 21
      TabOrder = 7
      Text = '30,0'
    end
    object Edit19: TEdit
      Left = 154
      Top = 94
      Width = 47
      Height = 21
      TabOrder = 8
      Text = '0,1'
    end
    object Edit20: TEdit
      Left = 207
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 9
      Text = '15,0'
    end
    object Edit21: TEdit
      Left = 207
      Top = 67
      Width = 50
      Height = 21
      TabOrder = 10
      Text = '-7,5'
    end
    object Edit22: TEdit
      Left = 207
      Top = 94
      Width = 50
      Height = 21
      TabOrder = 11
      Text = '0,1'
    end
    object Edit23: TEdit
      Left = 263
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 12
      Text = '90'
    end
    object Edit24: TEdit
      Left = 263
      Top = 67
      Width = 50
      Height = 21
      TabOrder = 13
      Text = '0,75'
    end
    object Edit25: TEdit
      Left = 263
      Top = 94
      Width = 50
      Height = 21
      TabOrder = 14
      Text = '0,4'
    end
  end
  object RadioButton1: TRadioButton
    Left = 77
    Top = 582
    Width = 61
    Height = 17
    Caption = 'Normal'
    Checked = True
    TabOrder = 10
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 140
    Top = 582
    Width = 181
    Height = 17
    Caption = 'Premature Ventricular Contraction'
    TabOrder = 11
  end
end
