unit u_MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, ExtCtrls, StdCtrls, Buttons, Menus,
  XPStyleActnCtrls, ActnList, ActnMan, ToolWin, ActnCtrls, ActnMenus, Mask;

type
  Tf_MenuPrincipal = class(TForm)
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    pnMenuFlat: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    SpeedButton2: TSpeedButton;
    Action8: TAction;
    lbData1: TLabel;
    lbFlag: TLabel;
    lbData2: TLabel;
    Action9: TAction;
    Action10: TAction;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action2Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure Action17Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_MenuPrincipal: Tf_MenuPrincipal;

implementation

uses u_CadAssociados, u_CadUsuarios, FBackup, u_BaixaPagtosEletronico,
  u_MenuImportar, u_BaixaPagtosManual, u_relRecebimentosData,
  u_FiltraPeriodo, u_CadTransferencias, u_relRecibosporPeriodo,
  u_RelListaAdimplentes, u_PesquisaAvancada, u_RelListaAptosEleicao,
  u_relRecebimentosDataAgrupamento, u_relTitulosAbertos, u_FiltraPeriodo2,
  u_relTitulosAbertosSintetico, ADODB, u_CadUsuariosServicos,
  u_CadUsuariosTipo, u_BaixaPagtosServicos,
  u_relRecebimentosServicosAgrupamento;

{$R *.dfm}

procedure Tf_MenuPrincipal.Action1Execute(Sender: TObject);
begin
  close;
end;

procedure Tf_MenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure Tf_MenuPrincipal.Action2Execute(Sender: TObject);
begin
  pnMenuFlat.Visible:=false;
  Application.CreateForm(Tf_CadAssociados, f_CadAssociados);
  f_CadAssociados.ShowModal;
  pnMenuFlat.Visible:=true;
end;

procedure Tf_MenuPrincipal.FormActivate(Sender: TObject);
begin
  pnMenuFlat.Visible:=true;
end;

procedure Tf_MenuPrincipal.Action3Execute(Sender: TObject);
begin
  pnMenuFlat.Visible:=false;
  Application.CreateForm(Tf_CadUsuarios, f_CadUsuarios);
  f_CadUsuarios.ShowModal;
  pnMenuFlat.Visible:=true;
end;

procedure Tf_MenuPrincipal.Action4Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmBackup, frmBackup);
  frmBackup.showmodal;
end;

procedure Tf_MenuPrincipal.Action5Execute(Sender: TObject);
begin
  pnMenuFlat.Visible:=false;
  Application.CreateForm(Tf_BaixaPagtosEletronico, f_BaixaPagtosEletronico);
  f_BaixaPagtosEletronico.ShowModal;
  pnMenuFlat.Visible:=true;
end;

procedure Tf_MenuPrincipal.Action6Execute(Sender: TObject);
begin
  pnMenuFlat.Visible:=false;
  Application.CreateForm(Tf_MenuImportar, f_MenuImportar);
  f_MenuImportar.ShowModal;
  pnMenuFlat.Visible:=true;
end;

procedure Tf_MenuPrincipal.Action7Execute(Sender: TObject);
begin
  pnMenuFlat.Visible:=false;
  Application.CreateForm(Tf_BaixaPagtosManual, f_BaixaPagtosManual);
  f_BaixaPagtosManual.ShowModal;
  pnMenuFlat.Visible:=true;  
end;

