unit u_BaixaPagtosManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, EditNum, EditNum1, Mask,
  DB, ADODB, DBCtrls, Grids, DBGrids;

type
  Tf_BaixaPagtosManual = class(TForm)
    Panel1: TPanel;
    sbLancar: TBitBtn;
    sbLiberar: TBitBtn;
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
    q_Boletos: TADOQuery;
    q_Recibos: TADOQuery;
    Label11: TLabel;
    btEsc: TButton;
    dblDescPadrao: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    lbFlag: TLabel;
    ckGerarRecibo: TCheckBox;
    q_Debitos: TADOQuery;
    DBGrid1: TDBGrid;
    d_Debitos: TDataSource;
    q_DebitosIDCODIGO: TIntegerField;
    q_DebitosIDTITULO: TIntegerField;
    q_DebitosIDASSOCIADO: TIntegerField;
    q_DebitosDTEMISSAO: TDateField;
    q_DebitosNUMDOC: TStringField;
    q_DebitosDTVENCIMENTO: TDateField;
    q_DebitosVALORDOC: TBCDField;
    q_DebitosABERTO: TStringField;
    q_DebitosDTPAGAMENTO: TDateField;
    q_DebitosACRESCIMO: TBCDField;
    q_DebitosDESCONTO: TBCDField;
    q_DebitosVALORPAGO: TBCDField;
    q_DebitosUSALTERACAO: TIntegerField;
    q_DebitosUSINCLUSAO: TIntegerField;
    q_DebitosDTALTERACAO: TDateField;
    q_DebitosDTINCLUSAO: TDateField;
    Label12: TLabel;
    lbRecibo: TLabel;
    dbgPagtos: TDBGrid;
    q_Pagamentos: TADOQuery;
    d_Pagamentos: TDataSource;
    q_PagamentosIDTITULO: TIntegerField;
    q_PagamentosIDASSOCIADO: TIntegerField;
    q_PagamentosREFERENCIA: TStringField;
    q_PagamentosNUMDOCUMENTO: TStringField;
    q_PagamentosVALORPAGO: TBCDField;
    q_PagamentosIDDESCRICAOPADRAO: TIntegerField;
    q_PagamentosDTPAGAMENTO: TDateField;
    q_PagamentosIDCODIGO: TIntegerField;
    q_PagamentosNRECIBO: TIntegerField;
    Label13: TLabel;
    Button1: TButton;
    Edit1: TEdit;
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
    procedure q_DebitosAfterScroll(DataSet: TDataSet);
    procedure edAcrescimoChange(Sender: TObject);
    procedure edValorPagoExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acExtornarExecute(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
  private
    sFlag:string;
    iFlag:integer;
    vDocumentos:String; // Acumula a numeracao dos doscumentos selecionados para pagto
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BaixaPagtosManual: Tf_BaixaPagtosManual;

implementation

uses u_dados, u_relRecibo, u_AssociadoAcoesEscolha, u_CadDescricaoPadrao,
  u_BuscaRecibo, u_FormLiberacao, u_FormLiberacaoAtivos, u_menuprincipal;

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
  f_BaixaPagtosManual.sbLancar.Enabled:=adi;
  f_BaixaPagtosManual.sbLiberar.Enabled:=alt;
  f_BaixaPagtosManual.sbBuscar.Enabled:=sal;
  f_BaixaPagtosManual.sbRecibo.Enabled:=exc;
  f_BaixaPagtosManual.sbFechar.Enabled:=atu;
end;

procedure Tf_BaixaPagtosManual.acFecharExecute(Sender: TObject);
begin
  close;

end;

procedure Tf_BaixaPagtosManual.acReciboExecute(Sender: TObject);
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

  f_relRecibo.qrlRecebemos.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
  f_relRecibo.qrlRecebemos1.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
  f_relRecibo.qrlRecebemos2.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';

  if f_BaixaPagtosManual.RadioGroup1.ItemIndex=0 then begin
    f_relRecibo.qrlReferente.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente1.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
    f_relRecibo.qrlReferente2.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text;
  end else begin
    f_relRecibo.qrlReferente.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text+' - Doc '+vDocumentos;
    f_relRecibo.qrlReferente1.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text+' - Doc '+vDocumentos;
    f_relRecibo.qrlReferente2.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - '+edReferencia.Text+' - '+dblDescPadrao.Text+' - Doc '+vDocumentos;
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

procedure Tf_BaixaPagtosManual.acProcurarExecute(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then begin
    with dm_dados.q_Titulos do begin
      close;
      sql.Clear;
      sql.add('SELECT NUMEROACAO, IDASSOCIADO, ASSOCIADO, VALORACAO, ATIVA, IDREGCADASSOCIADOS, TITULOSDEB, TIPOTITULO');
      sql.add('FROM W_ASSOCIADOSACOES');
      if ExisteInt(edDocumento.Text) then begin
        sql.add('WHERE NUMEROACAO=:s');
        Parameters[0].value:=strtoint(eddocumento.Text);
      end else begin
        sql.add('WHERE ASSOCIADO like :s');
        Parameters[0].value:='%'+eddocumento.Text+'%';
      end;
      open;
    end;

    if dm_dados.q_Titulos.RecordCount>1 then begin
      Application.CreateForm(Tf_AssociadoAcoesEscolha, f_AssociadoAcoesEscolha);
      f_AssociadoAcoesEscolha.ShowModal;
    end;

    if dm_dados.q_Titulos.RecordCount=0 then
      showmessage('ERRO: Não existe a Ação informada.')
    else begin
      mmDados.Lines.clear;
      mmDados.Lines.Add(dm_dados.q_TitulosASSOCIADO.value+'  Título: '+inttostr(dm_dados.q_TitulosNUMEROACAO.value));
      mmDados.Lines.add('Ativa : '+dm_dados.q_TitulosATIVA.value);

      if dm_dados.q_TitulosTITULOSDEB.value>0 then begin
        RadioGroup1.ItemIndex:=1;
        RadioGroup1.Enabled:=false;
        mmDados.Lines.add(inttostr(dm_Dados.q_TitulosTITULOSDEB.value)+' ABERTOS');

        q_Debitos.close;
        q_Debitos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
        q_Debitos.open;

        edAcrescimo.Enabled:=true;
        edDesconto.Enabled:=true;

        panel3.Enabled:=true;

      end else begin
        RadioGroup1.ItemIndex:=0;
        RadioGroup1.Enabled:=true;
        panel3.Enabled:=false;
        mmDados.Lines.add('NÃO HÁ BOLETOS EM ABERTO');
        q_Debitos.Close;
        edAcrescimo.Enabled:=false;
        edDesconto.Enabled:=false;
      end;

      mkDtBaixa.Text:=datetostr(date);
      mkDtPagto.Text:=datetostr(date);
      mkDtBaixa.Enabled:=false;
      mkVencimento.Enabled:=false;
      edValorDoc.Enabled:=false;
      edReferencia.SetFocus;
      if dm_dados.q_TitulosATIVA.value='S' then botoes(true,true,false,false,true) // Restaura situação dos Botões
      else botoes(false,true,false,false,true); // Restaura situação dos Botões
    end;

    q_Pagamentos.close;
    q_Pagamentos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
    q_Pagamentos.open;
    if q_pagamentos.RecordCount>0 then dbgPagtos.Visible:=true
    else dbgPagtos.Visible:=false;

  end else begin
    showmessage('INFORMAÇÃO: Procedimento nao implementado nesse sistema.');
  end;
end;

procedure Tf_BaixaPagtosManual.btEscClick(Sender: TObject);
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
  label13.Caption:='Linhas Selecionadas:';
  q_Debitos.close;
  botoes(false,false,true,false,true); // Restaura situação dos Botões
end;

procedure Tf_BaixaPagtosManual.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then selectnext(activecontrol,true,true);
  if key=#27 then btEsc.Click;
end;

procedure Tf_BaixaPagtosManual.FormCreate(Sender: TObject);
begin
  iFlag:=0;
end;

procedure Tf_BaixaPagtosManual.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadDescricaoPadrao, f_CadDescricaoPadrao);
  f_CadDescricaoPadrao.ShowModal;
end;

procedure Tf_BaixaPagtosManual.acLancarExecute(Sender: TObject);
var
  i,vRecibo:integer;
begin
  if sbLancar.Enabled=false then exit;

  vDocumentos:='';

  if (edAcrescimo.Enabled) and (edValorPago.Text<>lbAPagar.Caption) then begin
    showmessage('ERRO: Valores divergem.');
    edAcrescimo.SetFocus;
    exit;
  end;

	for i := 0 to DBGrid1.SelectedRows.Count - 1 do
  begin
    if q_DebitosABERTO.Value='N' then begin
      showmessage('ERRO: Ha título já BAIXADO entre os selecionados.');
      exit;
    end;
  end;

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

  if q_Debitos.Prepared then begin
    if (q_DebitosABERTO.Value='N') and (dm_dados.q_DescPadraoIDCODIGO.value=2) then begin  // PAGTO MENSALIDADE
      showmessage('ERRO: O boleto selecionado NÃO está disponível para baixa.'+#13+'Selecione o boleto correto.');
      DBGrid1.SetFocus;
      exit;
    end;
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

  if RadioGroup1.ItemIndex=0 then begin

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
        sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
        sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
        sql.add('usinclusao, usalteracao, dtbaixa, menspgclube)');
        sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u)');
        Parameters[0].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
        Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
        Parameters[2].value:=strtoint(trim(copy(mkDtPagto.Text,7,4)+copy(mkDtPagto.Text,4,2)));
        Parameters[3].value:=edReferencia.Text;
        Parameters[4].value:=strtodate(mkDtPagto.Text);
        Parameters[5].value:='TITULO';
        Parameters[6].value:=0;
        Parameters[7].value:=1;                                 // forma pagto BAIXA SECRETARIA
        Parameters[8].value:=0;                                 // acrescimo
        Parameters[9].value:=0;                                 // desconto
        if lbAPagar.Caption='0,00' then       // indica que NAO JA TITULOS EM ABERTO
          Parameters[10].value:=strtofloat(edValorPago.Text)
        else
          Parameters[10].value:=q_DebitosVALORDOC.Value;
        Parameters[11].value:=0;
        Parameters[12].value:=dblDescPadrao.KeyValue;
        Parameters[13].value:=vRecibo;
        Parameters[14].value:=1;
        Parameters[15].value:=1;
        Parameters[16].value:=strtodate(mkDtBaixa.Text);
        if (dblDescPadrao.KeyValue=2) AND (dm_dados.q_TitulosTITULOSDEB.value=0) then
          Parameters[17].value:=1  // Pagto mensalidade - Identificação
        else Parameters[17].value:=0;                             // para uso em q_pagamentos
        execsql;
      end;
    // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
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
      end;
    sbRecibo.Enabled:=true;
    if ckGerarRecibo.Checked then begin
      showmessage('INFORMAÇÃO: Registro lançado, será impresso o recibo.');
      sbRecibo.Click;
    end else showmessage('INFORMAÇÃO: Registro lançado.');
  end else begin

  	for i := 0 to DBGrid1.SelectedRows.Count - 1 do
	  begin
      d_Debitos.DataSet.Bookmark:=DBGrid1.SelectedRows[i];

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
        sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
        sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
        sql.add('usinclusao, usalteracao, idregboleto,dtbaixa, menspgclube)');
        sql.add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u)');
        Parameters[0].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
        Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
        Parameters[2].value:=strtoint(trim(copy(mkDtPagto.Text,7,4)+copy(mkDtPagto.Text,4,2)));
        Parameters[3].value:=edReferencia.Text;
        Parameters[4].value:=strtodate(mkDtPagto.Text);
        Parameters[5].value:=q_DebitosNUMDOC.value;
        Parameters[6].value:=q_DebitosVALORDOC.value;
        Parameters[7].value:=1;                                             // forma pagto BAIXA SECRETARIA
        Parameters[8].value:=strtofloat(edAcrescimo.Text);                  // acrescimo
        Parameters[9].value:=strtofloat(edDesconto.Text);                   // desconto
