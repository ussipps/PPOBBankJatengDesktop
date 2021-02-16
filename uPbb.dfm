object fPbb: TfPbb
  Left = 0
  Top = 0
  Caption = 'fPbb'
  ClientHeight = 586
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 586
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 479
      Height = 584
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      OnResize = Panel2Resize
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 477
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Pembayaran PBB'
        Color = 5918719
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object PanelForm: TPanel
        Left = 17
        Top = 42
        Width = 445
        Height = 541
        Align = alClient
        Alignment = taRightJustify
        BevelOuter = bvNone
        UseDockManager = False
        TabOrder = 1
        object Label1: TLabel
          Left = 17
          Top = 17
          Width = 32
          Height = 19
          Alignment = taCenter
          Caption = 'NOP'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label2: TLabel
          Left = 109
          Top = 17
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label3: TLabel
          Left = 17
          Top = 106
          Width = 84
          Height = 19
          Caption = 'Information'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 109
          Top = 106
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 17
          Top = 376
          Width = 59
          Height = 19
          Caption = 'Tagihan'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 130
          Top = 374
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TotalTagihan: TLabel
          Left = 144
          Top = 376
          Width = 280
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 17
          Top = 398
          Width = 46
          Height = 19
          Caption = 'Admin'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 130
          Top = 396
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Admin: TLabel
          Left = 144
          Top = 398
          Width = 280
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label11: TLabel
          Left = 17
          Top = 419
          Width = 100
          Height = 19
          Caption = 'Total Tagihan'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 130
          Top = 417
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Tagihan: TLabel
          Left = 144
          Top = 419
          Width = 280
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 17
          Top = 49
          Width = 46
          Height = 19
          Caption = 'Tahun'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 109
          Top = 49
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label7: TLabel
          Left = 17
          Top = 444
          Width = 83
          Height = 19
          Caption = 'Total Bayar'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object Label10: TLabel
          Left = 130
          Top = 442
          Width = 4
          Height = 19
          Caption = ':'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6052956
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object BtnRequest: TButton
          Left = 350
          Top = 76
          Width = 75
          Height = 29
          Caption = 'Request'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BtnRequestClick
        end
        object NOP: TEdit
          Left = 124
          Top = 13
          Width = 301
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object MemoPbb: TMemo
          Left = 17
          Top = 131
          Width = 408
          Height = 234
          Enabled = False
          TabOrder = 3
        end
        object btnProses: TButton
          Left = 98
          Top = 487
          Width = 75
          Height = 29
          Caption = 'Proses'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnProsesClick
        end
        object btnPrint: TButton
          Left = 17
          Top = 487
          Width = 75
          Height = 29
          Caption = 'Print'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = btnPrintClick
        end
        object btnClear: TButton
          Left = 352
          Top = 487
          Width = 75
          Height = 29
          Caption = 'Clear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = btnClearClick
        end
        object Tahun: TEdit
          Left = 124
          Top = 45
          Width = 301
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
        end
        object TotalBayar: TRzNumericEdit
          Left = 240
          Top = 440
          Width = 185
          Height = 27
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Visible = False
          DisplayFormat = ',0;(,0)'
        end
      end
      object PanelKiri: TPanel
        Left = 1
        Top = 42
        Width = 16
        Height = 541
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
      object PanelKanan: TPanel
        Left = 462
        Top = 42
        Width = 16
        Height = 541
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
  end
  object http: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 120000
    ResponseTimeout = 120000
    HandleRedirects = False
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 323
    Top = 224
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 371
    Top = 211
  end
  object frxReport1: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44217.826464745400000000
    ReportOptions.LastChange = 44217.826464745400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 342
    Top = 344
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 75.000000000000000000
      PaperHeight = 160.000000000000000000
      PaperSize = 256
      LeftMargin = 7.500000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 167.519790000000000000
        Top = 18.897650000000000000
        Width = 251.338745000000000000
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cNamaLembaga]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cNamaKantor]')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Top = 37.574830000000000000
          Width = 245.669450000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cAlamatLembaga]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Top = 84.031540000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'STRUK PEMBAYARAN PBB')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 109.252010000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 156.283550000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Top = 114.047310000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd.mm.yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [Date]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 57.590600000000000000
          Top = 114.047310000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [Time]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 112.385900000000000000
          Top = 114.047310000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cNoKuitansi]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 112.385900000000000000
          Top = 132.944960000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cUserID] - [cUserName]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 362.834880000000000000
        Top = 245.669450000000000000
        Width = 251.338745000000000000
        RowCount = 1
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 34.015770000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tahun')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nama')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 71.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Kelurahan')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 90.606370000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Kecamatan')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 109.504020000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Kabupaten')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 128.401670000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Provinsi')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 168.299320000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pokok')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 187.196970000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Denda')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 206.094620000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Admin')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 15.118120000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 34.015770000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 52.913420000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 71.708720000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 90.606370000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 109.504020000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 128.401670000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 168.299320000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 187.196970000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 206.094620000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 15.118120000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cNOP]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 34.015770000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cTahun]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cNama]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 71.708720000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cKelurahan]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 90.606370000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cKecamatan]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 109.504020000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cKabupaten]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 128.401670000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[cProvinsi]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 168.299320000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rp. [cPokok]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 187.196970000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rp. [cDenda]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 206.094620000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rp. [cAdmin]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'NOP')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Top = 275.905690000000000000
          Width = 245.669450000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harap simpan tanda terima ini sebagai bukti pembayaran anda')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 79.181200000000000000
          Top = 226.771800000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 91.417440000000000000
          Top = 226.771800000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rp. [cTotal]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Top = 313.700990000000000000
          Width = 245.669450000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft PhagsPa'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '***************  Terima Kasih  ***************')
          ParentFont = False
        end
      end
    end
  end
end