procedure Tf_MenuPrincipal.Action8Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_FiltraPeriodo, f_FiltraPeriodo);
  f_FiltraPeriodo.cbAgrupar.Enabled:=true;
  f_FiltraPeriodo.ShowModal;
  if f_MenuPrincipal.Tag=10 then exit;
  if f_FiltraPeriodo.cbAgrupar.Checked=false then begin
    Application.CreateForm(Tf_relRecebimentosData, f_relRecebimentosData);
    f_relRecebimentosData.q_Dados.close;
    f_relRecebimentosData.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
    f_relRecebimentosData.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
    f_relRecebimentosData.q_Dados.open;

    f_relRecebimentosData.QuickRep1.Preview;
  end else begin
    Application.CreateForm(Tf_relRecebimentosDataAgrupamento, f_relRecebimentosDataAgrupamento);

    f_relRecebimentosDataAgrupamento.q_Descricoes.close;
    f_relRecebimentosDataAgrupamento.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
    f_relRecebimentosDataAgrupamento.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
    f_relRecebimentosDataAgrupamento.q_Descricoes.open;

    f_relRecebimentosDataAgrupamento.q_Dados.close;
    f_relRecebimentosDataAgrupamento.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
    f_relRecebimentosDataAgrupamento.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
    f_relRecebimentosDataAgrupamento.q_Dados.Parameters[2].Value:=f_relRecebimentosDataAgrupamento.q_DescricoesIDDESCPADRAO.Value;
    f_relRecebimentosDataAgrupamento.q_Dados.open;

    if f_FiltraPeriodo.cbQuebra.Checked then f_relRecebimentosDataAgrupamento.QRBand2.ForceNewPage:=true
    else f_relRecebimentosDataAgrupamento.QRBand2.ForceNewPage:=false;

    f_relRecebimentosDataAgrupamento.QuickRep1.Preview;
  end;
end;

procedure Tf_MenuPrincipal.Action9Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_CadTransferencias, f_CadTransferencias);
  f_CadTransferencias.ShowModal;
end;

procedure Tf_MenuPrincipal.Action10Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_FiltraPeriodo, f_FiltraPeriodo);
  f_FiltraPeriodo.ShowModal;

  Application.CreateForm(Tf_relRecibosporPeriodo, f_relRecibosporPeriodo);
  f_relRecibosporPeriodo.q_Dados.close;
  f_relRecibosporPeriodo.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
  f_relRecibosporPeriodo.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
  f_relRecibosporPeriodo.q_Dados.open;
  f_relRecibosporPeriodo.qrlFiltro.Caption:='Período: '+lbData1.Caption+' a '+lbData2.Caption;
  f_relRecibosporPeriodo.QuickRep1.Preview;
end;

procedure Tf_MenuPrincipal.Action11Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_RelListaAdimplentes, f_RelListaAdimplentes);
  f_RelListaAdimplentes.q_Dados.Active:=true;
  f_RelListaAdimplentes.qrlabel8.Caption:='Total de Listados: '+inttostr(f_RelListaAdimplentes.q_Dados.RecordCount);
  f_RelListaAdimplentes.QuickRep1.Preview;
end;

procedure Tf_MenuPrincipal.Action12Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_PesquisaAvancada, f_PesquisaAvancada);
  f_PesquisaAvancada.ShowModal;
end;

procedure Tf_MenuPrincipal.Action13Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_FiltraPeriodo2, f_FiltraPeriodo2);
  f_FiltraPeriodo2.ShowModal;
  if f_MenuPrincipal.Tag=10 then exit;

  if f_FiltraPeriodo2.rdgAnalSint.ItemIndex=0 then begin
    Application.CreateForm(Tf_relTitulosAbertos, f_relTitulosAbertos);
    if f_FiltraPeriodo2.cbQuebra.Checked then
        f_relTitulosAbertos.QRBand2.ForceNewPage:=true
    else
        f_relTitulosAbertos.QRBand2.ForceNewPage:=false;
    if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=0) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=0) then begin;   // ANALÍTICO ADIMPLENTES ATIVOS
      f_relTitulosAbertos.QRLabel2.Caption:='Relatório de Associados - Boletos Gerados';

      f_relTitulosAbertos.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Analítico - Adimplentes - Ativos';

      f_relTitulosAbertos.QuickRep1.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText3.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText4.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText8.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText7.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText11.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.Tag:=10;  // Marcação para indicar FONTE do relatorio

      f_relTitulosAbertos.q_Descricoes.Close;
      f_relTitulosAbertos.q_Descricoes.sql.Clear;
      f_relTitulosAbertos.q_Descricoes.sql.add('SELECT');
      f_relTitulosAbertos.q_Descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertos.q_Descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.IDSITUACAO');
