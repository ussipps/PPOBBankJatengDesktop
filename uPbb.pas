unit uPbb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, IdBaseComponent,
  IdComponent, IdIPWatch, frxClass, MoneyEdit, Vcl.Mask, RzEdit;

type
  TfPbb = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelForm: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TotalTagihan: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Admin: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Tagihan: TLabel;
    BtnRequest: TButton;
    NOP: TEdit;
    MemoPbb: TMemo;
    btnProses: TButton;
    btnPrint: TButton;
    btnClear: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Tahun: TEdit;
    http: TNetHTTPClient;
    IdIPWatch1: TIdIPWatch;
    frxReport1: TfrxReport;
    PanelKiri: TPanel;
    PanelKanan: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    TotalBayar: TRzNumericEdit;
    procedure BtnRequestClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPbb: TfPbb;
  nTagihan,nAdmin:double;
  cKuitansi,cKuitansiID,cNama,cNOP,cTahun,cKelurahan,cKecamatan,cKabupaten,cPokok,
  cDenda,cTotal,cAdmin,cProvinsi,cNoReff,cTotalBayar:String;

implementation

{$R *.dfm}

uses
   uLkJSON,uMyMainMenu,uMyGlobalVariabel;

procedure TfPbb.btnPrintClick(Sender: TObject);
begin
   frxReport1.Script.Variables['cNamaLembaga']:=MyGlobalVariabel.ApplicationNamaLembaga;
   frxReport1.Script.Variables['cNamakantor']:=MyGlobalVariabel.ApplicationNamaKAntor;
   frxReport1.Script.Variables['cAlamatLembaga']:=MyGlobalVariabel.ApplicationAlamatKantor;
   frxReport1.Script.Variables['cNoKuitansi']:=cKuitansi;
   frxReport1.Script.Variables['cNOP']:=cNOP;
   frxReport1.Script.Variables['cTahun']:=cTahun;
   frxReport1.Script.Variables['cNama']:=cNama;
   frxReport1.Script.Variables['cKelurahan']:=cKelurahan;
   frxReport1.Script.Variables['cKecamatan']:=cKecamatan;
   frxReport1.Script.Variables['cKabupaten']:=cKabupaten;
   frxReport1.Script.Variables['cProvinsi']:=cProvinsi;
   frxReport1.Script.Variables['cPokok']:=cPokok;
   frxReport1.Script.Variables['cDenda']:=cDenda;
   frxReport1.Script.Variables['cAdmin']:=cAdmin;
   frxReport1.Script.Variables['cTotal']:=cTotalBayar;
   frxReport1.Script.Variables['cUserName']:=MyGlobalVariabel.ApplicationUserName;
   frxReport1.Script.Variables['cUserID']:=MyGlobalVariabel.ApplicationUserID;

   frxReport1.ShowReport();

end;

procedure TfPbb.btnProsesClick(Sender: TObject);
var
   lParamList,mem : TStringStream;
   cURL,s,a,cRespon:String;
   js,Jr:TlkJSONobject;
   ja : TlkJSONObject;
   LHTTP: TNetHTTPClient;
