unit uSamsat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, frxClass;

type
  TfSamsat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    KodeBilling: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PanelForm: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    frxReport1: TfrxReport;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSamsat: TfSamsat;

implementation

{$R *.dfm}

uses
   uMyMainMenu;

procedure TfSamsat.Button2Click(Sender: TObject);
begin
   Close;
   fMyMainMenu.BtnHomeClick(self);
end;

procedure TfSamsat.Button4Click(Sender: TObject);
var
   cNama:String;
begin
   cNama:='A';
   frxReport1.Script.Variables['cKodeBayar']       := '0102498107170002';
   frxReport1.Script.Variables['cNama']            := 'CHRISTINA SOESILO';
   frxReport1.Script.Variables['cNIK']             := '3374036412780004';
   frxReport1.Script.Variables['cAlamat']          := 'JL GOMBEL PERMAI III\/70-A RT 10\/7 NGESREP BYMN SMG';
   frxReport1.Script.Variables['cNomorPolisi']     := 'H 4981 NZ';
   frxReport1.Script.Variables['cMerk']            := 'YAMAHA';
   frxReport1.Script.Variables['cTipe']            := 'VEGA-ZR\/5D9';
   frxReport1.Script.Variables['cJenis']           := '4';
   frxReport1.Script.Variables['cModel']           := 'SPM\/SEPEDA MOTOR';
   frxReport1.Script.Variables['cRoda']            := '0';
   frxReport1.Script.Variables['cTahunBuat']       := '2010';
   frxReport1.Script.Variables['cWarna']           := 'MERAH MARUN';
   frxReport1.Script.Variables['cBahanBakar']      := 'BENSIN';
   frxReport1.Script.Variables['cNoMesin']         := '5D9751696';
   frxReport1.Script.Variables['cNoRangka']        := 'MH35D9002AJ751609';
   frxReport1.Script.Variables['cKepemilikanKe']   := '1';
   frxReport1.Script.Variables['cKodeLokasi']      := '02';
   frxReport1.Script.Variables['cNoBPKB']          := 'H02261190I';
   frxReport1.Script.Variables['cTglAkhirPKB']     := '2017-08-12';
   frxReport1.Script.Variables['cTglAkhirPKBBaru'] := '2018-08-12';
   frxReport1.Script.Variables['cPokokPKB']        := '136500';
   frxReport1.Script.Variables['cDendaPKB']        := '0';
   frxReport1.Script.Variables['cPokokSWDKLLJ']    := '35000';
   frxReport1.Script.Variables['cDendaSWDKLLJ']    := '0';
   frxReport1.Script.Variables['cPokokPNBP']       := '25000';
   frxReport1.Script.Variables['cDendaPNBP']       := '0';
   frxReport1.Script.Variables['cTagihan']         := '196500';
   frxReport1.Script.Variables['cAdmin']           := '5000';
   frxReport1.Script.Variables['cTotalBayar']      := '121500';
   frxReport1.Script.Variables['cKodeTrans']       := '50586';
   frxReport1.ShowReport();
end;

procedure TfSamsat.FormShow(Sender: TObject);
begin
   KodeBilling.SetFocus;
end;

end.