//        Parameters[10].value:=strtofloat(edValorPago.Text);
        Parameters[10].value:=q_DebitosVALORDOC.Value;
        Parameters[11].value:=0;
        Parameters[12].value:=dblDescPadrao.KeyValue;
        Parameters[13].value:=vRecibo;
        Parameters[14].value:=1;
        Parameters[15].value:=1;
        Parameters[16].value:=q_DebitosIDCODIGO.value;
        Parameters[17].value:=strtodate(mkDtBaixa.Text);
        if dblDescPadrao.KeyValue=2 then Parameters[18].value:=1  // Pagto mensalidade - Identificação
        else Parameters[18].value:=0;                             // para uso em q_pagamentos
        execsql;
      end;

      // ATUALIZA SITUACAO DO BOLETO
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbboletos set aberto=:c');
        sql.add('WHERE idcodigo=:d');
        Parameters[0].value:='N';
        Parameters[1].value:=q_DebitosIDCODIGO.value;
        execsql;
      end;

      vDocumentos:=f_BaixaPagtosManual.q_DebitosNUMDOC.Value+' '+vDocumentos;

    end;
    // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociados set ASSULTPAG=:c, ULTIMOPAGTO=:d');
      sql.add('WHERE asscod=:d');
      Parameters[0].value:=strtodate(mkDtPagto.Text);
      Parameters[1].value:=edReferencia.Text;
      Parameters[2].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    sbRecibo.Enabled:=true;
    if ckGerarRecibo.Checked then begin
      showmessage('INFORMAÇÃO: Registro lançado, será impresso o recibo.');
      sbRecibo.Click;
    end else showmessage('INFORMAÇÃO: Registro lançado.');
    q_Debitos.close;
    q_Debitos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
    q_Debitos.open;
  end;
  btEsc.Click;
  dm_Dados.q_Configuracoes.Close;
  label13.Caption:='';
