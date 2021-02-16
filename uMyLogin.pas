unit uMyLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,system.math, frxClass,
  Vcl.Imaging.jpeg, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent,Vcl.WinXPickers,IniFiles;

type
  TfMyLogin = class(TForm)
    RzPanel1: TRzPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    UserName: TRzEdit;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    Password: TRzEdit;
    RzPanel6: TRzPanel;
    PanelLogin: TRzPanel;
    Label3: TLabel;
    RzPanel10: TRzPanel;
    ImClose: TImage;
    Image3: TImage;
    http: TNetHTTPClient;
    procedure RzPanel9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzPanel1Resize(Sender: TObject);
    procedure PanelLoginMouseEnter(Sender: TObject);
    procedure PanelLoginMouseLeave(Sender: TObject);
    procedure ImCloseClick(Sender: TObject);
    procedure PanelLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure MakeRounded(Control: TWinControl;nAdi:integer);
  public
    { Public declarations }
  end;

var
  fMyLogin: TfMyLogin;

implementation

{$R *.dfm}

uses
   uLKJSon,uMyGlobalVariabel;

procedure TfMyLogin.ImCloseClick(Sender: TObject);
begin
   ModalResult:=-1;
end;

procedure TfMyLogin.MakeRounded(Control: TWinControl;nAdi:integer);
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

procedure TfMyLogin.FormShow(Sender: TObject);
begin
   rzpanel1.Height:=450;
   rzpanel1.Width:=348;
end;

procedure TfMyLogin.RzPanel1Resize(Sender: TObject);
var
   nWidth,nHeight:integer;
begin
   MakeRounded(RzPanel1,30);
   MakeRounded(RzPanel2,30);
   MakeRounded(RzPanel3,30);
   MakeRounded(RzPanel4,30);
   MakeRounded(RzPanel5,30);
   MakeRounded(RzPanel6,30);
   MakeRounded(PanelLogin,30);
   nWidth:=Screen.Width;
   nHeight:=screen.Height;
   RzPanel1.Left:=ceil((nWidth-RzPanel1.Width)/2);
   RzPanel1.Top:=ceil((nHeight-RzPanel1.Top)/2)-100;

end;

procedure TfMyLogin.PanelLoginClick(Sender: TObject);
var
   js,jr:TlkJSONobject;
   ja:TlkJSONObject;
   cKodeKantor,cUserId,s,cUrl,cRespon,a,cSettingUrl,cUserAuth,cTerminal:String;
   lParamList,mem : TStringStream;
   cOldCursor : TCursor;
   cFileName:string;
   Ini: TIniFile;
begin
   cFileName:='iPast.ini';
   Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+cFileName);
   try
      cSettingUrl:=Ini.ReadString('Konfigurasi','URL','');
      cUserAuth:=Ini.ReadString('Konfigurasi','User','');
      cTerminal:=Ini.ReadString('Konfigurasi','Terminal','');
   finally
      Ini.Free;
   end;

   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONObject.Create();
   mem:=TStringStream.Create;

   cUrl:=cSettingUrl+'/Auth/LoginSystem';//'http://103.3.76.203:2001/Auth/LoginSystem';
   js.Add('username',trim(UserName.Text));
   js.Add('password',trim(Password.Text));
   s := TlkJSON.GenerateText(js);
   lParamList:=TStringStream.Create(s);
   try
      http.Post(cUrl,lParamList,mem);
   except
      Showmessage('Gagal Inquiry Login');
      exit;
   end;
   a:=mem.DataString;
   jr:=TlkJSON.Parsetext(a) as TlkJSONobject;
   cRespon := jr.Field['response_code'].Value;
   //Memo1.Lines.Text:=a;

   try
      ModalResult:=0;
      if cRespon='01' then begin
         raise Exception.Create('Maaf User/Password yang anda masukan Salah ');
      end;
      if cRespon='02' then begin
         raise Exception.Create('Login Gagal');
      end;

      if cRespon='00' then begin
         ja := jr.Field['response_data'] as TlkJSONObject;
         MyGlobalVariabel.ApplicationUnitKerja:=ja.Field['kode_kantor'].Value;
         MyGlobalVariabel.ApplicationUserName:=ja.Field['user_name'].Value;
         MyGlobalVariabel.ApplicationUserID:=ja.Field['user_id'].Value;
         MyGlobalVariabel.ApplicationNamaLengkap:=ja.Field['nama_lengkap'].Value;
         MyGlobalVariabel.ApplicationNamaLembaga:=ja.Field['nama_lembaga'].Value;
         MyGlobalVariabel.ApplicationNamaKantor:=ja.Field['nama_kantor'].Value;
         MyGlobalVariabel.ApplicationAlamatKantor:=ja.Field['alamat_kantor'].Value;
         MyGlobalVariabel.ApplicationUrl:=cSettingUrl;
         MyGlobalVariabel.ApplicationUserAuth:=cUserAuth;
         MyGlobalVariabel.ApplicationTerminalAuth:=cTerminal;
         ModalResult:=1;
      end;

   finally
      Screen.Cursor:=cOldCursor;
   end;

   ModalResult:=1;

end;

procedure TfMyLogin.PanelLoginMouseEnter(Sender: TObject);
begin
   PanelLogin.Color:=$0053A9FF;
end;

procedure TfMyLogin.PanelLoginMouseLeave(Sender: TObject);
begin
   PanelLogin.Color:=$00FFB062;
end;

procedure TfMyLogin.RzPanel9Click(Sender: TObject);
begin
   Close;
end;


end.
