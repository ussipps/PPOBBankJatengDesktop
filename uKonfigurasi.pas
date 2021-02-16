unit uKonfigurasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,IniFiles;

type
  TfKonfigurasi = class(TForm)
    PanelUtama: TPanel;
    PanelJudul: TPanel;
    GroupURL: TGroupBox;
    cURL: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    btnSimpan: TButton;
    GroupAuth: TGroupBox;
    cUserAuth: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cTerminalAuth: TEdit;
    GroupSFTP: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cFileKirim: TEdit;
    cAddress: TEdit;
    Label6: TLabel;
    cPort: TEdit;
    LabelUsername: TLabel;
    cUsername: TEdit;
    labelpass: TLabel;
    cPassword: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure PanelUtamaResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fKonfigurasi: TfKonfigurasi;

implementation

{$R *.dfm}

procedure TfKonfigurasi.btnSimpanClick(Sender: TObject);
var
   cFileName:String;
   Ini: TIniFile;
begin
   cFileName:='iPast.ini';
   Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+cFileName);
   try
      Ini.WriteString('Konfigurasi','URL',trim(cURL.Text));
      Ini.WriteString('Konfigurasi','User',trim(cUserAuth.Text));
      Ini.WriteString('Konfigurasi','Terminal',trim(cTerminalAuth.Text));
      Ini.WriteString('SFTP','FolderFileKirim',trim(cFileKirim.Text));
      Ini.WriteString('SFTP','Address',trim(cAddress.Text));
      Ini.WriteString('SFTP','Port',trim(cPort.Text));
      Ini.WriteString('SFTP','Username',trim(cUsername.Text));
      Ini.WriteString('SFTP','Password',trim(cPassword.Text));
   finally
      Ini.Free;
   end;
   Showmessage('Konfigurasi Selesai, Silahkan Login Ulang');
end;

procedure TfKonfigurasi.FormShow(Sender: TObject);
var
   cFileName:string;
   Ini: TIniFile;
begin
   cFileName:='iPast.ini';
   Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+cFileName);
   try
      begin
         cURL.Text         :=Ini.ReadString('Konfigurasi','URL','');
         cUserAuth.Text    :=Ini.ReadString('Konfigurasi','User','');
         cTerminalAuth.Text:=Ini.ReadString('Konfigurasi','Terminal','');
         cFileKirim.Text   :=Ini.ReadString('SFTP','FolderFileKirim','');
         cAddress.Text     :=Ini.ReadString('SFTP','Address','');
         cPort.Text        :=Ini.ReadString('SFTP','Port','');
         cUsername.Text    :=Ini.ReadString('SFTP','Username','');
         cPassword.Text    :=Ini.ReadString('SFTP','Password','');
      end;
   finally
      Ini.Free;
   end;
end;

procedure TfKonfigurasi.PanelUtamaResize(Sender: TObject);
begin
   GroupURL.Width:=PanelUtama.Width-50;
   GroupURL.Left:=25;
   GroupAuth.Width:=PanelUtama.Width-50;
   GroupAuth.Left:=25;
   GroupSFTP.Width:=PanelUtama.Width-50;
   GroupSFTP.Left:=25;
end;

end.