end;

procedure Tf_BaixaPagtosManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_BaixaPagtosManual.acBuscarExecute(Sender: TObject);
begin
  if sbBuscar.Enabled=false then exit;
  Application.CreateForm(Tf_BuscaRecibo, f_BuscaRecibo);
  f_BuscaRecibo.Tag:=10;  // Libera o form a retornar valores para esse form
  f_BuscaRecibo.ShowModal;
  botoes(false,false,true,true,true); // Restaura situação dos Botões
end;

procedure Tf_BaixaPagtosManual.q_DebitosAfterScroll(DataSet: TDataSet);
begin
  mkvencimento.Text:=datetostr(q_DebitosDTVENCIMENTO.Value);
  edValorDoc.Text:=floattostr(q_DebitosVALORDOC.Value);
//  lbAPagar.Caption:=floattostrf(q_DebitosVALORDOC.Value,ffnumber,10,2);
end;

procedure Tf_BaixaPagtosManual.edAcrescimoChange(Sender: TObject);
begin
  try
  lbAPagar.Caption:=floattostrf((strtofloat(edValorDoc.Text)-strtofloat(edDesconto.Text))+strtofloat(edAcrescimo.Text),ffnumber,10,2);
  except
    lbAPagar.Caption:=edValorDoc.Text;
  end;
