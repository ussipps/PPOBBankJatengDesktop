unit uAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfAbout = class(TForm)
    Panel1: TPanel;
    PanelJudul: TPanel;
    PanelAbout: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Panel1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

{$R *.dfm}

procedure TfAbout.Panel1Resize(Sender: TObject);
begin
   PanelAbout.Left:=(panel1.Width-PanelAbout.Width) div 2;
   PanelAbout.Top:=(Panel1.Height-PanelAbout.Height) div 2;
end;

end.