//      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.ABERTO');
      f_relTitulosAbertos.q_Descricoes.sql.add('FROM');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertos.q_Descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_Descricoes.sql.add('WHERE');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertos.q_Descricoes.sql.add('group by');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.IDSITUACAO');
      f_relTitulosAbertos.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_Descricoes.Parameters[2].Value:=2;                            // associados ATIVOS
      f_relTitulosAbertos.q_Descricoes.Parameters[3].Value:='N';                          // em ABERTO nao
      f_relTitulosAbertos.q_Descricoes.open;

      f_relTitulosAbertos.q_Dados.close;
      f_relTitulosAbertos.q_Dados.SQL.Clear;
      f_relTitulosAbertos.q_Dados.SQL.add('SELECT');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTEMISSAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDTITULO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.VALORDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.ABERTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.IDSITUACAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTPAGAMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DOCUMENTOBAIXA,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.TIPOBAIXA');
      f_relTitulosAbertos.q_Dados.SQL.add('FROM');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS');
      f_relTitulosAbertos.q_Dados.SQL.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_Dados.SQL.add('WHERE');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND W_ASSOCIADOS.IDSITUACAO=:d4 AND TBBOLETOS.ABERTO=:d5');
      f_relTitulosAbertos.q_Dados.SQL.add('order by');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
      f_relTitulosAbertos.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[2].Value:=f_relTitulosAbertos.q_DescricoesIDASSOCIADO.Value;
      f_relTitulosAbertos.q_Dados.Parameters[3].Value:=2;
      f_relTitulosAbertos.q_Dados.Parameters[4].Value:='N';
      f_relTitulosAbertos.q_Dados.open;
    end else
    if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=1) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=0) then begin;   // INADIMPLENTES ATIVOS
      f_relTitulosAbertos.QRLabel2.Caption:='Relatório de Associados - Boletos Gerados';

      f_relTitulosAbertos.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Analítico - Inadimplentes - Ativos';

      f_relTitulosAbertos.QuickRep1.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText3.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText4.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText8.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText7.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.QRDBText11.DataSet:=f_relTitulosAbertos.q_Descricoes;
      f_relTitulosAbertos.Tag:=20;  // Marcação para indicar FONTE do relatorio

      f_relTitulosAbertos.q_Descricoes.Close;
      f_relTitulosAbertos.q_Descricoes.sql.Clear;
      f_relTitulosAbertos.q_Descricoes.sql.add('SELECT');
      f_relTitulosAbertos.q_Descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertos.q_Descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.IDSITUACAO');
