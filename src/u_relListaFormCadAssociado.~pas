unit u_relListaFormCadAssociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tf_relListaFormCadAssociado = class(TForm)
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
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
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
  f_relListaFormCadAssociado: Tf_relListaFormCadAssociado;

implementation

uses u_CadAssociados;
{$R *.dfm}

procedure Tf_relListaFormCadAssociado.FormCreate(Sender: TObject);
begin
  vLinha:=0;
end;

procedure Tf_relListaFormCadAssociado.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relListaFormCadAssociado.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

  if f_CadAssociados.q_DadosTITULOSDEB.Value>0 then qrlabel4.Caption:=inttostr(f_CadAssociados.q_DadosTITULOSDEB.Value)+'BA'
  else qrlabel4.Caption:='';

  case f_CadAssociados.q_DadosIDFORMAPAGTO.Value of
    0:QRLabel5.Caption:='IND';
    1:QRLabel5.Caption:='SEC';
    2:QRLabel5.Caption:='PM';
    3:QRLabel5.Caption:='ISE';
    4:QRLabel5.Caption:='CCX';
  end;

  if vLinha=0 then begin
    vLinha:=1;
    qrband2.Color:=$00E2E2E2;
  end else begin
    qrband2.Color:=clWhite;
    vLinha:=0;
  end;
end;

end.
