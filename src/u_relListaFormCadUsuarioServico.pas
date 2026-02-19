unit u_relListaFormCadUsuarioServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tf_relListaFormCadUsuarioServico = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlFiltro: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText11: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    vLinha:integer;
    { Public declarations }
  end;

var
  f_relListaFormCadUsuarioServico: Tf_relListaFormCadUsuarioServico;

implementation

uses u_CadUsuariosServicos, u_CadAssociados;
{$R *.dfm}

procedure Tf_relListaFormCadUsuarioServico.FormCreate(Sender: TObject);
begin
  vLinha:=0;
end;

procedure Tf_relListaFormCadUsuarioServico.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relListaFormCadUsuarioServico.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vLinha=0 then begin
    vLinha:=1;
    qrband2.Color:=$00E2E2E2;
  end else begin
    qrband2.Color:=clWhite;
    vLinha:=0;
  end;
end;

end.