//      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.ABERTO');
      f_relTitulosAbertos.q_Descricoes.sql.add('FROM');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertos.q_Descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_Descricoes.sql.add('WHERE');
      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertos.q_Descricoes.sql.add('group by');
      f_relTitulosAbertos.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.IDSITUACAO');
      f_relTitulosAbertos.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_Descricoes.Parameters[2].Value:=3;
      f_relTitulosAbertos.q_Descricoes.Parameters[3].Value:='S';
      f_relTitulosAbertos.q_Descricoes.open;

      f_relTitulosAbertos.q_Dados.close;
      f_relTitulosAbertos.q_Dados.SQL.Clear;
      f_relTitulosAbertos.q_Dados.SQL.add('SELECT');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTEMISSAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDTITULO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.VALORDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.ABERTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.IDSITUACAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTPAGAMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DOCUMENTOBAIXA,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.TIPOBAIXA');
      f_relTitulosAbertos.q_Dados.SQL.add('FROM');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS');
      f_relTitulosAbertos.q_Dados.SQL.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_Dados.SQL.add('WHERE');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND W_ASSOCIADOS.IDSITUACAO=:d4 AND TBBOLETOS.ABERTO=:d5');
      f_relTitulosAbertos.q_Dados.SQL.add('order by');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
      f_relTitulosAbertos.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[2].Value:=f_relTitulosAbertos.q_DescricoesIDASSOCIADO.Value;
      f_relTitulosAbertos.q_Dados.Parameters[3].Value:=3;
      f_relTitulosAbertos.q_Dados.Parameters[4].Value:='S';
      f_relTitulosAbertos.q_Dados.open;
    end else if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=0) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=1) then
    begin
      f_relTitulosAbertos.QRLabel2.Caption:='Relatório de Associados - Boletos Gerados';

      f_relTitulosAbertos.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Analítico - Adimplentes Inativos';

      f_relTitulosAbertos.QuickRep1.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.QRDBText3.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.QRDBText4.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.QRDBText8.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.QRDBText7.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.QRDBText11.DataSet:=f_relTitulosAbertos.q_descricoes;
      f_relTitulosAbertos.Tag:=10;  // Marcação para indicar FONTE do relatorio

      f_relTitulosAbertos.q_descricoes.Close;
      f_relTitulosAbertos.q_descricoes.sql.Clear;
      f_relTitulosAbertos.q_descricoes.sql.add('SELECT');
      f_relTitulosAbertos.q_descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertos.q_descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertos.q_descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_descricoes.sql.add('W_ASSOCIADOS.IDSITUACAO');
      f_relTitulosAbertos.q_descricoes.sql.add('FROM');
      f_relTitulosAbertos.q_descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertos.q_descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_descricoes.sql.add('WHERE');
      f_relTitulosAbertos.q_descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertos.q_descricoes.sql.add('group by');
      f_relTitulosAbertos.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.IDSITUACAO');
      f_relTitulosAbertos.q_descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_descricoes.Parameters[2].Value:=3;
      f_relTitulosAbertos.q_descricoes.Parameters[3].Value:='N';
      f_relTitulosAbertos.q_descricoes.open;

      f_relTitulosAbertos.q_Dados.close;
      f_relTitulosAbertos.q_Dados.SQL.Clear;
      f_relTitulosAbertos.q_Dados.SQL.add('SELECT');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTEMISSAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDTITULO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.VALORDOC,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.ABERTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertos.q_Dados.SQL.add('W_ASSOCIADOS.IDSITUACAO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTPAGAMENTO,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DOCUMENTOBAIXA,');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.TIPOBAIXA');
      f_relTitulosAbertos.q_Dados.SQL.add('FROM');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS');
      f_relTitulosAbertos.q_Dados.SQL.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertos.q_Dados.SQL.add('WHERE');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND TBBOLETOS.IDASSOCIADO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertos.q_Dados.SQL.add('order by');
      f_relTitulosAbertos.q_Dados.SQL.add('TBBOLETOS.NUMDOC desc');
      f_relTitulosAbertos.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertos.q_Dados.Parameters[2].Value:=f_relTitulosAbertos.q_descricoesIDASSOCIADO.Value;
      f_relTitulosAbertos.q_Dados.Parameters[3].Value:='N';
      f_relTitulosAbertos.q_Dados.open;
    end;
    f_relTitulosAbertos.QuickRep1.Preview;
  end else begin
    Application.CreateForm(Tf_relTitulosAbertosSintetico, f_relTitulosAbertosSintetico);

    f_relTitulosAbertosSintetico.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
    f_FiltraPeriodo2.MaskEdit2.Text+' - Sintético - Adimplentes - Ativos';

    if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=0) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=0) then begin;   // SINTETICO - ADIMPLENTES ATIVOS
      f_relTitulosAbertosSintetico.QuickRep1.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.Tag:=10;  // Marcação para indicar FONTE do relatorio
      f_relTitulosAbertosSintetico.q_Descricoes.Close;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.Clear;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('SELECT');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.IDSITUACAO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.SITUACAO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE1,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE2,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CATEGORIA');