begin
   mem:=TStringStream.Create;
   cUrl:=MyGlobalVariabel.ApplicationUrl+'/Posting/PBBPostingPayment';

   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONObject.Create();

   js.Add('provinsi',cProvinsi);
   js.Add('tahun',cTahun);
   js.Add('kabupaten',cKabupaten);
   js.Add('nop',cNOP);
   js.Add('kelurahan',cKelurahan);
   js.Add('total',cTotal);
   js.Add('noreff',cNoReff);
   js.Add('nama',cNama);
   js.Add('pokok',cPokok);
   js.Add('kecamatan',cKecamatan);
   js.Add('action','P');
   js.Add('denda',cDenda);
   js.Add('terminal',MyGlobalVariabel.ApplicationTerminalAuth);//DSPBSOLO
   js.Add('user',MyGlobalVariabel.ApplicationUserAuth);//*BANKSOLO
   js.Add('kode_kantor',MyGlobalVariabel.ApplicationUnitKerja);
   js.Add('user_id',MyGlobalVariabel.ApplicationUserID);
   js.Add('ip_add',IdIPWatch1.LocalIP);
   js.Add('keterangan','Pembayaran PBB dengan NOP : '+cNOP+'');
   js.Add('kuitansi',cKuitansi);
   js.Add('kuitansi_id',cKuitansiID);
   js.Add('admin',cAdmin);
   js.Add('shouldPay',FloatToStr(TotalBayar.Value));

   s := TlkJSON.GenerateText(js);
   lParamList:=TStringStream.Create(s);
   try
      http.Post(cUrl,lParamList,mem);
   except
      Showmessage('Gagal Posting ke Biller');
      exit;
   end;

   a:=mem.DataString;
   jr:=TlkJSON.Parsetext(a) as TlkJSONobject;
   cRespon := jr.Field['response_code'].Value;
   //MemoPbb.Lines.Text:=a;
   nTagihan:=0;nAdmin:=0;
   if trim(cRespon)='00' then begin
      ja := jr.Field['response_data'] as TlkJSONobject;
      //cKuitansi:=ja.Field['kuitansi'].Value;
      //cKuitansiID:=ja.Field['kuitansi_id'].Value;
      MemoPbb.Clear;
      MemoPbb.Lines.Add('');
      MemoPbb.Lines.Add('Data Object Pajak :');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Nama           : '+ja.Field['nama'].Value+'');
      MemoPbb.Lines.Add('NOP             : '+ja.Field['nop'].Value+'');
      MemoPbb.Lines.Add('Tahun          : '+ja.Field['tahun'].Value+'');
      MemoPbb.Lines.Add('Kelurahan    : '+ja.Field['kelurahan'].Value+'');
      MemoPbb.Lines.Add('Kecamatan   : '+ja.Field['kecamatan'].Value+'');
      MemoPbb.Lines.Add('Kabupaten   : '+ja.Field['kabupaten'].Value+'');
      MemoPbb.Lines.Add('Provinsi        : '+ja.Field['provinsi'].Value+'');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Informasi Pembayaran :');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Pokok           : '+FormatFloat('###,##0',StrToFloat(ja.Field['pokok'].Value))+'');
      MemoPbb.Lines.Add('Denda          : '+FormatFloat('###,##0',StrToFloat(ja.Field['denda'].Value))+'');
      MemoPbb.Lines.Add('');
      MemoPbb.Lines.Add('******************          TRANSAKSI BERHASIL           ******************');
      Tagihan.Font.Color:=clGreen;
      btnProses.Enabled:=False;
      btnPrint.Enabled:=True;
   end else begin
      if trim(cRespon)='01' then begin
         MemoPbb.Clear;
         MemoPbb.Lines.Add('');
         MemoPbb.Lines.Add('FAILED POSTING PBB : NO REFERENSI TELAH DIGUNAKAN');
      end else begin
         if trim(cRespon)='02' then begin
            MemoPbb.Clear;
            MemoPbb.Lines.Add('');
            MemoPbb.Lines.Add('FAILED POSTING PBB : WILAYAH TSB TIDAK DAPAT DIPROSES OLEH MITRA');
         end else begin
            if trim(cRespon)='03' then begin
               MemoPbb.Clear;
               MemoPbb.Lines.Add('');
               MemoPbb.Lines.Add('FAILED POSTING PBB : PARAMETER DATA SALAH');
            end else begin
               if trim(cRespon)='04' then begin
                  MemoPbb.Clear;
                  MemoPbb.Lines.Add('');
                  MemoPbb.Lines.Add('FAILED POSTING PBB : NOP TIDAK DITEMUKAN');
               end else begin
                  if trim(cRespon)='05' then begin
                     MemoPbb.Clear;
                     MemoPbb.Lines.Add('');
                     MemoPbb.Lines.Add('FAILED POSTING PBB : TIDAK ADA TAHUN TAGIHAN PAJAK');
                  end else begin
                     if trim(cRespon)='06' then begin
                        MemoPbb.Clear;
                        MemoPbb.Lines.Add('');
                        MemoPbb.Lines.Add('FAILED POSTING PBB : TAHUN TAGIHAN PAJAK SUDAH DIBAYAR');
                     end else begin
                        if trim(cRespon)='07' then begin
                           MemoPbb.Clear;
                           MemoPbb.Lines.Add('');
                           MemoPbb.Lines.Add('FAILED POSTING PBB : SALDO REKENING TIDAK CUKUP');
                        end else begin
                           if trim(cRespon)='12' then begin
                              MemoPbb.Clear;
                              MemoPbb.Lines.Add('');
                              MemoPbb.Lines.Add('TRANSAKSI GAGAL,NO REKENING/AKUN COA DEPOSIT BELUM TERDEFINISI');
                           end else begin
                              if trim(cRespon)='13' then begin
                                 MemoPbb.Clear;
                                 MemoPbb.Lines.Add('');
                                 MemoPbb.Lines.Add('TRANSAKSI GAGAL,SETTING METODE TRANSAKSI BELUM TERDEFINISI');
                              end else begin
                                 if trim(cRespon)='14' then begin
                                    MemoPbb.Clear;
                                    MemoPbb.Lines.Add('');
                                    MemoPbb.Lines.Add('TRANSAKSI GAGAL,KODE INTEGRASI NO REKENING DEPOSIT BELUM TERDEFINISI');
                                 end else begin
                                 if trim(cRespon)='14' then begin
                                    MemoPbb.Clear;
                                    MemoPbb.Lines.Add('');
                                    MemoPbb.Lines.Add('TRANSAKSI GAGAL,KODE INTEGRASI NO REKENING DEPOSIT BELUM TERDEFINISI');
                                 end;
                                    if trim(cRespon)='15' then begin
                                       MemoPbb.Clear;
                                       MemoPbb.Lines.Add('');
                                       MemoPbb.Lines.Add('TRANSAKSI GAGAL,JUMLAH SEHARUSNYA BAYAR LEBIH KECIL DARI TOTAL BAYAR');
                                    end else begin
                                       if trim(cRespon)='16' then begin
                                          MemoPbb.Clear;
                                          MemoPbb.Lines.Add('');
                                          MemoPbb.Lines.Add('FAILED POSTING PBB : KUITANSI 117319910006 DUPLICATED!');
                                       end else begin
                                          if trim(cRespon)='17' then begin
                                             MemoPbb.Clear;
                                             MemoPbb.Lines.Add('');
                                             MemoPbb.Lines.Add('FAILED POSTING PBB : KODE PERK KAS TIDAK TERDEFINISI');
                                          end else begin
                                             if trim(cRespon)='18' then begin
                                                MemoPbb.Clear;
                                                MemoPbb.Lines.Add('');
                                                MemoPbb.Lines.Add('FAILED POSTING PBB : KODE PERK KAS TIDAK DITEMUKAN');
                                             end else begin
                                                if trim(cRespon)='19' then begin
                                                   MemoPbb.Clear;
                                                   MemoPbb.Lines.Add('');
                                                   MemoPbb.Lines.Add('FAILED POSTING PBB : GAGAL GENERATE TRANS ID! SILAHKAN COBA LAGI');
                                                end else begin
                                                   if trim(cRespon)='20' then begin
                                                      MemoPbb.Clear;
                                                      MemoPbb.Lines.Add('');
                                                      MemoPbb.Lines.Add('FAILED POSTING PBB : SALDO DEPOSIT AKUN TIDAK MENCUKUPI');
                                                   end else begin
                                                      if trim(cRespon)='88' then begin
                                                         MemoPbb.Clear;
                                                         MemoPbb.Lines.Add('');
                                                         MemoPbb.Lines.Add('FAILED POSTING PBB : TRANSAKSI PAYMENT GAGAL , HARAP CEK MUTASI TRANSAKSI ATAU POSTING ULANG');
                                                      end else begin
                                                         if trim(cRespon)='90' then begin
                                                            MemoPbb.Clear;
                                                            MemoPbb.Lines.Add('');
                                                            MemoPbb.Lines.Add('FAILED POSTING PBB : CONNECTION REFUSED');
                                                         end else begin
                                                            if trim(cRespon)='99' then begin
                                                               MemoPbb.Clear;
                                                               MemoPbb.Lines.Add('');
                                                               MemoPbb.Lines.Add('FAILED POSTING PBB : ERROR INTERNAL BANK');
                                                            end;
                                                         end;
                                                      end;
                                                   end;
                                                end;
                                             end;
                                          end;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;