end;

procedure Tf_BaixaPagtosManual.edValorPagoExit(Sender: TObject);
begin
  if (edAcrescimo.Enabled) and (edValorPago.Text<>lbAPagar.Caption) then begin
    showmessage('ERRO: Valores divergem.');
    edAcrescimo.SetFocus;
  end;
end;

procedure Tf_BaixaPagtosManual.DBGrid1CellClick(Column: TColumn);
var
	i: Integer;
	vValor: real;
begin
//  cont:=0;
	for i := 0 to DBGrid1.SelectedRows.Count - 1 do
	begin
    d_Debitos.DataSet.Bookmark:=DBGrid1.SelectedRows[i];
    vValor:=vValor+q_DebitosVALORDOC.Value;
		//ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
		//aux := aux + IntToStr(ClientDataSet1.RecNo) + ' - ' +
		//ClientDataSet1.FieldByName('CUSTOMER').AsString + #13;
	end;
	label13.Caption:='Linhas selecionadas: ' + inttostr(i);
  lbAPagar.Caption:=floattostrf(vValor,ffnumber,10,2);

  edReferencia.SetFocus;

end;

procedure Tf_BaixaPagtosManual.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (q_DebitosABERTO.value='S') then begin
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clred;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  if (q_DebitosABERTO.value='N') then begin
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clBlue;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tf_BaixaPagtosManual.acExtornarExecute(Sender: TObject);
var
  vDebito:real;
  vRegistro:TBookmark;
  opc:integer;
