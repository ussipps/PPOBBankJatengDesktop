unit uPosting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,System.StrUtils,
  IdIPWatch;

type
  TfPosting = class(TForm)
    Panel1: TPanel;
    PanelJudul: TPanel;
    Panel2: TPanel;
    sgTransaksi: TStringGrid;
    btnRefresh: TButton;
    btnReposting: TButton;
    IdHTTP1: TIdHTTP;
    http: TNetHTTPClient;
    IdIPWatch1: TIdIPWatch;
    procedure FormShow(Sender: TObject);
    procedure sgTransaksiDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnRepostingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPosting: TfPosting;

implementation

{$R *.dfm}

uses
   uLkJSON,uMyGlobalVariabel;

procedure TfPosting.btnRefreshClick(Sender: TObject);
var
   js,jr:TlkJSONobject;
   ja:TlkJSONlist;
   lParamList,mem: TStringStream;
   cUrl,s,a,cRespon:String;
   i,j:integer;
begin
   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONlist.Create();
   mem:=TStringStream.Create();

   sgTransaksi.RowHeights[0] := 25;

   sgTransaksi.Cells[0,0] := ' No Reff';
   sgTransaksi.Cells[1,0] := ' Tgl Trans';
   sgTransaksi.Cells[2,0] := ' NOP';
   sgTransaksi.Cells[3,0] := ' Tahun';
   sgTransaksi.Cells[4,0] := ' Nama';
   sgTransaksi.Cells[5,0] := ' Kelurahan';
   sgTransaksi.Cells[6,0] := ' Kecamatan';
   sgTransaksi.Cells[7,0] := ' Kabupaten';
   sgTransaksi.Cells[8,0] := ' Provinsi';
   sgTransaksi.Cells[9,0] := ' Pokok';
   sgTransaksi.Cells[10,0] := ' Denda';
   sgTransaksi.Cells[11,0] := ' Total Tagihan';
   sgTransaksi.Cells[12,0] := ' Admin';
   sgTransaksi.Cells[13,0] := ' Total';
   sgTransaksi.Cells[14,0] := ' Status CBS';
   sgTransaksi.Cells[15,0] := ' Status Biller';
   sgTransaksi.Cells[16,0] := ' Log ID';
   sgTransaksi.Cells[17,0] := ' Kuitansi ID';

   cUrl:=MyGlobalVariabel.ApplicationUrl+'/Reposting/PBBInquiryReposting';

   js.Add('user_id',MyGlobalVariabel.ApplicationUserID);
   js.Add('kode_kantor',MyGlobalVariabel.ApplicationUnitKerja);
   js.Add('tgl_trans',FormatDateTime('yyyy-mm-dd',now));
   s := TlkJSON.GenerateText(js);
   lParamList:=TStringStream.Create(s);

   try
      IdHTTP1.Post(cUrl,lParamList,mem);
   except
      Showmessage('Gagal Proses Reposting');
      exit;
   end;

   a:=mem.DataString;
   jr:=TlkJSON.Parsetext(a) as TlkJSONobject;
   cRespon := jr.Field['response_code'].Value;
   if cRespon='00' then begin
      ja := jr.Field['response_data'] as TlkJSONlist;
      sgTransaksi.RowCount:=(TlkJSONlist(ja).Count)+1;
      j:=0;
      for i:=0 to ja.Count-1 do
      begin
         j:=j+1;
         //ja.Child[i].Field['product_code'].Value;
         sgTransaksi.Cells[0, j] := ja.Child[i].Field['noreff'].Value;
         sgTransaksi.Cells[1, j] := ja.Child[i].Field['tgl_trans'].Value;
         sgTransaksi.Cells[2, j] := ' '+ja.Child[i].Field['nop'].Value;
         sgTransaksi.Cells[3, j] := ja.Child[i].Field['tahun'].Value;
         sgTransaksi.Cells[4, j] := ' '+ja.Child[i].Field['nama'].Value;
         sgTransaksi.Cells[5, j] := ' '+ja.Child[i].Field['kelurahan'].Value;
         sgTransaksi.Cells[6, j] := ' '+ja.Child[i].Field['kecamatan'].Value;
         sgTransaksi.Cells[7, j] := ' '+ja.Child[i].Field['kabupaten'].Value;
         sgTransaksi.Cells[8, j] := ' '+ja.Child[i].Field['provinsi'].Value;
         sgTransaksi.Cells[9, j] := FormatFloat('###,###',StrToFloat(ja.Child[i].Field['pokok'].Value))+' ';
         sgTransaksi.Cells[10, j] := FormatFloat('###,###',StrToFloat(ja.Child[i].Field['denda'].Value))+' ';
         sgTransaksi.Cells[11, j] := FormatFloat('###,###',StrToFloat(ja.Child[i].Field['total'].Value))+' ';
         sgTransaksi.Cells[12, j] := FormatFloat('###,###',StrToFloat(ja.Child[i].Field['admin'].Value))+' ';
         sgTransaksi.Cells[13, j] := FormatFloat('###,###',StrToFloat(ja.Child[i].Field['shouldPay'].Value))+' ';
         sgTransaksi.Cells[14, j] := ja.Child[i].Field['cbs_status'].Value;
         sgTransaksi.Cells[15, j] := ja.Child[i].Field['biller_status'].Value;
         sgTransaksi.Cells[16, j] := ja.Child[i].Field['log_id'].Value;
         sgTransaksi.Cells[17, j] := ja.Child[i].Field['Kuitansi_id'].Value;
      end;
   end else begin
      if cRespon='02' then begin
         showmessage('Transaksi Tidak Ditemukan');
         exit;
      end else begin
         if cRespon='90' then begin
            showmessage('Connection Refused');
            exit;
         end;
      end;
   end;

