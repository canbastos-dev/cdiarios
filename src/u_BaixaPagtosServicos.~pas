unit u_BaixaPagtosServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, EditNum, EditNum1, Mask,
  DB, ADODB, DBCtrls, Grids, DBGrids;

type
  Tf_BaixaPagtosServicos = class(TForm)
    Panel1: TPanel;
    sbRecibo: TBitBtn;
    sbFechar: TBitBtn;
    ActionList1: TActionList;
    acProcurar: TAction;
    acLancar: TAction;
    acRecibo: TAction;
    acFechar: TAction;
    sbBuscar: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    edDocumento: TEdit;
    btProcurar: TBitBtn;
    acExtornar: TAction;
    acBuscar: TAction;
    mmDados: TMemo;
    Panel2: TPanel;
    Label2: TLabel;
    mkDtBaixa: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    edValorDoc: TEditNum1;
    mkVencimento: TMaskEdit;
    edReferencia: TEdit;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mkDtPagto: TMaskEdit;
    edAcrescimo: TEditNum1;
    edDesconto: TEditNum1;
    edValorPago: TEditNum1;
    lbAPagar: TLabel;
    Label11: TLabel;
    btEsc: TButton;
    dblDescPadrao: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    lbFlag: TLabel;
    ckGerarRecibo: TCheckBox;
    Label12: TLabel;
    lbRecibo: TLabel;
    dbgPagtos: TDBGrid;
    q_Pagamentos: TADOQuery;
    d_Pagamentos: TDataSource;
    q_Dados: TADOQuery;
    q_DadosIDCODIGO: TIntegerField;
    q_DadosIDTIPOSERVICO: TIntegerField;
    q_DadosIDTIPOUSUARIO: TIntegerField;
    q_DadosNOME: TStringField;
    q_DadosDTNASCIMENTO: TDateField;
    q_DadosSEXO: TStringField;
    q_DadosTELEFONEFIXO: TStringField;
    q_DadosTELEFONECEL: TStringField;
    q_DadosEMAIL: TStringField;
    q_DadosTELEFONECEL2: TStringField;
    q_DadosENDERECO: TStringField;
    q_DadosIDBAIRRO: TIntegerField;
    q_DadosIDMUNICIPIO: TIntegerField;
    q_DadosCEP: TStringField;
    q_DadosIDUF: TIntegerField;
    q_DadosDIAVENCTO: TIntegerField;
    q_DadosRG: TStringField;
    q_DadosCPF: TStringField;
    q_DadosIDSITUACAO: TIntegerField;
    q_DadosSERVICO: TStringField;
    q_DadosTIPO: TStringField;
    q_DadosSITUACAO: TStringField;
    q_DadosTITULO: TIntegerField;
    sbLancar: TBitBtn;
    q_PagamentosSEQUENCIA: TIntegerField;
    q_PagamentosTITULO: TIntegerField;
    q_PagamentosIDASSOCIADO: TIntegerField;
    q_PagamentosREFERENCIA: TStringField;
    q_PagamentosDOCUMENTO: TStringField;
    q_PagamentosVALORPAGO: TBCDField;
    q_PagamentosDTPAGAMENTO: TDateField;
    q_PagamentosIDDESCPADRAO: TIntegerField;
    q_PagamentosDESCRICAOPADRAO: TStringField;
    q_PagamentosNUMRECIVO: TIntegerField;
    mmObservacoes: TMemo;
    q_PagamentosOBSERVACAO: TMemoField;
    procedure acFecharExecute(Sender: TObject);
    procedure acReciboExecute(Sender: TObject);
    procedure acProcurarExecute(Sender: TObject);
    procedure btEscClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure acLancarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acBuscarExecute(Sender: TObject);
    procedure edAcrescimoChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPagtosCellClick(Column: TColumn);
  private
    sFlag:string;
    iFlag:integer;
    vDocumentos:String; // Acumula a numeracao dos doscumentos selecionados para pagto
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BaixaPagtosServicos: Tf_BaixaPagtosServicos;

implementation