end;

procedure TfPbb.BtnRequestClick(Sender: TObject);
var
   lParamList,mem : TStringStream;
   cURL,s,a,cRespon:String;
   js,Jr:TlkJSONobject;
   ja : TlkJSONObject;
   LHTTP: TNetHTTPClient;
begin
   //inisialisasi
   cKuitansi:='';cKuitansiID:='';cNama:='';cNOP:='';cTahun:='';cKelurahan:='';cKecamatan:='';
   cKabupaten:='';cPokok:='';cDenda:='';cTotal:='';cAdmin:='';cProvinsi:='';cNoReff:='';cTotalBayar:='';

   mem:=TStringStream.Create;
   cUrl:=MyGlobalVariabel.ApplicationUrl+'/Inquiry/PBBInquiryPayment';
   js := TlkJSONobject.Create();
   jr := TlkJSONObject.Create();
   ja := TlkJSONObject.Create();

   js.Add('tahun',trim(Tahun.Text));
   js.Add('action','I');
   js.Add('terminal',MyGlobalVariabel.ApplicationTerminalAuth);
   js.Add('user',MyGlobalVariabel.ApplicationUserAuth);
   js.Add('nop',trim(NOP.Text));
   js.Add('user_id','173');
   js.Add('kode_kantor','01');
   s := TlkJSON.GenerateText(js);
   lParamList:=TStringStream.Create(s);
   try
      http.Post(cUrl,lParamList,mem);
   except
      Showmessage('Gagal Inquiry Data');
      exit;
   end;

   a:=mem.DataString;
   //MemoPbb.Lines.Text:=a;
   jr:=TlkJSON.Parsetext(a) as TlkJSONobject;
   cRespon := jr.Field['response_code'].Value;

   nTagihan:=0;nAdmin:=0;
   if trim(cRespon)='00' then begin
      ja := jr.Field['response_data'] as TlkJSONobject;
      cKuitansi:=ja.Field['kuitansi'].Value;
      cKuitansiID:=ja.Field['kuitansi_id'].Value;
      cNama:=ja.Field['nama'].Value;
      cNOP:=ja.Field['nop'].Value;
      cTahun:=ja.Field['tahun'].Value;
      cKelurahan:=ja.Field['kelurahan'].Value;
      cKecamatan:=ja.Field['kecamatan'].Value;
      cKabupaten:=ja.Field['kabupaten'].Value;
      cPokok:=ja.Field['pokok'].Value;
      cDenda:=ja.Field['denda'].Value;
      cTotal:=ja.Field['total'].Value;
      cAdmin:=ja.Field['admin'].Value;
      cProvinsi:=ja.Field['provinsi'].Value;
      cNoReff:=ja.Field['noreff'].Value;
      MemoPbb.Clear;
      MemoPbb.Lines.Add('');
      MemoPbb.Lines.Add('Data Object Pajak :');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Nama           : '+cNama+'');
      MemoPbb.Lines.Add('NOP             : '+cNOP+'');
      MemoPbb.Lines.Add('Tahun          : '+cTahun+'');
      MemoPbb.Lines.Add('Kelurahan    : '+cKelurahan+'');
      MemoPbb.Lines.Add('Kecamatan   : '+cKecamatan+'');
      MemoPbb.Lines.Add('Kabupaten   : '+cKabupaten+'');
      MemoPbb.Lines.Add('Provinsi        : '+cProvinsi+'');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Informasi Pembayaran :');
      MemoPbb.Lines.Add('================================================');
      MemoPbb.Lines.Add('Pokok           : '+FormatFloat('###,##0',StrToFloat(cPokok))+'');
      MemoPbb.Lines.Add('Denda          : '+FormatFloat('###,##0',StrToFloat(cDenda))+'');

      nTagihan:=StrToFloat(cTotal);
      Tagihan.Font.Color:=clRed;
   end else begin
      if trim(cRespon)='02' then begin
         MemoPbb.Clear;
         MemoPbb.Lines.Add('');
         MemoPbb.Lines.Add('FAILED INQUIRY PBB : WILAYAH TSB TIDAK DAPAT DIPROSES OLEH MITRA');
      end else begin
         if trim(cRespon)='01' then begin
            MemoPbb.Clear;
            MemoPbb.Lines.Add('');
            MemoPbb.Lines.Add('FAILED INQUIRY PBB : NO REFERENSI TELAH DIGUNAKAN');
         end else begin
            if trim(cRespon)='03' then begin
               MemoPbb.Clear;
               MemoPbb.Lines.Add('');
               MemoPbb.Lines.Add('FAILED INQUIRY PBB : PARAMETER DATA SALAH');
            end else begin
               if trim(cRespon)='04' then begin
                  MemoPbb.Clear;
                  MemoPbb.Lines.Add('');
                  MemoPbb.Lines.Add('FAILED INQUIRY PBB : NOP TIDAK DITEMUKAN');
               end else begin
                  if trim(cRespon)='05' then begin
                     MemoPbb.Clear;
                     MemoPbb.Lines.Add('');
                     MemoPbb.Lines.Add('FAILED INQUIRY PBB : TIDAK ADA TAHUN TAGIHAN PAJAK');
                  end else begin
                     if trim(cRespon)='06' then begin
                        MemoPbb.Clear;
                        MemoPbb.Lines.Add('');
                        MemoPbb.Lines.Add('FAILED INQUIRY PBB : TAHUN TAGIHAN PAJAK SUDAH DIBAYAR');
                     end else begin
                        if trim(cRespon)='07' then begin
                           MemoPbb.Clear;
                           MemoPbb.Lines.Add('');
                           MemoPbb.Lines.Add('FAILED INQUIRY PBB : SALDO REKENING TIDAK CUKUP');
                        end else begin
                           if trim(cRespon)='90' then begin
                              MemoPbb.Clear;
                              MemoPbb.Lines.Add('');
                              MemoPbb.Lines.Add('FAILED INQUIRY PBB : CONNECTION REFUSED');
                           end else begin
                              if trim(cRespon)='99' then begin
                                 MemoPbb.Clear;
                                 MemoPbb.Lines.Add('');
                                 MemoPbb.Lines.Add('FAILED INQUIRY PBB : ERROR INTERNAL BANK');
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
   TotalTagihan.Caption:=FormatFloat('###,##0',nTagihan);
   if nTagihan>0 then
      nAdmin:=StrToFloat(cAdmin);
   Admin.Caption:=FormatFloat('###,##0',nAdmin);
   Tagihan.Caption:=FormatFloat('###,##0',nTagihan+nAdmin);
   TotalBayar.Value:=nTagihan+nAdmin;
   cTotalBayar:=FloatToStr(nTagihan+nAdmin);
   btnProses.Enabled:=True;
   btnProses.SetFocus;
   //TotalBayar.SetFocus;
end;

procedure TfPbb.FormShow(Sender: TObject);
begin
   //PanelForm.Top:=Panel3.Height+1;
end;

procedure TfPbb.Panel2Resize(Sender: TObject);
begin
   PanelKiri.Width:=(Panel2.Width-445) div 2;
   PanelKanan.Width:=(Panel2.Width-445) div 2;
end;

procedure TfPbb.btnClearClick(Sender: TObject);
begin
   NOP.Text:='';
   Tahun.Text:='';
   MemoPbb.Clear;
   btnProses.Enabled:=True;
   btnPrint.Enabled:=False;
   TotalTagihan.Caption:='0';
   Admin.Caption:='0';
   Tagihan.Caption:='0';
   TotalBayar.Value:=0;
end;

end.