end;

procedure TfPosting.btnRepostingClick(Sender: TObject);
var
   mem : TStringStream;
   cURL: String;
   js,Jr:TlkJSONobject;
   ja : TlkJSONObject;
   i:integer;
begin
   {mem:=TStringStream.Create;
   cUrl:=MyGlobalVariabel.ApplicationUrl+'/Posting/PBBPostingPayment';
   i:=sgTransaksi.Row;
   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONObject.Create();

   js.Add('user_id',MyGlobalVariabel.ApplicationUserID);
   js.Add('kode_kantor',MyGlobalVariabel.ApplicationUnitKerja);
   js.Add('pokok',AnsiReplaceStr(sgTransaksi.Cells[9,i]),'.','');
   js.Add('denda',AnsiReplaceStr(sgTransaksi.Cells[10,i]),'.','');
   js.Add('admin',AnsiReplaceStr(sgTransaksi.Cells[12,i]),'.','');
   js.Add('total',AnsiReplaceStr(sgTransaksi.Cells[11,i]),'.','');
   js.Add('tgl_trans',sgTransaksi.Cells[1,i]);
   js.Add('shouldPay',AnsiReplaceStr(sgTransaksi.Cells[13,i]),'.','');
   js.Add('ip_add',IdIPWatch1.LocalIP);
   js.Add('keterangan','Reposting pembayaran PBB dengan NOP : '+sgTransaksi.Cells[2,i]+'');
   js.Add('log_id',sgTransaksi.Cells[16,i]);}


end;

