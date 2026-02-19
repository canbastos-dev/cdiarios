unit u_relRecebimentosServicosAgrupamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB, StdCtrls, Mask, DBCtrls;

type
  Tf_relRecebimentosServicosAgrupamento = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    qrlFiltro: TQRLabel;
    q_Dados: TADOQuery;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText10: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    q_Descricoes: TADOQuery;
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
    q_DescricoesIDDESCPADRAO: TIntegerField;
    q_DescricoesDESCRICAOPADRAO: TStringField;
    q_DescricoesVALOR: TBCDField;
    DBEdit1: TDBEdit;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlNome: TQRLabel;
    q_NomeUsuarios: TADOQuery;
    q_NomeUsuariosIDCODIGO: TIntegerField;
    q_NomeUsuariosIDTIPOSERVICO: TIntegerField;
    q_NomeUsuariosIDTIPOUSUARIO: TIntegerField;
    q_NomeUsuariosNOME: TStringField;
    q_NomeUsuariosDTNASCIMENTO: TDateField;
    q_NomeUsuariosSEXO: TStringField;
    q_NomeUsuariosTELEFONEFIXO: TStringField;
    q_NomeUsuariosTELEFONECEL: TStringField;
    q_NomeUsuariosEMAIL: TStringField;
    q_NomeUsuariosTELEFONECEL2: TStringField;
    q_NomeUsuariosENDERECO: TStringField;
    q_NomeUsuariosIDBAIRRO: TIntegerField;
    q_NomeUsuariosIDMUNICIPIO: TIntegerField;
    q_NomeUsuariosCEP: TStringField;
    q_NomeUsuariosIDUF: TIntegerField;
    q_NomeUsuariosDIAVENCTO: TIntegerField;
    q_NomeUsuariosRG: TStringField;
    q_NomeUsuariosCPF: TStringField;
    q_NomeUsuariosIDSITUACAO: TIntegerField;
    q_NomeUsuariosIDTITULO: TIntegerField;
    QRDBText1: TQRDBText;
    qrlTotVlrClube: TQRLabel;
    qrlTotVlrParceiro: TQRLabel;
    qrlVlrClube: TQRLabel;
    qrlVlrParceiro: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    vLinha:integer;
    vTotal:real;
    { Public declarations }
  end;

var
  f_relRecebimentosServicosAgrupamento: Tf_relRecebimentosServicosAgrupamento;

implementation

uses u_CadAssociados, u_dados, u_MenuPrincipal;
{$R *.dfm}

procedure Tf_relRecebimentosServicosAgrupamento.FormCreate(Sender: TObject);
begin
  vLinha:=0;
  vTotal:=0;
end;

procedure Tf_relRecebimentosServicosAgrupamento.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relRecebimentosServicosAgrupamento.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vTotal:=0;
end;

procedure Tf_relRecebimentosServicosAgrupamento.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlabel3.Caption:=floattostrf(vTotal,ffnumber,10,2);
  qrlabel4.Caption:='Total de Lançamentos: '+inttostr(q_Dados.RecordCount);
end;

procedure Tf_relRecebimentosServicosAgrupamento.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vTotal:=vTotal+q_DadosVALORPAGO.Value;
end;

procedure Tf_relRecebimentosServicosAgrupamento.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if q_DadosDOCUMENTO.Value='SERVICO' then
    begin
      q_NomeUsuarios.close;
      q_NomeUsuarios.Parameters[0].Value:=q_DadosIDASSOCIADO.Value;
      q_NomeUsuarios.Open;
      qrlNome.Caption:=q_NomeUsuariosNOME.Value;
    end
  else qrlNome.Caption:=q_DadosASSOCIADO.Value;

  if vLinha=0 then begin
    vLinha:=1;
    QRSubDetail1.Color:=$00E2E2E2;
  end else begin
    QRSubDetail1.Color:=clWhite;
    vLinha:=0;
  end;

  qrlVlrClube.Caption:=floattostrf((q_DadosVALORPAGO.value*dm_Dados.q_ConfiguracoesPERC_ACAD_CLUBE.Value),ffnumber,7,2);
  qrlVlrParceiro.Caption:=floattostrf((q_DadosVALORPAGO.value*dm_Dados.q_ConfiguracoesPERC_ACAD_PARCEIRO.Value),ffnumber,7,2);

end;

procedure Tf_relRecebimentosServicosAgrupamento.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  vLinha:=0;

  q_Dados.close;
  q_Dados.Parameters[0].Value:=strtodate(f_menuPrincipal.lbData1.Caption);
  q_Dados.Parameters[1].Value:=strtodate(f_menuPrincipal.lbData2.Caption);
  q_Dados.Parameters[2].Value:=q_DescricoesIDDESCPADRAO.Value;
  q_Dados.open;

  qrlTotVlrClube.Caption:=floattostrf((q_DescricoesVALOR.value*dm_Dados.q_ConfiguracoesPERC_ACAD_CLUBE.Value),ffnumber,7,2);
  qrlTotVlrParceiro.Caption:=floattostrf((q_DescricoesVALOR.value*dm_Dados.q_ConfiguracoesPERC_ACAD_PARCEIRO.Value),ffnumber,7,2);

end;

end.