begin
  if sbLiberar.Enabled=false then exit;

  if (dm_Dados.q_TitulosTITULOSDEB.Value=0) and (dm_dados.q_TitulosATIVA.value='N') then begin
    opc:=application.messagebox('Confirma ATIVAÇÃO SIMPLES do registro ? ','Confirmação',mb_yesno);
    if opc=idyes then begin
      // Altera situaçãono cadastro do associado
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbassociados set asssit=:c where asscod=:d ');
        Parameters[0].Value:=2;
        Parameters[1].Value:=dm_dados.q_TitulosNUMEROACAO.Value;
        ExecSQL;
      end;
      // Altera situação no cadastro das Acoes do Associado
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbassociadosacoes set ativa=:c where idcodigo=:d ');
        Parameters[0].Value:='S';
        Parameters[1].Value:=dm_dados.q_TitulosNUMEROACAO.Value;
        ExecSQL;
      end;
      btProcurar.Click;
      ShowMessage('INFORMAÇÃO: Operação concluida.');
    end else ShowMessage('INFORMAÇÃO: Operação abortada, registro ainda INATIVO.');
    exit;
  end;

  if dm_dados.q_TitulosATIVA.value='N' then begin

    f_BaixaPagtosManual.Hide;
    vDebito:=0;

    Application.CreateForm(Tf_FormLiberacao, f_FormLiberacao);
    f_FormLiberacao.lbTitulo.Caption:=inttostr(dm_Dados.q_TitulosNUMEROACAO.value);
    f_FormLiberacao.lbAssociado.Caption:=dm_Dados.q_TitulosASSOCIADO.value;
    case dm_Dados.q_TitulosTIPOTITULO.value of
      2:f_FormLiberacao.lbCategoria.Caption:='CONTRIBUINTE';
      3:f_FormLiberacao.lbCategoria.Caption:='JUVENAL';
      4:f_FormLiberacao.lbCategoria.Caption:='PROPRIETÁRIO';
      5:f_FormLiberacao.lbCategoria.Caption:='REMIDO';
    end;
    f_FormLiberacao.lbSituacao.Caption:=dm_Dados.q_TitulosATIVA.value;

    if dm_Dados.q_TitulosTITULOSDEB.Value>0 then begin
      q_Debitos.First;
      while not q_debitos.Eof do begin
        if q_DebitosABERTO.Value='S' then vDebito:=vDebito+q_DebitosVALORDOC.Value;
        q_Debitos.Next;
      end;
      f_FormLiberacao.lbPrestacoes.Caption:=inttostr(q_Debitos.RecordCount);
    end else f_FormLiberacao.lbPrestacoes.Caption:='0';

    if dm_Dados.q_TitulosATIVA.value='S' then begin
      f_FormLiberacao.lbValorReativar.Caption:='R$ 0,00';
      f_FormLiberacao.lbGeral.Caption:=floattostrf(vDebito,ffnumber,10,2);
    end else begin
      f_FormLiberacao.lbValorReativar.Caption:='R$'+floattostrf(dm_Dados.q_ConfiguracoesVALORREATIVACAO.Value,ffnumber,10,2);
      f_FormLiberacao.lbGeral.Caption:=floattostrf(vDebito+dm_Dados.q_ConfiguracoesVALORREATIVACAO.Value,ffnumber,10,2);
    end;

    f_FormLiberacao.lbValorTotal.Caption:=floattostrf(vDebito,ffnumber,10,2);
    f_FormLiberacao.lbData.Caption:=datetostr(now);

    f_FormLiberacao.ShowModal;
    f_BaixaPagtosManual.Show;
  end else begin
    Application.CreateForm(Tf_FormLiberacaoAtivos, f_FormLiberacaoAtivos);
    f_FormLiberacaoAtivos.lbTitulo.Caption:=inttostr(dm_Dados.q_TitulosNUMEROACAO.value);
    f_FormLiberacaoAtivos.lbAssociado.Caption:=dm_Dados.q_TitulosASSOCIADO.value;
    case dm_Dados.q_TitulosTIPOTITULO.value of
      2:f_FormLiberacaoAtivos.lbCategoria.Caption:='CONTRIBUINTE';
      3:f_FormLiberacaoAtivos.lbCategoria.Caption:='JUVENAL';
      4:f_FormLiberacaoAtivos.lbCategoria.Caption:='PROPRIETÁRIO';
      5:f_FormLiberacaoAtivos.lbCategoria.Caption:='REMIDO';
    end;
    f_FormLiberacaoAtivos.lbSituacao.Caption:=dm_Dados.q_TitulosATIVA.value;

    if dm_Dados.q_TitulosTITULOSDEB.Value>0 then begin
      vRegistro:=q_Debitos.GetBookmark;
      q_Debitos.First;
      while not q_debitos.Eof do begin
        if q_DebitosABERTO.Value='S' then vDebito:=vDebito+q_DebitosVALORDOC.Value;
        q_Debitos.Next;
      end;
      q_Debitos.GotoBookmark(vRegistro);
      q_Debitos.freeBookmark(vRegistro);
      f_FormLiberacaoAtivos.lbPrestacoes.Caption:=inttostr(q_Debitos.RecordCount);
    end else f_FormLiberacaoAtivos.lbPrestacoes.Caption:='0';

    if dm_Dados.q_TitulosATIVA.value='S' then begin
      f_FormLiberacaoAtivos.lbValorReativar.Caption:='R$ 0,00';
      f_FormLiberacaoAtivos.lbGeral.Caption:=floattostrf(vDebito,ffnumber,10,2);
    end else begin
      f_FormLiberacaoAtivos.lbValorReativar.Caption:='R$'+floattostrf(dm_Dados.q_ConfiguracoesVALORREATIVACAO.Value,ffnumber,10,2);
      f_FormLiberacaoAtivos.lbGeral.Caption:=floattostrf(vDebito+dm_Dados.q_ConfiguracoesVALORREATIVACAO.Value,ffnumber,10,2);
    end;

    f_FormLiberacaoAtivos.lbValorTotal.Caption:=floattostrf(vDebito,ffnumber,10,2);
    f_FormLiberacaoAtivos.lbData.Caption:=datetostr(now);

    if q_DebitosABERTO.Value='N' then f_FormLiberacaoAtivos.btLibera.Enabled:=false
    else f_FormLiberacaoAtivos.btLibera.Enabled:=true;

    f_FormLiberacaoAtivos.ShowModal;
  end;
