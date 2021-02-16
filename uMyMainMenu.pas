unit uMyMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, RzPanel,frxClass, Vcl.Imaging.pngimage;

type
  TfMyMainMenu = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    RzPanel2: TRzPanel;
    Image3: TImage;
    PanelMenu: TRzPanel;
    BtnHome: TRzPanel;
    BtnModul: TRzPanel;
    BtnProses: TRzPanel;
    BtnSetting: TRzPanel;
    btnAbout: TRzPanel;
    Memo1: TMemo;
    RzPanel8: TRzPanel;
    RzPanel9: TRzPanel;
    frxReport1: TfrxReport;
    PanelTengah: TPanel;
    PanelListMenu: TPanel;
    PanelModul: TPanel;
    PanelPBB: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    PanelSamsat: TPanel;
    Image4: TImage;
    Label5: TLabel;
    Label6: TLabel;
    PanelETax: TPanel;
    Image5: TImage;
    Label7: TLabel;
    Label8: TLabel;
    PanelListProses: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image6: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Panel4: TPanel;
    Image7: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Panel5: TPanel;
    Image8: TImage;
    Label13: TLabel;
    Label14: TLabel;
    btnPosting: TRzPanel;
    procedure RzPanel2Resize(Sender: TObject);
    procedure RzPanel8Click(Sender: TObject);
    procedure BtnHomeMouseEnter(Sender: TObject);
    procedure BtnHomeMouseLeave(Sender: TObject);
    procedure BtnModulMouseEnter(Sender: TObject);
    procedure BtnModulMouseLeave(Sender: TObject);
    procedure BtnProsesMouseEnter(Sender: TObject);
    procedure BtnProsesMouseLeave(Sender: TObject);
    procedure BtnSettingMouseEnter(Sender: TObject);
    procedure BtnSettingMouseLeave(Sender: TObject);
    procedure btnAboutMouseEnter(Sender: TObject);
    procedure btnAboutMouseLeave(Sender: TObject);
    procedure BtnModulClick(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure PanelListMenuMouseLeave(Sender: TObject);
    procedure PanelListProsesMouseLeave(Sender: TObject);
    procedure PanelPBBClick(Sender: TObject);
    procedure BtnProsesClick(Sender: TObject);
    procedure PanelETaxClick(Sender: TObject);
    procedure PanelSamsatClick(Sender: TObject);
    procedure BtnSettingClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnPostingMouseEnter(Sender: TObject);
    procedure btnPostingMouseLeave(Sender: TObject);
    procedure btnPostingClick(Sender: TObject);
  private
    { Private declarations }
    procedure MakeRounded(Control: TWinControl;nAdi:integer);
  public
    { Public declarations }
  end;

var
  fMyMainMenu: TfMyMainMenu;
  cData:String;
  nFlagSamsat:Integer;

implementation

{$R *.dfm}

uses
   uSamsat,uPbb,uProsesRekon,uKonfigurasi,uMyGlobalVariabel,uAbout,uPosting;

//pengaturan event mouse
procedure TfMyMainMenu.BtnModulMouseEnter(Sender: TObject);
begin
   BtnModul.Color:=$00FFB062;
   BtnModul.Font.Color:=clWhite;

   PanelListMenu.width:=rzpanel2.Width;
   PanelListMenu.Height:=100;
   PanelListMenu.Top:=RzPanel2.Top+RzPanel2.Height;

   PanelListProses.Height:=0;

   PanelModul.Height:=80;
   PanelModul.Top:=10;
   PanelModul.Width:=PanelListMenu.Width-400;
   PanelModul.Left:=200;

   PanelSamsat.Width:=Round(PanelModul.Width/3);
   PanelETax.Width:=Round(PanelModul.Width/3);
   PanelPBB.Width:=Round(PanelModul.Width/3);
end;

procedure TfMyMainMenu.BtnModulMouseLeave(Sender: TObject);
begin
   BtnModul.Color:=clWhite;
   BtnModul.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.BtnProsesClick(Sender: TObject);
var
   aForm:TfProsesRekon;
begin
   if (trim(MyGlobalVariabel.ApplicationUserName)<>'USSI') and (trim(MyGlobalVariabel.ApplicationUserName)<>'SUPEREDP') then begin
      showmessage('Maaf anda tidak punya wewenang menggunakan menu ini');
      exit;
   end;

   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfProsesRekon.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;
end;

procedure TfMyMainMenu.BtnSettingClick(Sender: TObject);
var
   aForm:TfKonfigurasi;
begin
   if (trim(MyGlobalVariabel.ApplicationUserName)<>'USSI') and (trim(MyGlobalVariabel.ApplicationUserName)<>'SUPEREDP') then begin
      showmessage('Maaf anda tidak punya wewenang menggunakan menu ini');
      exit;
   end;

   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfKonfigurasi.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;
end;

procedure TfMyMainMenu.btnAboutClick(Sender: TObject);
var
   aForm:TfAbout;
begin
   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfAbout.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;

end;

procedure TfMyMainMenu.BtnProsesMouseEnter(Sender: TObject);
begin
   BtnProses.Color:=$00FFB062;
   BtnProses.Font.Color:=clWhite;

   PanelListProses.width:=rzpanel2.Width;
   PanelListProses.Height:=100;
   PanelListProses.Top:=RzPanel2.Top+RzPanel2.Height;

   PanelListMenu.Height:=0;

   Panel2.Height:=80;
   Panel2.Top:=10;
   Panel2.Width:=PanelListMenu.Width-400;
   Panel2.Left:=200;

   Panel3.Width:=Round(PanelModul.Width/3);
   Panel4.Width:=Round(PanelModul.Width/3);
   Panel5.Width:=Round(PanelModul.Width/3);
end;

procedure TfMyMainMenu.BtnProsesMouseLeave(Sender: TObject);
begin
   BtnProses.Color:=clWhite;
   BtnProses.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.BtnHomeMouseEnter(Sender: TObject);
begin
   BtnHome.Color:=$00FFB062;
   BtnHome.Font.Color:=clWhite;
   PanelListMenu.Height:=0;
end;

procedure TfMyMainMenu.BtnHomeMouseLeave(Sender: TObject);
begin
   BtnHome.Color:=clWhite;
   BtnHome.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.BtnSettingMouseEnter(Sender: TObject);
begin
   BtnSetting.Color:=$00FFB062;
   BtnSetting.Font.Color:=clWhite;
end;

procedure TfMyMainMenu.BtnSettingMouseLeave(Sender: TObject);
begin
   BtnSetting.Color:=clWhite;
   BtnSetting.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.btnAboutMouseEnter(Sender: TObject);
begin
   btnAbout.Color:=$00FFB062;
   btnAbout.Font.Color:=clWhite;
end;

procedure TfMyMainMenu.btnAboutMouseLeave(Sender: TObject);
begin
   btnAbout.Color:=clWhite;
   btnAbout.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.btnPostingMouseEnter(Sender: TObject);
begin
   btnPosting.Color:=$00FFB062;
   btnPosting.Font.Color:=clWhite;
end;

procedure TfMyMainMenu.btnPostingMouseLeave(Sender: TObject);
begin
   btnPosting.Color:=clWhite;
   btnPosting.Font.Color:=clGrayText;
end;

procedure TfMyMainMenu.PanelListMenuMouseLeave(Sender: TObject);
var
  Panel : TPanel;
  P : TPoint;
begin
   Panel := Sender as TPanel;
   P := Panel.ScreenToClient(Mouse.CursorPos);
   if (not PtInRect(Panel.ClientRect, P)) then
   PanelListMenu.Height:=0;
   nFlagSamsat:=1;
end;

procedure TfMyMainMenu.PanelListProsesMouseLeave(Sender: TObject);
var
  Panel : TPanel;
  P : TPoint;
begin
   Panel := Sender as TPanel;
   P := Panel.ScreenToClient(Mouse.CursorPos);
   if (not PtInRect(Panel.ClientRect, P)) then
   PanelListProses.Height:=0;
   nFlagSamsat:=1;
end;

//==============================================================================


procedure TfMyMainMenu.PanelPBBClick(Sender: TObject);
var
   aForm:TfPbb;
begin
   PanelListMenu.Height:=0;
   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfPbb.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;
end;

procedure TfMyMainMenu.PanelSamsatClick(Sender: TObject);
begin
   Showmessage('Maaf untuk sementara menu belum bisa digunakan...!!!');
   PanelListMenu.Height:=0;
end;

procedure TfMyMainMenu.PanelETaxClick(Sender: TObject);
begin
   Showmessage('Maaf untuk sementara menu belum bisa digunakan...!!!');
   PanelListMenu.Height:=0;
end;

procedure TfMyMainMenu.BtnHomeClick(Sender: TObject);
begin
   PanelTengah.Visible:=false;
   image1.Visible:=true;
end;

procedure TfMyMainMenu.BtnModulClick(Sender: TObject);
var
   aForm:TfSamsat;
begin
   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfSamsat.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;
end;

procedure TfMyMainMenu.btnPostingClick(Sender: TObject);
var
   aForm:TfPosting;
begin
   PanelTengah.Visible:=true;
   PanelTengah.Align:=alClient;
   image1.Visible:=false;

   if PanelTengah.ControlCount>0 then TForm(PanelTengah.Controls[0]).free;
   aForm:=TfPosting.Create(self);
   aForm.BorderStyle:=bsNone;
   aForm.Position:=poMainFormCenter;
   aForm.Parent:=PanelTengah;
   aForm.Align:=alClient;
   aForm.Show;
end;


procedure TfMyMainMenu.MakeRounded(Control: TWinControl;nAdi:integer);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, nAdi, nAdi);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r, - 4, - 4);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, rgn, True);
    Invalidate;
  end;
end;

procedure TfMyMainMenu.RzPanel2Resize(Sender: TObject);
begin
   MakeRounded(BtnHome,40);
   MakeRounded(BtnModul,40);
   MakeRounded(BtnProses,40);
   MakeRounded(BtnSetting,40);
   MakeRounded(BtnAbout,40);
   MakeRounded(btnPosting,40);
   MakeRounded(RzPanel8,40);
   PanelListMenu.Height:=0;
   PanelListProses.Height:=0;
   nFlagSamsat:=0;
end;

procedure TfMyMainMenu.RzPanel8Click(Sender: TObject);
begin
   //frxReport1.Variables['cData'] := '10';
   //frxReport1.ShowReport(true);
end;

end.