uses u_dados, u_relRecibo, u_AssociadoAcoesEscolha, u_CadDescricaoPadrao,
  u_BuscaRecibo, u_menuprincipal;

{$R *.dfm}

function ExisteInt(Texto:String): Boolean;
{Testa se em uma string existe um numero inteiro valido ou não}
var
i:integer;
begin
try
  i := StrToInt(Texto);
  Result := True;
except
  Result := False;
end;
end;

function botoes(adi: Boolean; alt: Boolean; sal: Boolean; exc: Boolean; atu: Boolean): Boolean;
begin
  f_BaixaPagtosServicos.sbLancar.Enabled:=adi;
  f_BaixaPagtosServicos.sbBuscar.Enabled:=sal;
  f_BaixaPagtosServicos.sbRecibo.Enabled:=exc;
  f_BaixaPagtosServicos.sbFechar.Enabled:=atu;
end;

procedure Tf_BaixaPagtosServicos.acFecharExecute(Sender: TObject);
begin
  close;

end;

procedure Tf_BaixaPagtosServicos.acReciboExecute(Sender: TObject);
begin
  if sbRecibo.Enabled=false then exit;

  Application.CreateForm(Tf_relRecibo, f_relRecibo);
  f_relRecibo.qrlRecibo.Caption:=lbFlag.Caption;
  f_relRecibo.qrlRecibo1.Caption:=lbFlag.Caption;
  f_relRecibo.qrlRecibo2.Caption:=lbFlag.Caption;

  f_relRecibo.ValorPorExtenso1.Valor:=strtofloat(edValorPago.Text);

  f_relRecibo.qrlValor.Caption:=edValorPago.Text;
  f_relRecibo.qrlValor1.Caption:=edValorPago.Text;
  f_relRecibo.qrlValor2.Caption:=edValorPago.Text;
  f_relRecibo.ValorPorExtenso1.Valor:=strtofloat(edValorPago.Text);

  f_relRecibo.qrlRecebemos.Caption:=q_DadosNOME.value+' - ';
  f_relRecibo.qrlRecebemos1.Caption:=q_DadosNOME.value+' - ';
  f_relRecibo.qrlRecebemos2.Caption:=q_DadosNOME.value+' - ';

  if q_DadosIDTIPOUSUARIO.Value=0 then begin
    f_relRecibo.qrlReferente.Caption:='Título Nº '+inttostr(q_DadosTITULO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente1.Caption:='Título Nº '+inttostr(q_DadosTITULO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente2.Caption:='Título Nº '+inttostr(q_DadosTITULO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
  end else begin
    f_relRecibo.qrlReferente.Caption:='Codigo Nº '+inttostr(q_DadosIDCODIGO.value)+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente1.Caption:='Codigo Nº '+inttostr(q_DadosIDCODIGO.value)+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente2.Caption:='Codigo Nº '+inttostr(q_DadosIDCODIGO.value)+edReferencia.Text+' - '+dblDescPadrao.Text;
  end;
  f_relRecibo.qrlLocalData.Caption:='Fortaleza/CE, '+datetostr(now);
  f_relRecibo.qrlLocalData1.Caption:='Fortaleza/CE, '+datetostr(Now);
  f_relRecibo.qrlLocalData2.Caption:='Fortaleza/CE, '+datetostr(Now);

  f_relRecibo.QRLabel38.Caption:=f_MenuPrincipal.Label2.Caption;
  f_relRecibo.QRLabel30.Caption:='Via Caixa - Op '+f_MenuPrincipal.Label2.Caption;
  f_relRecibo.QRLabel36.Caption:='Via Arquivo - Op '+f_MenuPrincipal.Label2.Caption;

  f_relRecibo.QuickRep1.Preview;
  botoes(false,false,true,false,true); // Restaura situação dos Botões
  close;
end;

procedure Tf_BaixaPagtosServicos.acProcurarExecute(Sender: TObject);
begin
  q_Pagamentos.close;
  
  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT IDCODIGO, IDTIPOSERVICO, IDTIPOUSUARIO, NOME, DTNASCIMENTO, SEXO, ');
  q_dados.SQL.add('TELEFONEFIXO, TELEFONECEL, EMAIL, TELEFONECEL2, ENDERECO, IDBAIRRO, ');
  q_dados.SQL.add('IDMUNICIPIO, CEP, IDUF, DIAVENCTO, RG, CPF, SERVICO, TIPO, SITUACAO, IDSITUACAO, TITULO');
  q_dados.SQL.add('FROM W_SERVICOS');
  case RadioGroup1.ItemIndex of
    0:begin; q_dados.SQL.Add('WHERE upper(NOME) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(eddocumento.Text)+'%'; end;
    1:begin; q_dados.SQL.Add('WHERE CPF=:c'); q_Dados.Parameters[0].Value:=eddocumento.Text; end;
  end;
  q_dados.SQL.add('ORDER BY NOME');
  q_Dados.open;

  if q_Dados.RecordCount=0 then
    showmessage('ERRO: Não existe o USUARIO informado.')
  else begin
    mmDados.Lines.clear;
    mmDados.Lines.Add(q_DadosNOME.value+'  CPF: '+q_DadosCPF.Value);
    mmDados.Lines.add('Tipo :'+q_DadosTIPO.Value+'   Servico:'+q_DadosSERVICO.Value);
    mmDados.Lines.add('Ativa : '+q_DadosSITUACAO.value);

    mkDtBaixa.Text:=datetostr(date);
    mkDtPagto.Text:=datetostr(date);
    mkDtBaixa.Enabled:=false;
    mkVencimento.Enabled:=false;
    edValorDoc.Enabled:=false;
    edReferencia.SetFocus;

    q_Pagamentos.close;
    q_Pagamentos.Parameters[0].Value:=q_DadosIDCODIGO.Value;
    q_Pagamentos.Open;
  end;
end;

procedure Tf_BaixaPagtosServicos.btEscClick(Sender: TObject);
begin
  edDocumento.Text:='';
  edReferencia.Text:='';
  dblDescPadrao.KeyValue:=0;
  edValorDoc.Text:='0';
  lbAPagar.Caption:='0,00';
  edValorPago.Text:='0';
  edDesconto.Text:='0';
  edAcrescimo.Text:='0';
  mmDados.Lines.Clear;
  mkDtBaixa.Text:='';
  mkDtPagto.Text:='';
  mkVencimento.Text:='';
  mkDtBaixa.Enabled:=true;
  mkVencimento.Enabled:=true;
  edValorDoc.Enabled:=true;
  edDocumento.SetFocus;
  RadioGroup1.Enabled:=true;
  RadioGroup1.ItemIndex:=0;
  lbRecibo.Caption:='';
  q_Pagamentos.close;
  mmObservacoes.Lines.Clear;
  botoes(true,false,true,false,true); // Restaura situação dos Botões
end;

procedure Tf_BaixaPagtosServicos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then selectnext(activecontrol,true,true);
  if key=#27 then btEsc.Click;
end;

procedure Tf_BaixaPagtosServicos.FormCreate(Sender: TObject);
begin
//  iFlag:=0;
end;

procedure Tf_BaixaPagtosServicos.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadDescricaoPadrao, f_CadDescricaoPadrao);
  f_CadDescricaoPadrao.ShowModal;
end;

procedure Tf_BaixaPagtosServicos.acLancarExecute(Sender: TObject);
var
  i,vRecibo:integer;
begin
  if sbLancar.Enabled=false then exit;

  vDocumentos:='';

  if dblDescPadrao.KeyValue=null then begin
    showmessage('ERRO: Informe a Descrição do Pagamento.');
    dblDescPadrao.SetFocus;
    exit;
  end;

  if strtofloat(edValorPago.Text)=0 then begin
    showmessage('ERRO: Informe a Valor do Pagamento.');
    edValorPago.SetFocus;
    exit;
  end;

  if ckGerarRecibo.Checked then begin
    dm_Dados.q_Configuracoes.open;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbconfiguracoes set numrecibo=:c');
      Parameters[0].value:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
      execsql;
    end;
    vrecibo:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
    lbFlag.Caption:=inttostr(dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1);
  end else vRecibo:=0;

  with dm_Dados.q_manipula do begin
    close;
    sql.Clear;
    sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
    sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
    sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
    sql.add('usinclusao, usalteracao, dtbaixa, menspgclube, obs_pagto)');
    sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v)');
    if q_DadosIDTIPOUSUARIO.Value=0 then Parameters[0].value:='999999'    // NAO SOCIO
    else Parameters[0].value:=q_DadosTITULO.Value;
    Parameters[1].value:=q_DadosIDCODIGO.Value;
    Parameters[2].value:=strtoint(trim(copy(mkDtPagto.Text,7,4)+copy(mkDtPagto.Text,4,2)));
    Parameters[3].value:=edReferencia.Text;
    Parameters[4].value:=strtodate(mkDtPagto.Text);
    Parameters[5].value:='SERVICO';
    Parameters[6].value:=0;
    Parameters[7].value:=1;                                 // forma pagto BAIXA SECRETARIA
    Parameters[8].value:=0;                                 // acrescimo
    Parameters[9].value:=0;                                 // desconto
    Parameters[10].value:=strtofloat(edValorPago.Text);
    Parameters[11].value:=0;
    Parameters[12].value:=dblDescPadrao.KeyValue;
    Parameters[13].value:=vRecibo;
    Parameters[14].value:=1;
    Parameters[15].value:=1;
    Parameters[16].value:=strtodate(mkDtBaixa.Text);
    Parameters[17].value:=9;                             // para uso em q_pagamentos
    Parameters[18].Value:=mmObservacoes.Lines.Text;
    execsql;
  end;

  q_Pagamentos.close;
  q_Pagamentos.Parameters[0].Value:=q_DadosIDCODIGO.Value;
  q_Pagamentos.Open;

{  // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
  if dm_Dados.q_DescPadraoIDDOTACAO.Value=99 then
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociados set ASSULTPAG=:c, ULTIMOPAGTO=:d');
      sql.add('WHERE asscod=:z');
      Parameters[0].value:=strtodate(mkDtPagto.Text);
      Parameters[1].value:=edReferencia.Text;
      Parameters[2].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;  }
  sbRecibo.Enabled:=true;

  if ckGerarRecibo.Checked then begin
    showmessage('INFORMAÇÃO: Registro lançado, será impresso o recibo.');
    sbRecibo.Click;
  end else showmessage('INFORMAÇÃO: Registro lançado.');

  sbRecibo.Enabled:=true;

  btEsc.Click;
  dm_Dados.q_Configuracoes.Close;
end;

procedure Tf_BaixaPagtosServicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_BaixaPagtosServicos.acBuscarExecute(Sender: TObject);
begin
  if sbBuscar.Enabled=false then exit;
  Application.CreateForm(Tf_BuscaRecibo, f_BuscaRecibo);
  f_BuscaRecibo.Tag:=20;
  f_BuscaRecibo.ShowModal;
  botoes(false,false,true,true,true); // Restaura situação dos Botões
end;

procedure Tf_BaixaPagtosServicos.edAcrescimoChange(Sender: TObject);
begin
  try
  lbAPagar.Caption:=floattostrf((strtofloat(edValorDoc.Text)-strtofloat(edDesconto.Text))+strtofloat(edAcrescimo.Text),ffnumber,10,2);
  except
    lbAPagar.Caption:=edValorDoc.Text;
  end;
end;

procedure Tf_BaixaPagtosServicos.RadioGroup1Click(Sender: TObject);
begin
  edDocumento.SetFocus;
end;

procedure Tf_BaixaPagtosServicos.FormShow(Sender: TObject);
begin
  // QQ outro form que altear a propriedade, força reconsulta
  if f_BaixaPagtosServicos.tag=100 then begin
    f_BaixaPagtosServicos.tag:=0;
    btProcurar.Click;
  end;
end;

procedure Tf_BaixaPagtosServicos.dbgPagtosCellClick(Column: TColumn);
begin
  mmObservacoes.Lines.Clear;
  mmObservacoes.Lines.Text:=q_PagamentosOBSERVACAO.Value;
end;

end.