//      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.ABERTO');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('FROM');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('WHERE');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('group by');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.IDSITUACAO, W_ASSOCIADOS.SITUACAO, W_ASSOCIADOS.FONE1, W_ASSOCIADOS.FONE2, W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA');
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[2].Value:=2;
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[3].Value:='N';
      f_relTitulosAbertosSintetico.q_Descricoes.open;
    end else if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=1) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=0) then begin;   // INADIMPLENTES ATIVOS
      f_relTitulosAbertosSintetico.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Sintético - Inadimplentes - Ativos';

      f_relTitulosAbertosSintetico.QuickRep1.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.Tag:=10;  // Marcação para indicar FONTE do relatorio
      f_relTitulosAbertosSintetico.q_Descricoes.Close;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.Clear;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('SELECT');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.IDSITUACAO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.SITUACAO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE1,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE2,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CATEGORIA');
//      f_relTitulosAbertos.q_Descricoes.sql.add('TBBOLETOS.ABERTO');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('FROM');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('WHERE');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('group by');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.IDSITUACAO, W_ASSOCIADOS.SITUACAO, W_ASSOCIADOS.FONE1, W_ASSOCIADOS.FONE2, W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA');
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[2].Value:=2;
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[3].Value:='S';
      f_relTitulosAbertosSintetico.q_Descricoes.open;
    end else if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=1) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=1) then begin;   // INADIMPLENTES INATIVOS
      f_relTitulosAbertosSintetico.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Sintético - Inativos - Inadimplentes';

      f_relTitulosAbertosSintetico.QuickRep1.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText3.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText1.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText2.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText4.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText5.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText8.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText9.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText7.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText11.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.Tag:=10;  // Marcação para indicar FONTE do relatorio
      f_relTitulosAbertosSintetico.q_descricoes.Close;
      f_relTitulosAbertosSintetico.q_descricoes.sql.Clear;
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('SELECT');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.SITUACAO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.FONE1,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.FONE2,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.CATEGORIA,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('FROM');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('WHERE');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('group by');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, TBBOLETOS.ABERTO, W_ASSOCIADOS.SITUACAO, W_ASSOCIADOS.FONE1, W_ASSOCIADOS.FONE2, W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA');
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[2].Value:=3;
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[3].Value:='S';
      f_relTitulosAbertosSintetico.q_descricoes.open;
    end else if (f_FiltraPeriodo2.rdgSituacao.ItemIndex=0) and (f_FiltraPeriodo2.rdgAtivos.ItemIndex=1) then begin;   // INADIMPLENTES INATIVOS
      f_relTitulosAbertosSintetico.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Sintético - Inativos Adimplentes';

      f_relTitulosAbertosSintetico.QuickRep1.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText3.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText1.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText2.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText4.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText5.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText8.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText9.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText7.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.QRDBText11.DataSet:=f_relTitulosAbertosSintetico.q_Descricoes;
      f_relTitulosAbertosSintetico.Tag:=10;  // Marcação para indicar FONTE do relatorio
      f_relTitulosAbertosSintetico.q_descricoes.Close;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.Clear;
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('SELECT');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.SITUACAO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE1,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.FONE2,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CATEGORIA,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('FROM');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('WHERE');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('group by');
      f_relTitulosAbertosSintetico.q_Descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, TBBOLETOS.ABERTO, W_ASSOCIADOS.SITUACAO, W_ASSOCIADOS.FONE1, W_ASSOCIADOS.FONE2, W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA');
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[2].Value:=3;
      f_relTitulosAbertosSintetico.q_Descricoes.Parameters[3].Value:='N';
      f_relTitulosAbertosSintetico.q_Descricoes.open;
    end else begin  // SUSPENSOS - SINTÉTICO
      f_relTitulosAbertosSintetico.qrlFiltro.Caption:='Filtro: '+f_FiltraPeriodo2.MaskEdit1.Text+' a '+
      f_FiltraPeriodo2.MaskEdit2.Text+' - Sintético - Suspensos';

      f_relTitulosAbertosSintetico.QuickRep1.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText3.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText1.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText2.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText4.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText5.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText8.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText9.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText7.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.QRDBText11.DataSet:=f_relTitulosAbertosSintetico.q_descricoes;
      f_relTitulosAbertosSintetico.Tag:=10;  // Marcação para indicar FONTE do relatorio
      f_relTitulosAbertosSintetico.q_descricoes.Close;
      f_relTitulosAbertosSintetico.q_descricoes.sql.Clear;
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('SELECT');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('count(TBBOLETOS.NUMDOC) as NTITULOS,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('sum(TBBOLETOS.VALORDOC) as TTITULOS,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS.IDASSOCIADO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.SITUACAO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.FONE1,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.FONE2,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.CATEGORIA,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.CODIGO,');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('FROM');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIADOS.SEQUENCIA)');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('WHERE');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.IDSITUACAO=:d3 AND TBBOLETOS.ABERTO=:d4');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('group by');
      f_relTitulosAbertosSintetico.q_descricoes.sql.add('W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, TBBOLETOS.ABERTO, W_ASSOCIADOS.SITUACAO, W_ASSOCIADOS.FONE1, W_ASSOCIADOS.FONE2, W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA');
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[2].Value:=4;
      f_relTitulosAbertosSintetico.q_descricoes.Parameters[3].Value:='S';
      f_relTitulosAbertosSintetico.q_descricoes.open;
    end;
    f_relTitulosAbertosSintetico.QuickRep1.Preview;
  end;
