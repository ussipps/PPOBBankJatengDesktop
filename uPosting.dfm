object fPosting: TfPosting
  Left = 0
  Top = 0
  ClientHeight = 523
  ClientWidth = 764
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
    Width = 764
    Height = 523
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 328
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object PanelJudul: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Posting Ulang Transaksi'
      Color = 5918719
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 8
    end
    object Panel2: TPanel
      Left = 0
      Top = 482
      Width = 764
      Height = 41
      Align = alBottom
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 456
      object btnRefresh: TButton
        Left = 7
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 0
        OnClick = btnRefreshClick
      end
      object btnReposting: TButton
        Left = 88
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Reposting'
        TabOrder = 1
        OnClick = btnRepostingClick
      end
    end
    object sgTransaksi: TStringGrid
      Left = 0
      Top = 41
      Width = 764
      Height = 441
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      ColCount = 15
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 2
      OnDrawCell = sgTransaksiDrawCell
      ExplicitHeight = 415
    end
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
    Left = 661
    Top = 8
  end
  object http: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 120000
    ResponseTimeout = 120000
    HandleRedirects = False
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 611
    Top = 8
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 563
    Top = 11
  end
end
