unit u_relFichaAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  Tf_relFichaAcordo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel15: TQRLabel;
    QRImage1: TQRImage;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_relFichaAcordo: Tf_relFichaAcordo;

implementation

uses u_FormLiberacao, u_BaixaPagtosManual, u_Dados;
{$R *.dfm}

procedure Tf_relFichaAcordo.FormCreate(Sender: TObject);
begin
  QRImage1.Picture.LoadFromFile('c:\cdiarios\imagens\logocdiarios.bmp');
end;

end.