end;

procedure Tf_BaixaPagtosManual.RadioGroup1Click(Sender: TObject);
begin
  edDocumento.SetFocus;
end;

procedure Tf_BaixaPagtosManual.FormShow(Sender: TObject);
begin
  // QQ outro form que altear a propriedade, força reconsulta
  if f_BaixaPagtosManual.tag=100 then begin
    f_BaixaPagtosManual.tag:=0;
    btProcurar.Click;
  end;
end;

procedure Tf_BaixaPagtosManual.Button1Click(Sender: TObject);
begin
  with dm_Dados.q_manipula do begin
    close;
    sql.clear;
    sql.add('update tbassociados set asssit=:d where asscod=:c');

    if edit1.Text='C' then Parameters[0].Value:=3
    else if edit1.Text='S' then Parameters[0].Value:=4;
    Parameters[1].Value:=strtoint(eddocumento.Text);
    execsql;
  end;

  with dm_Dados.q_manipula do begin
    close;
    sql.clear;
    sql.add('update tbassociadosacoes set ativa=:d where idcodigo=:c');
    Parameters[0].Value:='N';
    Parameters[1].Value:=strtoint(eddocumento.Text);
    execsql;
  end;

  btprocurar.Click;
  edDocumento.SetFocus;
  
end;

procedure Tf_BaixaPagtosManual.edDescontoExit(Sender: TObject);
var
  i:integer;
	vValor: real;
begin
	for i := 0 to DBGrid1.SelectedRows.Count - 1 do
	begin
    d_Debitos.DataSet.Bookmark:=DBGrid1.SelectedRows[i];
    vValor:=vValor+q_DebitosVALORDOC.Value;
	end;
  vValor:=(vValor-strtofloat(edDesconto.Text))+strtofloat(edAcrescimo.Text);
	label13.Caption:='Linhas selecionadas: ' + inttostr(i);
  lbAPagar.Caption:=floattostrf(vValor,ffnumber,10,2);

end;

end.
