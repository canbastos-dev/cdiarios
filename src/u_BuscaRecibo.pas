unit u_BuscaRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  Tf_BuscaRecibo = class(TForm)
    DBGrid1: TDBGrid;
    q_Dados: TADOQuery;
    d_Dados: TDataSource;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    edPesquisar: TEdit;
    BitBtn2: TBitBtn;
    btFormulario: TBitBtn;
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
    q_DadosREGBOLETO: TIntegerField;
    BitBtn3: TBitBtn;
    q_DadosDTBAIXA: TDateField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btFormularioClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure q_DadosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BuscaRecibo: Tf_BuscaRecibo;

implementation

uses u_dados, u_BaixaPagtosManual, u_BaixaPagtosServicos;
{$R *.dfm}

procedure Tf_BuscaRecibo.BitBtn1Click(Sender: TObject);
begin
  with q_Dados do begin
    sql.Clear;
    sql.add('SELECT SEQUENCIA, TITULO, IDASSOCIADO, ASSOCIADO, ANOMES, REFERENCIA, DTVENCIMENTO, DTPAGAMENTO, DOCUMENTO, ');
    sql.add('VALORDOCUMENTO, IDFORMAPAG, FORMAPAGTO, ACRESCIMO, DESCONTO, VALORPAGO, VALORRESTANTE, DTALTERACAO, ');
    sql.add('USALTERACAO, USINCLUSAO, IDDESCPADRAO, DESCRICAOPADRAO, NUMRECIVO, ATIVO, REGBOLETO, DTBAIXA');
    sql.add('FROM W_RECEBIMENTOS');
    if RadioGroup1.ItemIndex=0 then begin
      sql.add('where NUMRECIVO=:c');
      parameters[0].value:=strtoint(edPesquisar.Text);
    end else if RadioGroup1.ItemIndex=1 then begin
      sql.add('where UPPER(ASSOCIADO) like :c');
      parameters[0].value:='%'+uppercase(edPesquisar.Text)+'%';
    end else if RadioGroup1.ItemIndex=2 then begin
      sql.add('where DTPAGAMENTO=:c');
      parameters[0].value:=strtodate(edPesquisar.Text);
    end;
    sql.add('ORDER BY ASSOCIADO');
    open;
  end;

  if q_dados.RecordCount>0 then btFormulario.Enabled:=true
  else btFormulario.Enabled:=false;

  if (q_DadosIDFORMAPAG.Value=999) AND (f_BuscaRecibo.Tag=10) then
    f_BaixaPagtosManual.lbFlag.Caption:=inttostr(q_DadosNUMRECIVO.Value)
  else if (f_BuscaRecibo.Tag=10) then
    f_BaixaPagtosManual.lbFlag.Caption:=inttostr(q_DadosSEQUENCIA.Value);
  
  edPesquisar.SetFocus;
  edPesquisar.SelectAll;
end;

procedure Tf_BuscaRecibo.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_BuscaRecibo.RadioGroup1Click(Sender: TObject);
begin
  q_Dados.close;
end;

