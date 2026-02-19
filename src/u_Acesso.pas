unit u_Acesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  Tf_Acesso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    d_Login: TDataSource;
    pnMensagem: TPanel;
    Timer1: TTimer;
    q_Login: TADOQuery;
    q_LoginIDUSUARIO: TIntegerField;
    q_LoginNLOGIN: TStringField;
    q_LoginSENHA: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Acesso: Tf_Acesso;

implementation

uses u_dados, u_MenuPrincipal;
{$R *.dfm}

procedure Tf_Acesso.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_Acesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure Tf_Acesso.BitBtn1Click(Sender: TObject);
begin
  q_Login.Close;
  q_Login.Parameters[0].Value:=edUsuario.Text;
  q_Login.Parameters[1].Value:=edSenha.Text;
  q_Login.open;

//  if sp_Login.Parameters.ParamByName('pIDUSUARIO').Value>0 then begin
  if q_Login.RecordCount>0 then begin
    Application.CreateForm(Tf_MenuPrincipal, f_MenuPrincipal);
    f_MenuPrincipal.Label4.Caption:=DateTimeToStr(now);
    f_MenuPrincipal.Label2.Caption:=edUsuario.Text;
    f_MenuPrincipal.Label5.Caption:=edSenha.Text;
    f_MenuPrincipal.ShowModal;
  end
  else
    if q_Login.RecordCount=0 then begin
      f_Acesso.Height:=260;
      pnMensagem.Color:=clred;
      pnMensagem.Visible:=true;
      edusuario.SelectAll;
      edusuario.SetFocus;
    end;
end;

procedure Tf_Acesso.FormActivate(Sender: TObject);
begin
  f_Acesso.Height:=215;
  f_Acesso.Width:=296;
end;

procedure Tf_Acesso.Timer1Timer(Sender: TObject);
begin
  if pnMensagem.Visible=true then
    pnMensagem.Visible:=false;
  f_Acesso.Height:=215;
end;

end.
