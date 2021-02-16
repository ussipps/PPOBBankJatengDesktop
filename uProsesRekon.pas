unit uProsesRekon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,DateUtils,
  Vcl.StdCtrls, Vcl.Samples.Gauges, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, clTcpClient, clTcpClientTls, clHttp,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.Imaging.jpeg, RzLine,IniFiles, IdExplicitTLSClientServerBase, IdFTP,
  clSFtp;

type
  TfProsesRekon = class(TForm)
    PanelUtama: TPanel;
    PanelJudul: TPanel;
    GroupPBB: TGroupBox;
    PBBGauge: TGauge;
    btnProsesPBB: TButton;
    TanggalProsesPBB: TDateTimePicker;
    http: TNetHTTPClient;
    IdHTTP1: TIdHTTP;
    GroupSamsat: TGroupBox;
    Gauge1: TGauge;
    GroupEtax: TGroupBox;
    Gauge2: TGauge;
    Label6: TLabel;
    RzLine1: TRzLine;
    btnKirimPBB: TButton;
    clSFtp1: TclSFtp;
    Label1: TLabel;
    TanggalProsesETax: TDateTimePicker;
    RzLine2: TRzLine;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    TanggalProsesSamsat: TDateTimePicker;
    RzLine3: TRzLine;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    MemoPBB: TMemo;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Memo2: TMemo;
    procedure btnProsesPBBClick(Sender: TObject);
    procedure PanelUtamaResize(Sender: TObject);
    procedure btnProsesSamsatClick(Sender: TObject);
    procedure btnProsesETaxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnKirimPBBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProsesRekon: TfProsesRekon;
  cSettingFolder,cAddress,cPort,cUsername,cPassword:String;
implementation

{$R *.dfm}

uses
   uLkJSON,uMyGlobalVariabel;

procedure TfProsesRekon.btnProsesPBBClick(Sender: TObject);
var
   js,jr:TlkJSONobject;
   ja:TlkJSONlist;
   cKodeKantor,cUserId,s,cUrl,cRespon,a,cTextTemp,cFileName,cFolderName:String;
   lParamList,mem: TStringStream;
   //mem:TStrings;
   i:integer;
   cText : TStringList;
   Ini: TIniFile;
begin
   MemoPBB.Clear;
   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONlist.Create();
   mem:=TStringStream.Create();
   cText:=TStringList.Create;
   PBBGauge.progress:=0;
   cFileName:='BA_SW06002_'+FormatDateTime('YYYYMMDD',TanggalProsesPBB.Date)+'.txt';
   cFolderName:=cSettingFolder+cFileName;
   MemoPBB.Lines.Add('Request...');
   cUrl:=MyGlobalVariabel.ApplicationUrl+'/Rekon/PBBGetRekon';

   js.Add('user_id',MyGlobalVariabel.ApplicationUserID);
   js.Add('kode_kantor',MyGlobalVariabel.ApplicationUnitKerja);
   js.Add('tgl_trans',FormatDateTime('yyyy-mm-dd',TanggalProsesPBB.Date));
   s := TlkJSON.GenerateText(js);
   lParamList:=TStringStream.Create(s);

   try
      IdHTTP1.Post(cUrl,lParamList,mem);
   except
      Showmessage('Gagal Proses Rekon ke Biller');
      exit;
   end;

   a:=mem.DataString;
   jr:=TlkJSON.Parsetext(a) as TlkJSONobject;
   cRespon := jr.Field['response_code'].Value;
   if cRespon='00' then begin
      ja := jr.Field['response_data'] as TlkJSONlist;
      PBBGauge.MaxValue:=TlkJSONlist(ja).Count;
      MemoPBB.Lines.Add('Found '+IntToStr(TlkJSONlist(ja).Count)+' Record ');
      for i:=0 to ja.Count-1 do
      begin
         ja.Child[i].Field['product_code'].Value;
         cTextTemp:=ja.Child[i].Field['product_code'].Value+'|'+
                    ja.Child[i].Field['nop'].Value+'|'+
                    ja.Child[i].Field['tahun_pajak'].Value+'|'+
                    ja.Child[i].Field['nama'].Value+'|'+
                    ja.Child[i].Field['kelurahan'].Value+'|'+
                    ja.Child[i].Field['kecamatan'].Value+'|'+
                    ja.Child[i].Field['kabupaten'].Value+'|'+
                    ja.Child[i].Field['provinsi'].Value+'|'+
                    ja.Child[i].Field['pokok'].Value+'|'+
                    ja.Child[i].Field['denda'].Value+'|'+
                    ja.Child[i].Field['total_tagihan_pajak'].Value+'|'+
                    ja.Child[i].Field['biaya_admin'].Value+'|'+
                    ja.Child[i].Field['total_bayar'].Value+'|'+
                    ja.Child[i].Field['tanggal_transaksi'].Value+'|'+
                    ja.Child[i].Field['jam_transaksi'].Value+'|'+
                    ja.Child[i].Field['switching'].Value+'|'+
                    ja.Child[i].Field['terminal'].Value+'|'+
                    ja.Child[i].Field['noreff'].Value+'|';
         cText.Add(cTextTemp);
         PBBGauge.Progress:=i;
      end;
      PBBGauge.Progress:=TlkJSONlist(ja).Count;
      MemoPBB.Lines.Add('Create File : '+cFolderName+' ');
      cText.SaveToFile(cFolderName);
      MemoPBB.Lines.Add('Sukses create file... ');
      cText.Free;
   end else begin
      if cRespon='02' then begin
         showmessage('Tidak ada data yang bisa di rekon');
         exit;
      end else begin
         if cRespon='90' then begin
            showmessage('Connection Refused');
            exit;
         end;
      end;
   end;
   btnKirimPBB.Enabled:=True;

   showmessage('Proses Selesai');