procedure TfPosting.FormShow(Sender: TObject);
begin
   sgTransaksi.RowHeights[0] := 25;

   sgTransaksi.Cells[0,0] := ' No Reff';
   sgTransaksi.Cells[1,0] := ' Tgl Trans';
   sgTransaksi.Cells[2,0] := ' NOP';
   sgTransaksi.Cells[3,0] := ' Tahun';
   sgTransaksi.Cells[4,0] := ' Nama';
   sgTransaksi.Cells[5,0] := ' Kelurahan';
   sgTransaksi.Cells[6,0] := ' Kecamatan';
   sgTransaksi.Cells[7,0] := ' Kabupaten';
   sgTransaksi.Cells[8,0] := ' Provinsi';
   sgTransaksi.Cells[9,0] := ' Pokok';
   sgTransaksi.Cells[10,0] := ' Denda';
   sgTransaksi.Cells[11,0] := ' Total Tagihan';
   sgTransaksi.Cells[12,0] := ' Admin';
   sgTransaksi.Cells[13,0] := ' Status CBS';
   sgTransaksi.Cells[14,0] := ' Status Biller';

   sgTransaksi.ColWidths[0] := 100;
   sgTransaksi.ColWidths[1] := 75;
   sgTransaksi.ColWidths[2] := 150;
   sgTransaksi.ColWidths[3] := 50;
   sgTransaksi.ColWidths[4] := 200;
   sgTransaksi.ColWidths[5] := 150;
   sgTransaksi.ColWidths[6] := 150;
   sgTransaksi.ColWidths[7] := 150;
   sgTransaksi.ColWidths[8] := 150;
   sgTransaksi.ColWidths[9] := 75;
   sgTransaksi.ColWidths[10] := 75;
   sgTransaksi.ColWidths[11] := 100;
   sgTransaksi.ColWidths[12] := 75;
   sgTransaksi.ColWidths[13] := 100;
   sgTransaksi.ColWidths[14] := 100;

end;

procedure TfPosting.sgTransaksiDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: string;
  SavedAlign: word;
begin
   if ARow=0 then
   begin
      sgTransaksi.Canvas.Brush.Color := $00F99834;
      sgTransaksi.Canvas.Font.Color := clWhite;
   end else begin
      if gdSelected in State then begin
         sgTransaksi.Canvas.Brush.Color := $00FFEFD4;
      end else begin
         if ARow mod 2 = 0 then
            sgTransaksi.Canvas.Brush.Color := $00ECF7FF
         else
            sgTransaksi.Canvas.Brush.Color := clWhite;//$00DBDBDB;
      end;

      sgTransaksi.Canvas.Font.Color := clBlack;
   end;

   sgTransaksi.Canvas.Font.Size:=10;
   sgTransaksi.Canvas.FillRect(Rect);

   if (ACol >8 ) and (ARow > 0) and (ACol <13 ) then begin
      S := sgTransaksi.Cells[ACol, ARow]; // cell contents
      SavedAlign := SetTextAlign(sgTransaksi.Canvas.Handle, TA_RIGHT);
      sgTransaksi.Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, S);
      SetTextAlign(sgTransaksi.Canvas.Handle, SavedAlign);
   end else
   if (ACol= 0) or (ACol= 1) or (ACol= 3) or (ACol= 13) or (ACol= 14) then begin  // ACol is zero based
      S := sgTransaksi.Cells[ACol, ARow]; // cell contents
      SavedAlign := SetTextAlign(sgTransaksi.Canvas.Handle, TA_CENTER);
      if Arow = 0 then
         sgTransaksi.Canvas.TextRect(Rect,Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 3, S)
      else
         sgTransaksi.Canvas.TextRect(Rect,Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 1, S);
      SetTextAlign(sgTransaksi.Canvas.Handle, SavedAlign);
   end else
      if ARow = 0 then begin
         S := sgTransaksi.Cells[ACol, ARow]; // cell contents
         SavedAlign := SetTextAlign(sgTransaksi.Canvas.Handle, TA_CENTER);
         sgTransaksi.Canvas.TextRect(Rect,Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 3, S);
         SetTextAlign(sgTransaksi.Canvas.Handle, SavedAlign);
      end else
         sgTransaksi.Canvas.TextRect(Rect, Rect.Left, Rect.Top + 1,sgTransaksi.Cells[ACol,ARow]);

end;

end.
