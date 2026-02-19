unit u_Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tf_Splash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Splash: Tf_Splash;

implementation

{$R *.dfm}

procedure Tf_Splash.FormCreate(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('c:\cdiarios\imagens\splash.bmp');
end;

procedure Tf_Splash.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