end;

procedure TfProsesRekon.btnProsesSamsatClick(Sender: TObject);
begin
   Showmessage('Maaf untuk sementara menu belum bisa digunakan...!!!');
end;

procedure TfProsesRekon.btnProsesETaxClick(Sender: TObject);
begin
   Showmessage('Maaf untuk sementara menu belum bisa digunakan...!!!');
end;

procedure TfProsesRekon.FormShow(Sender: TObject);
var
   cFileName:string;
   Ini: TIniFile;
begin
   cFileName:='iPast.ini';
   Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+cFileName);
   try
      begin
         cSettingFolder:=Ini.ReadString('SFTP','FolderFileKirim','');
         cAddress:=Ini.ReadString('SFTP','Address','');
         cPort:=Ini.ReadString('SFTP','Port','');
         cUsername:=Ini.ReadString('SFTP','Username','');
         cPassword:=Ini.ReadString('SFTP','Password','');
      end;
   finally
      Ini.Free;
   end;
   TanggalProsesPBB.Date:=DateOf(now);
   TanggalProsesETax.Date:=DateOf(now);
   TanggalProsesSamsat.Date:=DateOf(now);
end;

procedure TfProsesRekon.PanelUtamaResize(Sender: TObject);
begin
   GroupPBB.Width:=PanelUtama.Width-50;
   GroupPBB.Left:=25;
   GroupEtax.Width:=PanelUtama.Width-50;
   GroupETax.Left:=25;
   GroupSamsat.Width:=PanelUtama.Width-50;
   GroupSamsat.Left:=25;
end;

procedure TfProsesRekon.btnKirimPBBClick(Sender: TObject);
var
  cText : string;
  lReturn : boolean;
  position, fileExistsResult: Integer;
  stream: TStream;
  fileName,cFileName,cFolderName: string;
begin
  cFileName:='BA_SW06002_'+FormatDateTime('YYYYMMDD',TanggalProsesPBB.Date)+'.txt';
  cFolderName:=cSettingFolder+cFileName;

  clSFtp1.Server  :=cAddress;
  clSFtp1.Port    :=StrToInt(cPort);
  clSFtp1.UserName:=cUsername;
  clSFtp1.Password:=cPassword;
  MemoPBB.Lines.Add('Connecting To Server... ');
  clSFtp1.Open();
  MemoPBB.Lines.Add('Connected');
  position := 0;
  stream := TFileStream.Create(cFolderName, fmOpenRead);
  try
     fileName := ExtractFileName(cFolderName);
     if clSFtp1.FileExists(fileName) then
     begin
        position := clSFtp1.GetFileSize(fileName);
        if (stream.Size <= position) then
        begin
           position := 0;
        end;
     end;
     MemoPBB.Lines.Add('Send File....');
     clSFtp1.PutFile(stream, 'PBB/'+fileName, position, -1);
     MemoPBB.Lines.Add('File Sent');
     ShowMessage('Selesai');
  finally
     stream.Free();
  end;
  btnKirimPBB.Enabled:=False;
end;

end.