end;

procedure Tf_MenuPrincipal.Action14Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_RelListaAptosEleicao, f_RelListaAptosEleicao);
  f_RelListaAptosEleicao.q_Dados.Active:=true;
  f_RelListaAptosEleicao.qrlabel8.Caption:='Total de Listados: '+inttostr(f_RelListaAptosEleicao.q_Dados.RecordCount);
  f_RelListaAptosEleicao.QuickRep1.Preview;

end;

procedure Tf_MenuPrincipal.Action15Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_CadUsuariosServicos, f_CadUsuariosServicos);
  f_CadUsuariosServicos.ShowModal;
end;

procedure Tf_MenuPrincipal.Action16Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_BaixaPagtosServicos, f_BaixaPagtosServicos);
  f_BaixaPagtosServicos.ShowModal;
end;

procedure Tf_MenuPrincipal.Action17Execute(Sender: TObject);
begin
  Application.CreateForm(Tf_FiltraPeriodo, f_FiltraPeriodo);
  f_FiltraPeriodo.cbAgrupar.Enabled:=false;
  f_FiltraPeriodo.ShowModal;

  Application.CreateForm(Tf_relRecebimentosServicosAgrupamento, f_relRecebimentosServicosAgrupamento);

  f_relRecebimentosServicosAgrupamento.q_Descricoes.close;
  f_relRecebimentosServicosAgrupamento.q_Descricoes.Parameters[0].Value:=strtodate(lbData1.Caption);
  f_relRecebimentosServicosAgrupamento.q_Descricoes.Parameters[1].Value:=strtodate(lbData2.Caption);
  f_relRecebimentosServicosAgrupamento.q_Descricoes.open;

  f_relRecebimentosServicosAgrupamento.q_Dados.close;
  f_relRecebimentosServicosAgrupamento.q_Dados.Parameters[0].Value:=strtodate(lbData1.Caption);
  f_relRecebimentosServicosAgrupamento.q_Dados.Parameters[1].Value:=strtodate(lbData2.Caption);
  f_relRecebimentosServicosAgrupamento.q_Dados.Parameters[2].Value:=f_relRecebimentosServicosAgrupamento.q_DescricoesIDDESCPADRAO.Value;
  f_relRecebimentosServicosAgrupamento.q_Dados.open;

  f_relRecebimentosServicosAgrupamento.QuickRep1.Preview;
end;

end.

