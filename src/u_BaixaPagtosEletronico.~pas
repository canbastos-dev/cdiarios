unit u_BaixaPagtosEletronico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, DBCtrls, Buttons;

type
  Tf_BaixaPagtosEletronico = class(TForm)
    Label1: TLabel;
    dblFormaPagt: TDBLookupComboBox;
    Label2: TLabel;
    edReferencia: TEdit;
    Label3: TLabel;
    mkDtBaixa: TMaskEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BaixaPagtosEletronico: Tf_BaixaPagtosEletronico;

implementation

uses u_dados, u_CadFPagtos;
{$R *.dfm}

procedure Tf_BaixaPagtosEletronico.FormCreate(Sender: TObject);
begin
  mkDtBaixa.Text:=datetostr(date);
  f_BaixaPagtosEletronico.Height:=208;
end;

procedure Tf_BaixaPagtosEletronico.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_BaixaPagtosEletronico.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadFPagtos, f_CadFPagtos);
  f_CadFPagtos.ShowModal;
end;

end.
