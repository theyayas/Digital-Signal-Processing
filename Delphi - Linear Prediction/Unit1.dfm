object Form1: TForm1
  Left = 244
  Top = 55
  Caption = 'Linear Prediction by Yasin'
  ClientHeight = 575
  ClientWidth = 897
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
  object Label8: TLabel
    Left = 22
    Top = 16
    Width = 244
    Height = 43
    Caption = 'Linear Prediction'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -35
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 222
    Top = 77
    Width = 53
    Height = 15
    Caption = 'Time Lag'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 665
    Top = 139
    Width = 30
    Height = 15
    Caption = 'Error'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 186
    Top = 217
    Width = 33
    Height = 15
    Caption = 'Alpha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 217
    Width = 123
    Height = 15
    Caption = 'Auto Correlation value'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
  end
  object Chart1: TChart
    Left = 281
    Top = 16
    Width = 601
    Height = 206
    Legend.Alignment = laBottom
    Legend.CheckBoxes = True
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = 'Bell MT'
    Title.Text.Strings = (
      'Phonocardiogram')
    BottomAxis.Grid.Visible = False
    LeftAxis.Grid.Visible = False
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 15
    object Series1: TLineSeries
      SeriesColor = clTeal
      Title = 'PCG'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series4: TLineSeries
      SeriesColor = clMaroon
      Title = 'Error'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 114
    Height = 39
    Caption = 'Input'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Chart2: TChart
    Left = 281
    Top = 222
    Width = 601
    Height = 174
    Legend.Visible = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = 'Bell MT'
    Title.Text.Strings = (
      'Auto Correlation with Time Lag')
    BottomAxis.Grid.Visible = False
    LeftAxis.Grid.Visible = False
    View3D = False
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 15
    object Series2: TLineSeries
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
  object Button2: TButton
    Left = 8
    Top = 125
    Width = 130
    Height = 40
    Caption = 'Matrix Generator'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bell MT'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Chart3: TChart
    Left = 288
    Top = 396
    Width = 594
    Height = 172
    Legend.Visible = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = 'Bell MT'
    Title.Text.Strings = (
      'Linear Prediction')
    BottomAxis.Grid.Visible = False
    LeftAxis.Grid.Visible = False
    View3D = False
    TabOrder = 4
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series3: TLineSeries
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
  object ListBox1: TListBox
    Left = 8
    Top = 238
    Width = 130
    Height = 78
    ItemHeight = 13
    TabOrder = 5
  end
  object ListBox2: TListBox
    Left = 144
    Top = 238
    Width = 131
    Height = 78
    ItemHeight = 13
    TabOrder = 6
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 322
    Width = 267
    Height = 120
    FixedCols = 0
    FixedRows = 0
    TabOrder = 7
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 448
    Width = 267
    Height = 120
    FixedCols = 0
    FixedRows = 0
    TabOrder = 8
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Button3: TButton
    Left = 144
    Top = 125
    Width = 131
    Height = 40
    Caption = 'Predictor Coef. '
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 171
    Width = 130
    Height = 40
    Caption = 'Linear Prediction'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 144
    Top = 171
    Width = 131
    Height = 40
    Caption = 'Error'
    TabOrder = 11
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 128
    Top = 79
    Width = 91
    Height = 40
    Caption = 'Auto Correlation'
    TabOrder = 12
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 222
    Top = 97
    Width = 53
    Height = 21
    TabOrder = 13
    Text = '4'
  end
  object OpenDialog1: TOpenDialog
    Left = 9
    Top = 65
  end
end
