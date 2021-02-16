program iPast;

uses
  Vcl.Forms,
  uMyMainMenu in 'uMyMainMenu.pas' {fMyMainMenu},
  uMyLogin in 'uMyLogin.pas' {fMyLogin},
  uLkJSON in 'uLkJSON.pas',
  uSamsat in 'uSamsat.pas' {fSamsat},
  uPbb in 'uPbb.pas' {fPbb},
  uMyGlobalVariabel in 'uMyGlobalVariabel.pas',
  uProsesRekon in 'uProsesRekon.pas' {fProsesRekon},
  uKonfigurasi in 'uKonfigurasi.pas' {fKonfigurasi},
  uAbout in 'uAbout.pas' {fAbout},
  uPosting in 'uPosting.pas' {fPosting};

{$R *.res}

begin
  Application.Initialize;
  fMyLogin:=TfMyLogin.Create(Application);
  MyGlobalVariabel:=TMyGlobalVariabel.Create;

  if fMyLogin.ShowModal=-1 then
  begin
     Application.Terminate;
  end
  else
  begin
     fMyLogin.Free;
     Application.CreateForm(TfMyMainMenu, fMyMainMenu);
  end;
  Application.Run;
end.
