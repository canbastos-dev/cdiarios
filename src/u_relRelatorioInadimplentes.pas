unit u_relRelatorioInadimplentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB;

type
  Tf_relRelatorioInadimplentes = class(TForm)
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
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlFiltro: TQRLabel;
    q_Dados: TADOQuery;
    q_DadosSEQUENCIA: TIntegerField;
    q_DadosTITULO: TIntegerField;
    q_DadosIDASSOCIADO: TIntegerField;
    q_DadosASSOCIADO: TStringField;
    q_DadosANOMES: TIntegerField;
    q_DadosREFERENCIA: TStringField;
    q_DadosDTVENCIMENTO: TDateField;
    q_DadosDTPAGAMENTO: TDateField;
    q_DadosDOCUMENTO: TStringField;
    q_DadosVALORDOCUMENTO: TBCDField;
    q_DadosIDFORMAPAG: TIntegerField;
    q_DadosFORMAPAGTO: TStringField;
    q_DadosACRESCIMO: TBCDField;
    q_DadosDESCONTO: TBCDField;
    q_DadosVALORPAGO: TBCDField;
    q_DadosVALORRESTANTE: TBCDField;
    q_DadosDTALTERACAO: TDateField;
    q_DadosUSALTERACAO: TIntegerField;
    q_DadosUSINCLUSAO: TIntegerField;
    q_DadosIDDESCPADRAO: TIntegerField;
    q_DadosDESCRICAOPADRAO: TStringField;
    q_DadosNUMRECIVO: TIntegerField;
    q_DadosATIVO: TStringField;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    vLinha:integer;
    vTotal:real;
    { Public declarations }
  end;

var
  f_relRelatorioInadimplentes: Tf_relRelatorioInadimplentes;

implementation

uses u_CadAssociados, u_dados;
{$R *.dfm}

procedure Tf_relRelatorioInadimplentes.FormCreate(Sender: TObject);
begin
  vLinha:=0;
  vTotal:=0;
end;

procedure Tf_relRelatorioInadimplentes.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relRelatorioInadimplentes.QRBand2BeforePrint(
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

procedure Tf_relRelatorioInadimplentes.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vTotal:=0;
end;

procedure Tf_relRelatorioInadimplentes.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlabel3.Caption:=floattostrf(vTotal,ffnumber,10,2);
  qrlabel4.Caption:='Total de Lançamentos: '+inttostr(q_Dados.RecordCount);
end;

procedure Tf_relRelatorioInadimplentes.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vTotal:=vTotal+q_DadosVALORPAGO.Value;
end;

end.
