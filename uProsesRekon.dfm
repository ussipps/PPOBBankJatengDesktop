object fProsesRekon: TfProsesRekon
  Left = 0
  Top = 0
  Caption = 'fProsesRekon'
  ClientHeight = 564
  ClientWidth = 776
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
  object PanelUtama: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 564
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnResize = PanelUtamaResize
    object PanelJudul: TPanel
      Left = 0
      Top = 0
      Width = 776
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Proses Rekon'
      Color = 5918719
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object GroupPBB: TGroupBox
      Left = 9
      Top = 370
      Width = 752
      Height = 154
      Caption = 'Proses Rekon PBB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object PBBGauge: TGauge
        Left = 24
        Top = 32
        Width = 100
        Height = 100
        BorderStyle = bsNone
        ForeColor = 16756834
        Kind = gkPie
        Progress = 0
      end
      object Label6: TLabel
        Left = 152
        Top = 39
        Width = 91
        Height = 16
        Caption = 'Periode Rekon :'
      end
      object RzLine1: TRzLine
        Left = 143
        Top = 55
        Width = 223
        Height = 20
        LineSlope = lsUp
      end
      object Label3: TLabel
        Left = 375
        Top = 39
        Width = 75
        Height = 16
        Caption = 'Information :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnProsesPBB: TButton
        Left = 152
        Top = 72
        Width = 95
        Height = 41
        Caption = 'Proses'
        TabOrder = 0
        OnClick = btnProsesPBBClick
      end
      object TanggalProsesPBB: TDateTimePicker
        Left = 252
        Top = 34
        Width = 105
        Height = 24
        Date = 44225.000000000000000000
        Time = 0.926829155090672400
        TabOrder = 1
      end
      object btnKirimPBB: TButton
        Left = 262
        Top = 72
        Width = 95
        Height = 41
        Caption = 'Kirim'
        Enabled = False
        TabOrder = 2
        OnClick = btnKirimPBBClick
      end
      object MemoPBB: TMemo
        Left = 461
        Top = 21
        Width = 347
        Height = 122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GroupSamsat: TGroupBox
      Left = 9
      Top = 50
      Width = 752
      Height = 154
      Caption = 'Proses Rekon Samsat'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object Gauge1: TGauge
        Left = 24
        Top = 32
        Width = 100
        Height = 100
        BorderStyle = bsNone
        Color = clWhite
        ForeColor = 16756834
        Kind = gkPie
        ParentColor = False
        Progress = 0
      end
      object Label2: TLabel
        Left = 152
        Top = 38
        Width = 91
        Height = 16
        Caption = 'Periode Rekon :'
      end
      object RzLine3: TRzLine
        Left = 143
        Top = 56
        Width = 223
        Height = 20
        LineSlope = lsUp
      end
      object Label5: TLabel
        Left = 375
        Top = 39
        Width = 75
        Height = 16
        Caption = 'Information :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TanggalProsesSamsat: TDateTimePicker
        Left = 252
        Top = 35
        Width = 105
        Height = 24
        Date = 44225.000000000000000000
        Time = 0.926829155090672400
        TabOrder = 0
      end
      object Button3: TButton
        Left = 152
        Top = 73
        Width = 95
        Height = 41
        Caption = 'Proses'
        TabOrder = 1
        OnClick = btnProsesSamsatClick
      end
      object Button4: TButton
        Left = 262
        Top = 73
        Width = 95
        Height = 41
        Caption = 'Kirim'
        TabOrder = 2
        OnClick = btnProsesSamsatClick
      end
      object Memo2: TMemo
        Left = 461
        Top = 19
        Width = 347
        Height = 122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GroupEtax: TGroupBox
      Left = 9
      Top = 210
      Width = 752
      Height = 154
      Caption = 'Proses Rekon E-Tax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Gauge2: TGauge
        Left = 24
        Top = 32
        Width = 100
        Height = 100
        BorderStyle = bsNone
        ForeColor = 16756834
        Kind = gkPie
        Progress = 0
      end
      object Label1: TLabel
        Left = 152
        Top = 37
        Width = 91
        Height = 16
        Caption = 'Periode Rekon :'
      end
      object RzLine2: TRzLine
        Left = 143
        Top = 55
        Width = 223
        Height = 20
        LineSlope = lsUp
      end
      object Label4: TLabel
        Left = 375
        Top = 37
        Width = 75
        Height = 16
        Caption = 'Information :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TanggalProsesETax: TDateTimePicker
        Left = 252
        Top = 35
        Width = 105
        Height = 24
        Date = 44225.000000000000000000
        Time = 0.926829155090672400
        TabOrder = 0
      end
      object Button1: TButton
        Left = 152
        Top = 72
        Width = 95
        Height = 41
        Caption = 'Proses'
        TabOrder = 1
        OnClick = btnProsesETaxClick
      end
      object Button2: TButton
        Left = 262
        Top = 72
        Width = 95
        Height = 41
        Caption = 'Kirim'
        TabOrder = 2
        OnClick = btnProsesETaxClick
      end
      object Memo1: TMemo
        Left = 461
        Top = 19
        Width = 347
        Height = 122
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object http: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 544
    Top = 72
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    RedirectMaximum = 3
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 581
    Top = 72
  end
  object clSFtp1: TclSFtp
    TimeOut = 120000
    SshAgent = 'Clever_Internet_Suite'
    Left = 617
    Top = 74
  end
end