procedure Tf_BuscaRecibo.btFormularioClick(Sender: TObject);
begin
  if q_dados.RecordCount=0 then begin
    showmessage('ERRO: Não existe informação.');
    exit;
  end;
  f_BaixaPagtosManual.edDocumento.Text:=inttostr(q_DadosTITULO.value);
  f_BaixaPagtosManual.btProcurar.SetFocus;
  f_BaixaPagtosManual.sbLancar.Enabled:=false;
  f_BaixaPagtosManual.sbLiberar.Enabled:=false;
  f_BaixaPagtosManual.sbBuscar.Enabled:=true;
  f_BaixaPagtosManual.sbFechar.Enabled:=true;
  f_BaixaPagtosManual.sbRecibo.Enabled:=true;
  f_BaixaPagtosManual.edReferencia.Text:=q_DadosREFERENCIA.value;
  f_BaixaPagtosManual.mkDtPagto.Text:=datetostr(q_DadosDTPAGAMENTO.value);
  f_BaixaPagtosManual.edValorPago.Text:=floattostrf(q_DadosVALORPAGO.value,ffnumber,10,2);
  f_BaixaPagtosManual.dblDescPadrao.KeyValue:=q_DadosIDDESCPADRAO.value;

  f_BaixaPagtosManual.mmDados.Lines.clear;
  f_BaixaPagtosManual.mmDados.Lines.Add(q_DadosASSOCIADO.value);
  f_BaixaPagtosManual.mmDados.Lines.add('Título: '+inttostr(q_DadosTITULO.value));
  f_BaixaPagtosManual.mmDados.Lines.add('Ativa : '+q_DadosATIVO.value);
  f_BaixaPagtosManual.mkDtBaixa.Text:=datetostr(q_DadosDTVENCIMENTO.Value);
  f_BaixaPagtosManual.mkDtPagto.Text:=datetostr(q_DadosDTPAGAMENTO.Value);
  f_BaixaPagtosManual.mkDtBaixa.Text:=datetostr(q_DadosDTBAIXA.Value);
  f_BaixaPagtosManual.lbRecibo.Caption:=inttostr(q_DadosNUMRECIVO.Value);
  f_BaixaPagtosManual.RadioGroup1.ItemIndex:=1;
  f_BaixaPagtosManual.RadioGroup1.Enabled:=false;

  f_BaixaPagtosManual.q_Debitos.close;
  f_BaixaPagtosManual.q_Debitos.Parameters[0].Value:=q_DadosTITULO.value;
  f_BaixaPagtosManual.q_Debitos.open;

//  f_BaixaPagtosManual.btProcurar.Click;
  close;
end;

procedure Tf_BuscaRecibo.BitBtn3Click(Sender: TObject);
var
  vRecibo,vTitulo:integer;
begin
  // reabilita os boletos como em aberto
  vRecibo:=q_DadosNUMRECIVO.Value;
  vTitulo:=q_DadosTITULO.Value;

  q_Dados.First;

  if tag=10 then begin  // formulario abertura Baixa Manual
    while not q_Dados.Eof do begin
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbboletos set aberto=:c');
        sql.add('WHERE idcodigo=:d');
        Parameters[0].value:='S';
        Parameters[1].value:=q_DadosREGBOLETO.Value;
        execsql;
      end;
      q_Dados.Next;
    end;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.Add('update tbmensalidadespagtos set ativo=:c where nrecibo=:d');
      Parameters[0].Value:='N';
      Parameters[1].Value:=vRecibo;
      execsql;
    end;

    f_BaixaPagtosManual.q_Debitos.close;
    f_BaixaPagtosManual.q_Debitos.Parameters[0].Value:=vTitulo;
    f_BaixaPagtosManual.q_Debitos.open;

    showmessage('INFORMAÇÃO: Operação CONCLUÍDA.');

    f_BaixaPagtosManual.edDocumento.Text:=inttostr(q_DadosTITULO.value);
    f_BaixaPagtosManual.btProcurar.Click;
  end else begin      // formulario abertura Baixa Servicos
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.Add('update tbmensalidadespagtos set ativo=:c where nrecibo=:d');
      Parameters[0].Value:='N';
      Parameters[1].Value:=vRecibo;
      execsql;
    end;

    f_BaixaPagtosServicos.q_Pagamentos.close;
    f_BaixaPagtosServicos.q_Pagamentos.Parameters[0].Value:=vTitulo;
    f_BaixaPagtosServicos.q_Pagamentos.open;

    showmessage('INFORMAÇÃO: Operação CONCLUÍDA.');

    f_BaixaPagtosServicos.edDocumento.Text:=inttostr(q_DadosTITULO.value);
    f_BaixaPagtosServicos.btProcurar.Click;
  end;
  close;
end;

procedure Tf_BuscaRecibo.q_DadosAfterScroll(DataSet: TDataSet);
begin
  if q_DadosATIVO.value='S' then BitBtn3.Enabled:=true
  else BitBtn3.Enabled:=false; 
end;

end.
