unit u_RelListaAdimplentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, ADODB, QRCtrls;

type
  Tf_RelListaAdimplentes = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    q_Dados: TADOQuery;
    q_DadosCODIGO: TIntegerField;
    q_DadosASSOCIADO: TStringField;
    q_DadosSITUACAO: TStringField;
    q_DadosFONE1: TStringField;
    q_DadosFONE2: TStringField;
    q_DadosENDERECO: TStringField;
    q_DadosIDBAIRRO: TIntegerField;
    q_DadosBAIRRO: TStringField;
    q_DadosMUNICIPIO: TStringField;
    q_DadosUF: TStringField;
    q_DadosCEP: TStringField;
    q_DadosCATEGORIA: TStringField;
    q_DadosESTADOCIVIL: TStringField;
    q_DadosRG: TStringField;
    q_DadosTITULOSDEB: TIntegerField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_RelListaAdimplentes: Tf_RelListaAdimplentes;

implementation

uses u_dados;
{$R *.dfm}

procedure Tf_RelListaAdimplentes.FormCreate(Sender: TObject);
begin
  QRImage1.Picture.LoadFromFile('c:\cdiarios\imagens\logocdiarios.bmp');
end;

procedure Tf_RelListaAdimplentes.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if q_DadosTITULOSDEB.Value=0 then qrlabel9.Caption:='()'
  else qrlabel9.Caption:='('+inttostr(q_DadosTITULOSDEB.Value)+')';
end;

end.
