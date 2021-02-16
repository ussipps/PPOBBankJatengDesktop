unit uMyGlobalVariabel;

interface
uses
  Windows, Registry, OnGuard, SysUtils, Classes, Forms, SqlExpr, Printers, Graphics, SimpleDS, DB ;

type
  TMyGlobalVariabel = class(TPersistent)
  private
     FMyClipboard      : string;

     FApplicationTglHariIni     : TDateTime;
     FApplicationTglExpired     : TDateTime;
     FApplicationUserID         : string;
     FApplicationUserName       : string;
     FApplicationUnitKerja      : string;
     FApplicationJabatan        : string;
     FApplicationNamaLengkap    : string;
     FApplicationNamaKantor     : string;
     FApplicationUserCode       : string;
     FApplicationKodeKas        : string;
     FApplicationKotaKantor     : string;
     FApplicationStatusAktif    : string;
     FApplicationAlamatKantor   : string;
     FApplicationNamaLembaga    : string;
     FApplicationUrl            : string;
     FApplicationUserAuth       : string;
     FApplicationTerminalAuth   : string;

  public
     constructor Create;

  published
     property MyClipboard      : string read FMyClipboard write FMyClipboard;

     property ApplicationTglHariIni     : TDateTime read FApplicationTglHariIni write FApplicationTglHariIni;
     property ApplicationTglExpired     : TDateTime read FApplicationTglExpired write FApplicationTglExpired;
     property ApplicationUserID         : string read FApplicationUserID write FApplicationUserID;
     property ApplicationUserName       : string read FApplicationUserName write FApplicationUserName;
     property ApplicationUnitKerja      : string read FApplicationUnitKerja write FApplicationUnitKerja;
     property ApplicationJabatan        : string read FApplicationJabatan write FApplicationJabatan;
     property ApplicationNamaLengkap    : string read FApplicationNamaLengkap write FApplicationNamaLengkap;
     property ApplicationNamaKantor     : string read FApplicationNamaKantor write FApplicationNamaKantor;
     property ApplicationUserCode       : string read FApplicationUserCode write FApplicationUserCode;
     property ApplicationKodeKas        : string read FApplicationKodeKas write FApplicationKodeKas;
     property ApplicationKotaKantor     : string read FApplicationKotaKantor write FApplicationKotaKantor;
     property ApplicationStatusAktif    : string read FApplicationStatusAktif write FApplicationStatusAktif;
     property ApplicationAlamatKantor   : string read FApplicationAlamatKantor write FApplicationAlamatKantor;
     property ApplicationNamaLembaga    : string read FApplicationNamaLembaga write FApplicationNamaLembaga;
     property ApplicationUrl            : string read FApplicationUrl write FApplicationUrl;
     property ApplicationUserAuth       : string read FApplicationUserAuth write FApplicationUserAuth;
     property ApplicationTerminalAuth   : string read FApplicationTerminalAuth write FApplicationTerminalAuth;

  end;

var
  MyGlobalVariabel  : TMyGlobalVariabel;

const
   DEFAULT_DATABASE_USER_NAME = 'root';
   DEFAULT_DATABASE_PASSWORD = '';
   DEFAULT_DATABASE_NAME = '';
   DEFAULT_DATABASE_HOST = 'localhost';

implementation

constructor TMyGlobalVariabel.Create;
var
  c : string;
  nMaksimalTrans:Double;
begin
  inherited;
  FMyClipboard:='';

  ApplicationTglHariIni := Date;

end;

end.
