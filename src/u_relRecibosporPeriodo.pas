unit u_relRecibosporPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, ADODB, QRCtrls;

type
  Tf_relRecibosporPeriodo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    q_dados: TADOQuery;
    q_dadosTITULO: TIntegerField;
    q_dadosIDASSOCIADO: TIntegerField;
    q_dadosASSOCIADO: TStringField;
    q_dadosREFERENCIA: TStringField;
    q_dadosDTVENCIMENTO: TDateField;
    q_dadosDTPAGAMENTO: TDateField;
    q_dadosDOCUMENTO: TStringField;
    q_dadosVALORDOCUMENTO: TBCDField;
    q_dadosFORMAPAGTO: TStringField;
    q_dadosVALORPAGO: TBCDField;
    q_dadosDESCRICAOPADRAO: TStringField;
    q_dadosNUMRECIVO: TIntegerField;
    q_dadosATIVO: TStringField;
    q_dadosDTBAIXA: TDateField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlFiltro: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    vLinha:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_relRecibosporPeriodo: Tf_relRecibosporPeriodo;

implementation

uses u_dados;
{$R *.dfm}

procedure Tf_relRecibosporPeriodo.FormCreate(Sender: TObject);
begin
  vLinha:=0;
end;

procedure Tf_relRecibosporPeriodo.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if q_dadosATIVO.Value='S' then qrlabel9.Enabled:=false
  else qrlabel9.Enabled:=true;
  if vLinha=0 then begin
    vLinha:=1;
    qrband2.Color:=$00E2E2E2;
  end else begin
    qrband2.Color:=clWhite;
    vLinha:=0;
  end;

end;

end.
