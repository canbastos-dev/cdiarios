unit u_relTitulosAbertos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB, StdCtrls, Mask, DBCtrls;

type
  Tf_relTitulosAbertos = class(TForm)
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
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    q_Descricoes: TADOQuery;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    q_DadosDTVENCIMENTO: TDateField;
    q_DadosNUMDOC: TStringField;
    q_DadosDTEMISSAO: TDateField;
    q_DadosIDTITULO: TIntegerField;
    q_DadosVALORDOC: TBCDField;
    q_DadosABERTO: TStringField;
    q_DadosIDASSOCIADO: TIntegerField;
    q_DadosCODIGO: TIntegerField;
    q_DadosASSOCIADO: TStringField;
    q_DadosDTPAGAMENTO: TDateField;
    q_DadosDOCUMENTOBAIXA: TStringField;
    q_DadosTIPOBAIXA: TStringField;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    q_DescricoesNTITULOS: TIntegerField;
    q_DescricoesTTITULOS: TBCDField;
    q_DescricoesASSOCIADO: TStringField;
    q_DescricoesIDASSOCIADO: TIntegerField;
    q_DescricaoTodos: TADOQuery;
    q_DescricaoTodosTTITULOS: TBCDField;
    q_DescricaoTodosIDASSOCIADO: TIntegerField;
    q_DescricaoTodosASSOCIADO: TStringField;
    q_DescricaoTodosNTITULOS: TIntegerField;
    QRDBText4: TQRDBText;
    q_DescricoesIDSITUACAO: TIntegerField;
    q_DadosIDSITUACAO: TIntegerField;
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
  f_relTitulosAbertos: Tf_relTitulosAbertos;

implementation

uses u_CadAssociados, u_dados, u_MenuPrincipal;
{$R *.dfm}

procedure Tf_relTitulosAbertos.FormCreate(Sender: TObject);
begin
  vLinha:=0;
  vTotal:=0;
end;

procedure Tf_relTitulosAbertos.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relTitulosAbertos.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vTotal:=0;
end;

procedure Tf_relTitulosAbertos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlabel3.Caption:=floattostrf(vTotal,ffnumber,10,2);
  qrlabel4.Caption:='Total de Lançamentos: '+inttostr(q_Dados.RecordCount)
end;

procedure Tf_relTitulosAbertos.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vTotal:=vTotal+q_DadosVALORDOC.Value;
end;

procedure Tf_relTitulosAbertos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vLinha=0 then begin
    vLinha:=1;
    QRSubDetail1.Color:=$00E2E2E2;
  end else begin
    QRSubDetail1.Color:=clWhite;
    vLinha:=0;
  end;
end;

procedure Tf_relTitulosAbertos.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relTitulosAbertos.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  q_Dados.close;
  q_Dados.SQL.Clear;
  q_Dados.SQL.add('SELECT');
  q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO,');
  q_Dados.SQL.add('TBBOLETOS.NUMDOC,');
  q_Dados.SQL.add('TBBOLETOS.DTEMISSAO,');
  q_Dados.SQL.add('TBBOLETOS.IDTITULO,');
  q_Dados.SQL.add('TBBOLETOS.VALORDOC,');
  q_Dados.SQL.add('TBBOLETOS.ABERTO,');
  q_Dados.SQL.add('TBBOLETOS.IDASSOCIADO,');
  q_Dados.SQL.add('W_ASSOCIADOS.CODIGO,');
  q_Dados.SQL.add('W_ASSOCIADOS.ASSOCIADO,');
  q_Dados.SQL.add('W_ASSOCIADOS.IDSITUACAO,');
  q_Dados.SQL.add('TBBOLETOS.DTPAGAMENTO,');
  q_Dados.SQL.add('TBBOLETOS.DOCUMENTOBAIXA,');
  q_Dados.SQL.add('TBBOLETOS.TIPOBAIXA');
  q_Dados.SQL.add('FROM');
  q_Dados.SQL.add('TBBOLETOS');
  q_Dados.SQL.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
  q_Dados.SQL.add('WHERE');
  if tag=10 then begin
    q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND W_ASSOCIADOS.IDSITUACAO=:d4 AND TBBOLETOS.ABERTO=:d5');
    q_Dados.SQL.add('order by');
    q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
    q_Dados.Parameters[0].Value:=strtodate(f_menuPrincipal.lbData1.Caption);
    q_Dados.Parameters[1].Value:=strtodate(f_menuPrincipal.lbData2.Caption);
    q_Dados.Parameters[2].Value:=q_DescricoesIDASSOCIADO.Value;
    q_Dados.Parameters[3].Value:=q_DescricoesIDSITUACAO.Value;
    q_Dados.Parameters[4].Value:='N';
  end else if tag=20 then begin
    q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND W_ASSOCIADOS.IDSITUACAO=:d4 AND TBBOLETOS.ABERTO=:d5');
    q_Dados.SQL.add('order by');
    q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
    q_Dados.Parameters[0].Value:=strtodate(f_menuPrincipal.lbData1.Caption);
    q_Dados.Parameters[1].Value:=strtodate(f_menuPrincipal.lbData2.Caption);
    q_Dados.Parameters[2].Value:=q_DescricoesIDASSOCIADO.Value;
    q_Dados.Parameters[3].Value:=q_DescricoesIDSITUACAO.Value;
    q_Dados.Parameters[4].Value:='S';
  end else if tag=30 then begin
    q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND TBBOLETOS.ABERTO=:d5');
    q_Dados.SQL.add('order by');
    q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
    q_Dados.Parameters[0].Value:=strtodate(f_menuPrincipal.lbData1.Caption);
    q_Dados.Parameters[1].Value:=strtodate(f_menuPrincipal.lbData2.Caption);
    q_Dados.Parameters[2].Value:=q_DescricaoTodosIDASSOCIADO.Value;
    q_Dados.Parameters[3].Value:='N';
  end;
  q_Dados.open;

end;

end.
