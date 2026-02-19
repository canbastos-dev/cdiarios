unit u_FormLiberacaoAtivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, Mask, EditNum, EditNum1;

type
  Tf_FormLiberacaoAtivos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbTitulo: TLabel;
    lbAssociado: TLabel;
    Label3: TLabel;
    lbCategoria: TLabel;
    Label4: TLabel;
    lbSituacao: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    lbValorReativar: TLabel;
    lbPrestacoes: TLabel;
    lbValorTotal: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    lbData: TLabel;
    Label6: TLabel;
    lbGeral: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    ActionList1: TActionList;
    acAbrir: TAction;
    acConciliacao: TAction;
    acFechar: TAction;
    Panel4: TPanel;
    Label10: TLabel;
    edSenha: TEdit;
    BitBtn4: TBitBtn;
    Panel5: TPanel;
    Label9: TLabel;
    Timer1: TTimer;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    Edit2: TEditNum1;
    Label8: TLabel;
    Edit1: TEditNum1;
    btLibera: TBitBtn;
    acLibBoleto: TAction;
    btConciliacao: TBitBtn;
    Panel6: TPanel;
    rdgConciliacaoTotal: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    procedure acFecharExecute(Sender: TObject);
    procedure acAbrirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acLibBoletoExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure acConciliacaoExecute(Sender: TObject);
  private
    vLiberaForm,vCodigo,vDataDia:string;
    posponto:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_FormLiberacaoAtivos: Tf_FormLiberacaoAtivos;

implementation

{$R *.dfm}
uses u_BaixaPagtosManual, u_Dados, u_relFichaAcordo, u_relRecibo,
  u_CadAssociados, DB;

procedure Tf_FormLiberacaoAtivos.acFecharExecute(Sender: TObject);
begin
  f_FormLiberacaoAtivos.Tag:=0;
  close;
end;

procedure Tf_FormLiberacaoAtivos.acAbrirExecute(Sender: TObject);
begin
  if BitBtn1.Enabled=false then exit;
  BitBtn1.Enabled:=false;
  panel5.Visible:=true;
  panel4.Visible:=true;
  f_FormLiberacaoAtivos.Height:=468;
  Edit1.Text:='0,00';
  Edit2.SetFocus;
  Edit2.SelectAll;
  Timer1.Enabled:=true;
end;

procedure Tf_FormLiberacaoAtivos.FormCreate(Sender: TObject);
begin
  f_FormLiberacaoAtivos.Height:=323;
  Timer1.Enabled:=false;
  vLiberaForm:='0';
  lbValorReativar.Caption:=floattostrf(dm_dados.q_ConfiguracoesVALORREATIVACAO.Value,ffnumber,10,2);  
end;

procedure Tf_FormLiberacaoAtivos.BitBtn4Click(Sender: TObject);
var
  vData:string;
  vRecibo:integer;
begin
  if f_FormLiberacaoAtivos.Tag=0 then begin
    vDataDia:=inttostr(DayOfWeek(Date))+copy(datetostr(date),4,2)+copy(datetostr(date),1,2)+'MASTER';
    panel4.Visible:=false;
    panel5.Visible:=false;
    f_FormLiberacaoAtivos.Height:=323;
    dm_Dados.q_Configuracoes.open;

    if (edsenha.Text<>dm_Dados.q_ConfiguracoesCODIGOLIBERACAO.Value) and (edsenha.Text<>vDataDia) then begin
      dm_Dados.q_Configuracoes.close;
      showmessage('ERRO: CÓDIGO DE LIBERAÇÃO NÃO CONFERE.');
      f_FormLiberacaoAtivos.close;
    end else begin

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbconfiguracoes set ACORDOQUITACAO=:c');
        Parameters[0].value:=dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1;
        execsql;
      end;

      vCodigo:=inttostr(dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1);
      dm_Dados.q_Configuracoes.close;

      case Length(vCodigo) of
        1:vCodigo:='0000'+vCodigo;
        2:vCodigo:='000'+vCodigo;
        3:vCodigo:='00'+vCodigo;
        4:vCodigo:='0'+vCodigo;
      end;

      if strtofloat(edit2.Text)>0 then begin
        // Geração do Recibo
        dm_Dados.q_Configuracoes.open;
        with dm_Dados.q_manipula do begin
          close;
          sql.Clear;
          sql.add('update tbconfiguracoes set numrecibo=:c');
          Parameters[0].value:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
          execsql;
        end;
        vrecibo:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
        dm_Dados.q_Configuracoes.open;
      end else vRecibo:=0;

      // ELIMINACAO DOS PONTOS DOS LABELS
      // lbGeral.Caption := FormatFloat('##,##0.00',TotalGeral);
      posponto:=pos('.',lbGeral.Caption);
      lbGeral.Caption := trim(copy(lbGeral.Caption,1,posponto-1)+copy(lbGeral.Caption,posponto+1,30));

      //lbGeral.Caption := FormatFloat('##,##0.00',TotalGeral);
      posponto:=pos('.',lbValorTotal.Caption);
      lbValorTotal.Caption := trim(copy(lbValorTotal.Caption,1,posponto-1)+copy(lbValorTotal.Caption,posponto+1,30));
      //

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into tbacordosliberacao (idcodigo, idassociado, nomeassociado, idtitulo, ');
        sql.add('dtprocesso, codigoliberacao, valorreativacao, numprestatrasadas, ');
        sql.add('valorprestatrasadas, valorgeral, pagoreativacao, pagoprestacoes, dtconsiderar, nrecibo)');
        sql.add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)');
        Parameters[0].value:=strtoint(vCodigo);
        Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
        Parameters[2].value:=lbAssociado.Caption;
        Parameters[3].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
        Parameters[4].value:=date;
        Parameters[5].value:=edSenha.Text;
        Parameters[6].value:=0;
        Parameters[7].value:=strtoint(lbPrestacoes.Caption);
        Parameters[8].value:=strtofloat(lbValorTotal.Caption);
        Parameters[9].value:=strtofloat(lbGeral.Caption);
        Parameters[10].value:=strtofloat(Edit1.Text);
        Parameters[11].value:=strtofloat(Edit2.Text);
        Parameters[12].value:=strtodate(MaskEdit1.Text);
        Parameters[13].value:=vRecibo;
        execsql;
      end;

      if lbPrestacoes.Caption<>'0' then begin
        f_BaixaPagtosManual.q_Debitos.First;
        while not f_BaixaPagtosManual.q_Debitos.Eof do begin
          if f_BaixaPagtosManual.q_DebitosABERTO.Value='S' then begin
            vData:=datetostr(f_BaixaPagtosManual.q_DebitosDTVENCIMENTO.value);
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
              sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
              sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
              sql.add('usinclusao, usalteracao, IDREGBOLETO, dtbaixa)');
              sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u)');
              Parameters[0].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
              Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
              Parameters[2].value:=strtoint(trim(copy(vData,7,4)+copy(vData,4,2)));
              Parameters[3].value:='AC'+vCodigo;
              Parameters[4].value:=date;
              Parameters[5].value:=f_BaixaPagtosManual.q_DebitosNUMDOC.Value;
              Parameters[6].value:=f_BaixaPagtosManual.q_DebitosVALORDOC.Value;
              Parameters[7].value:=999;                               // forma pagto BAIXA PRESIDENCIA
              Parameters[8].value:=0;                                 // acrescimo
              Parameters[9].value:=f_BaixaPagtosManual.q_DebitosVALORDOC.Value;           // desconto
              Parameters[10].value:=0;
              Parameters[11].value:=0;
              Parameters[12].value:=9999;                             // LIBERAÇÃO PRESIDÊNCIA
              Parameters[13].value:=vRecibo;
              Parameters[14].value:=1;
              Parameters[15].value:=1;
              Parameters[16].value:=f_BaixaPagtosManual.q_DebitosIDCODIGO.value;
              Parameters[17].value:=date;
              execsql;
            end;

            // ATUALIZA SITUACAO DO BOLETO
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('update tbboletos set aberto=:c, documentobaixa=:d');
              sql.add('WHERE idcodigo=:z');
              Parameters[0].value:='N';
              Parameters[1].value:='AC'+vCodigo;
              Parameters[2].value:=f_BaixaPagtosManual.q_DebitosIDCODIGO.value;
              execsql;
            end;
          end;
          f_BaixaPagtosManual.q_Debitos.Next;
        end;
      end;
      // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbassociados set ASSULTPAG=:c, ULTIMOPAGTO=:d, asssit=:e');
        sql.add('WHERE asscod=:z');
        Parameters[0].value:=strtodate(MaskEdit1.Text);
        Parameters[1].value:=copy(MaskEdit1.Text,4,2)+copy(MaskEdit1.Text,7,4);
        Parameters[2].value:=2;    // SITUACAO ATIVO
        Parameters[3].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
        execsql;
      end;

      Timer1.Enabled:=false;

      Application.CreateForm(Tf_relFichaAcordo, f_relFichaAcordo);
      f_relFichaAcordo.qrlabel1.Caption:='No.:'+vCodigo;
      f_relFichaAcordo.qrlabel4.Caption:=lbCategoria.Caption;
      f_relFichaAcordo.qrlabel5.Caption:='Atividade: '+lbCategoria.Caption;
      f_relFichaAcordo.qrlabel6.Caption:=lbData.Caption;
      f_relFichaAcordo.qrlabel7.Caption:=lbValorReativar.Caption;
      f_relFichaAcordo.qrlabel13.Caption:=lbPrestacoes.Caption+'   '+lbValorTotal.Caption;
      f_relFichaAcordo.qrlabel12.Caption:=lbGeral.Caption;
      f_relFichaAcordo.qrlabel19.Caption:=Edit1.Text;
      f_relFichaAcordo.qrlabel18.Caption:=edit2.Text;
      f_relFichaAcordo.qrlabel21.Caption:=MaskEdit1.Text;
      if edsenha.Text=vDataDia then f_relFichaAcordo.qrlabel23.Caption:='Diretoria'
      else f_relFichaAcordo.qrlabel23.Caption:='Master';
      vLiberaForm:='1';
      f_relFichaAcordo.QuickRep1.preview;

      if strtofloat(edit2.Text)>0 then begin

        // impressão do recibo
        Application.CreateForm(Tf_relRecibo, f_relRecibo);
        f_relRecibo.qrlRecibo.Caption:=inttostr(vRecibo);
        f_relRecibo.qrlRecibo1.Caption:=inttostr(vRecibo);
        f_relRecibo.qrlRecibo2.Caption:=inttostr(vRecibo);

        f_relRecibo.ValorPorExtenso1.Valor:=strtofloat(Edit1.Text)+strtofloat(Edit2.Text);

        f_relRecibo.qrlValor.Caption:=floattostrf(strtofloat(Edit1.Text)+strtofloat(Edit2.Text),ffnumber,10,2);
        f_relRecibo.qrlValor1.Caption:=floattostrf(strtofloat(Edit1.Text)+strtofloat(Edit2.Text),ffnumber,10,2);
        f_relRecibo.qrlValor2.Caption:=floattostrf(strtofloat(Edit1.Text)+strtofloat(Edit2.Text),ffnumber,10,2);
        f_relRecibo.ValorPorExtenso1.Valor:=strtofloat(Edit1.Text)+strtofloat(Edit2.Text);

        f_relRecibo.qrlRecebemos.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
        f_relRecibo.qrlRecebemos1.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
        f_relRecibo.qrlRecebemos2.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';

        f_relRecibo.qrlReferente.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Acordo Autorizado';
        f_relRecibo.qrlReferente1.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Acordo Autorizado';
        f_relRecibo.qrlReferente2.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Acordo Autorizado';

        f_relRecibo.qrlLocalData.Caption:='Fortaleza/CE, '+lbData.Caption;
        f_relRecibo.qrlLocalData1.Caption:='Fortaleza/CE, '+lbData.Caption;
        f_relRecibo.qrlLocalData2.Caption:='Fortaleza/CE, '+lbData.Caption;

        f_relRecibo.QuickRep1.Preview;
      end;
      f_BaixaPagtosManual.q_Debitos.close;
      f_BaixaPagtosManual.q_Debitos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
      f_BaixaPagtosManual.q_Debitos.open;
      f_BaixaPagtosManual.tag:=100;  // força reconsulta
    end;
    BitBtn3.Click;
  end;
  if f_FormLiberacaoAtivos.Tag=10 then begin
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update TBBOLETOS set ABERTO=:c, DTPAGAMENTO=:d, VALORPAGO=:e, DOCUMENTOBAIXA=:f');
      sql.Add('where NUMDOC=:z');
      Parameters[0].Value:='N';
      Parameters[1].Value:=STRtodate(MaskEdit1.Text);
      Parameters[2].Value:=f_BaixaPagtosManual.q_DebitosVALORDOC.value;
      Parameters[3].Value:='R '+inttostr(f_BaixaPagtosManual.q_PagamentosIDCODIGO.Value);  // R - Registro
      Parameters[4].Value:=f_BaixaPagtosManual.q_DebitosNUMDOC.value;
      execsql;
    end; // Fim Deletar

    // ATUALIZA GRADE PAGAMENTOS
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbmensalidadespagtos set MENSPGCLUBE=:c');
      sql.add('WHERE IDCODIGO=:z');
      Parameters[0].value:=0;
      Parameters[1].value:=f_BaixaPagtosManual.q_PagamentosIDCODIGO.Value;
      execsql;
    end;

    // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociados set ASSULTPAG=:c, ULTIMOPAGTO=:d');
      sql.add('WHERE asscod=:z');
      Parameters[0].value:=strtodate(MaskEdit1.Text);
      Parameters[1].value:=copy(MaskEdit1.Text,4,2)+'/'+copy(MaskEdit1.Text,7,4);
      Parameters[2].value:=strtoint(lbTitulo.Caption); //dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    f_BaixaPagtosManual.q_Debitos.close;
    f_BaixaPagtosManual.q_Debitos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
    f_BaixaPagtosManual.q_Debitos.open;

    f_BaixaPagtosManual.q_Pagamentos.close;
    f_BaixaPagtosManual.q_Pagamentos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
    f_BaixaPagtosManual.q_Pagamentos.open;

    showmessage('MENSAGEM: Documento Baixado.');
    bitbtn3.Click;
  end;
end;

procedure Tf_FormLiberacaoAtivos.Timer1Timer(Sender: TObject);
begin
  showmessage('ERRO: Tempo decorrido expirou.');
  bitbtn3.Click;
end;

procedure Tf_FormLiberacaoAtivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
var opc:integer;
begin
  if vLiberaForm='1' then begin
    opc:=application.messagebox('Relatório foi impresso corretamente ? ','Confirmação',mb_yesno);
    if opc=idyes then
      Action:=caFree
    else begin
      Action:=caNone;
      Application.CreateForm(Tf_relFichaAcordo, f_relFichaAcordo);
      f_relFichaAcordo.qrlabel1.Caption:='No.:'+vCodigo;
      f_relFichaAcordo.qrlabel4.Caption:=lbCategoria.Caption;
      f_relFichaAcordo.qrlabel5.Caption:='Atividade: '+lbCategoria.Caption;
      f_relFichaAcordo.qrlabel6.Caption:=lbData.Caption;
      f_relFichaAcordo.qrlabel7.Caption:=lbValorReativar.Caption;
      f_relFichaAcordo.qrlabel13.Caption:=lbPrestacoes.Caption+'   '+lbValorTotal.Caption;
      f_relFichaAcordo.qrlabel12.Caption:=lbGeral.Caption;
      f_relFichaAcordo.qrlabel19.Caption:=Edit1.Text;
      f_relFichaAcordo.qrlabel18.Caption:=edit2.Text;
      f_relFichaAcordo.qrlabel21.Caption:=MaskEdit1.Text;
      if edsenha.Text=vDataDia then f_relFichaAcordo.qrlabel23.Caption:='Diretoria'
      else f_relFichaAcordo.qrlabel23.Caption:='Master';
      f_relFichaAcordo.QuickRep1.preview;
    end;
  end else Action:=caFree;
end;

procedure Tf_FormLiberacaoAtivos.acLibBoletoExecute(Sender: TObject);
begin
  if btLibera.Enabled=false then exit;

  if f_BaixaPagtosManual.q_Pagamentos.RecordCount=0 then begin
    showmessage('ERRO: Não existe informação de Pagamento AVULSO para esse Sócio.');
    exit;
  end;
  BitBtn1.Enabled:=false;
  panel5.Visible:=true;
  panel4.Visible:=true;
  f_FormLiberacaoAtivos.Height:=468;
  Edit1.Text:='0,00';
  MaskEdit1.SetFocus;
  MaskEdit1.SelectAll;
  Timer1.Enabled:=true;
  label9.Enabled:=false;
  Edit2.Enabled:=false;
//  btConciliacao.Enabled:=false;
  btLibera.Enabled:=false;
  label11.Caption:='Data Pagto:';

  label5.Caption:='Documento';
  label2.Caption:='Vencimento';
  label6.Caption:='Valor Parc';
  lbValorReativar.Caption:=f_BaixaPagtosManual.q_DebitosNUMDOC.Value;
  lbValorTotal.Caption:=datetostr(f_BaixaPagtosManual.q_DebitosDTVENCIMENTO.Value);
  lbGeral.Caption:=floattostrf(f_BaixaPagtosManual.q_DebitosVALORDOC.Value,ffnumber,10,2);
  f_FormLiberacaoAtivos.Tag:=10;    // LIBERA BOLETO
end;

procedure Tf_FormLiberacaoAtivos.BitBtn2Click(Sender: TObject);
var
  vRecibo:integer;
  vData:string;
  opc:integer;
begin
  if btConciliacao.Enabled=false then exit;
  if rdgConciliacaoTotal.ItemIndex=0 then begin
    opc:=application.messagebox('Confirma transação de PAGAMENTO deste débito.','Confirmação',mb_yesno);
    if opc=idno then begin
      showmessage('MENSAGEM: Operação Cancelada.');
      exit;
    end;
    panel4.Visible:=false;
    panel5.Visible:=false;
    panel6.Visible:=false;
    f_FormLiberacaoAtivos.Height:=323;

    dm_Dados.q_Configuracoes.open;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbconfiguracoes set ACORDOQUITACAO=:c');
      Parameters[0].value:=dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1;
      execsql;
    end;
    vCodigo:=inttostr(dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1);
    dm_Dados.q_Configuracoes.close;

    case Length(vCodigo) of
      1:vCodigo:='0000'+vCodigo;
      2:vCodigo:='000'+vCodigo;
      3:vCodigo:='00'+vCodigo;
      4:vCodigo:='0'+vCodigo;
    end;

    // Geração do Recibo
    dm_Dados.q_Configuracoes.open;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbconfiguracoes set numrecibo=:c');
      Parameters[0].value:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
      execsql;
    end;
    vrecibo:=dm_Dados.q_ConfiguracoesNUMRECIBO.Value+1;
    dm_Dados.q_Configuracoes.open;

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('insert into tbacordosliberacao (idcodigo, idassociado, nomeassociado, idtitulo, ');
      sql.add('dtprocesso, codigoliberacao, valorreativacao, numprestatrasadas, ');
      sql.add('valorprestatrasadas, valorgeral, pagoreativacao, pagoprestacoes, dtconsiderar, nrecibo)');
      sql.add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)');
      Parameters[0].value:=strtoint(vCodigo);
      Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
      Parameters[2].value:=lbAssociado.Caption;
      Parameters[3].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      Parameters[4].value:=date;
      Parameters[5].value:=edSenha.Text;
      Parameters[6].value:=dm_dados.q_ConfiguracoesVALORREATIVACAO.Value; // 250;
      Parameters[7].value:=strtoint(lbPrestacoes.Caption);
      Parameters[8].value:=strtofloat(lbValorTotal.Caption);
      Parameters[9].value:=strtofloat(lbGeral.Caption);
      Parameters[10].value:=250;
      Parameters[11].value:=strtofloat(lbValorTotal.Caption);
      Parameters[12].value:=strtodate(lbData.Caption);
      Parameters[13].value:=vRecibo;
      execsql;
    end;

    if lbPrestacoes.Caption<>'0' then begin
      f_BaixaPagtosManual.q_Debitos.First;
      while not f_BaixaPagtosManual.q_Debitos.Eof do begin
        if f_BaixaPagtosManual.q_DebitosABERTO.Value='S' then begin
          vData:=datetostr(f_BaixaPagtosManual.q_DebitosDTVENCIMENTO.value);
          with dm_Dados.q_manipula do begin
            close;
            sql.Clear;
            sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
            sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
            sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
            sql.add('usinclusao, usalteracao, IDREGBOLETO, dtbaixa)');
            sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u)');
            Parameters[0].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
            Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
            Parameters[2].value:=strtoint(trim(copy(vData,7,4)+copy(vData,4,2)));
            Parameters[3].value:='AC'+vCodigo;
            Parameters[4].value:=date;
            Parameters[5].value:=f_BaixaPagtosManual.q_DebitosNUMDOC.Value;
            Parameters[6].value:=f_BaixaPagtosManual.q_DebitosVALORDOC.Value;
            Parameters[7].value:=1;                               // forma pagto BAIXA SECRETARIA
            Parameters[8].value:=0;                                 // acrescimo
            Parameters[9].value:=0;           // desconto
            Parameters[10].value:=0;
            Parameters[11].value:=0;
            Parameters[12].value:=3;                             // Descricao Padrao - REATIVACAO
            Parameters[13].value:=vRecibo;
            Parameters[14].value:=1;
            Parameters[15].value:=1;
            Parameters[16].value:=f_BaixaPagtosManual.q_DebitosIDCODIGO.value;
            Parameters[17].value:=strtodate(lbData.Caption);
            execsql;
          end;

          // ATUALIZA SITUACAO DO BOLETO
          with dm_Dados.q_manipula do begin
            close;
            sql.Clear;
            sql.add('update tbboletos set aberto=:c, documentobaixa=:d');
            sql.add('WHERE idcodigo=:z');
            Parameters[0].value:='N';
            Parameters[1].value:='AC'+vCodigo;
            Parameters[2].value:=f_BaixaPagtosManual.q_DebitosIDCODIGO.value;
            execsql;
          end;
        end;
        f_BaixaPagtosManual.q_Debitos.Next;
      end;
    end;
    // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociados set ASSULTPAG=:c, asssit=:d');
      sql.add('WHERE asscod=:z');
      Parameters[0].value:=strtodate(lbData.Caption);
      Parameters[1].value:=2;    // SITUACAO ATIVO
      Parameters[2].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    // ATUALIZA TABELA DE ACOES
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociadosacoes set ativa=:c');
      sql.add('WHERE idcodigo=:z');
      Parameters[0].value:='S';
      Parameters[1].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    Timer1.Enabled:=false;

    Application.CreateForm(Tf_relFichaAcordo, f_relFichaAcordo);
    f_relFichaAcordo.qrlabel1.Caption:='No.:'+vCodigo;
    f_relFichaAcordo.qrlabel4.Caption:=lbCategoria.Caption;
    f_relFichaAcordo.qrlabel5.Caption:='Atividade: '+lbCategoria.Caption;
    f_relFichaAcordo.qrlabel6.Caption:=lbData.Caption;
    f_relFichaAcordo.qrlabel7.Caption:=lbValorReativar.Caption;
    f_relFichaAcordo.qrlabel13.Caption:=lbPrestacoes.Caption+'   '+lbValorTotal.Caption;
    f_relFichaAcordo.qrlabel12.Caption:=lbGeral.Caption;
    f_relFichaAcordo.qrlabel19.Caption:=lbValorReativar.Caption;
    f_relFichaAcordo.qrlabel18.Caption:=lbValorTotal.Caption;
    f_relFichaAcordo.qrlabel21.Caption:=lbData.Caption;
    f_relFichaAcordo.qrlabel23.Caption:='Secretaria';
    f_relFichaAcordo.QuickRep1.preview;
    vLiberaForm:='1';

    // impressão do recibo
    Application.CreateForm(Tf_relRecibo, f_relRecibo);
    f_relRecibo.qrlRecibo.Caption:=inttostr(vRecibo);
    f_relRecibo.qrlRecibo1.Caption:=inttostr(vRecibo);
    f_relRecibo.qrlRecibo2.Caption:=inttostr(vRecibo);

    f_relRecibo.qrlValor.Caption:=lbGeral.caption;
    f_relRecibo.qrlValor1.Caption:=lbGeral.caption;
    f_relRecibo.qrlValor2.Caption:=lbGeral.caption;

    f_relRecibo.ValorPorExtenso1.Valor:=strtofloat(lbGeral.caption);

    f_relRecibo.qrlRecebemos.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
    f_relRecibo.qrlRecebemos1.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';
    f_relRecibo.qrlRecebemos2.Caption:=dm_Dados.q_TitulosASSOCIADO.value+' - ';

    f_relRecibo.qrlReferente.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Reativacao - No Liberação '+vCodigo;
    f_relRecibo.qrlReferente1.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Reativação - No Liberação '+vCodigo;
    f_relRecibo.qrlReferente2.Caption:='Título Nº '+inttostr(dm_Dados.q_TitulosNUMEROACAO.value)+' - Reativação - No Liberação '+vCodigo;

    f_relRecibo.qrlLocalData.Caption:='Fortaleza/CE, '+lbData.Caption;
    f_relRecibo.qrlLocalData1.Caption:='Fortaleza/CE, '+lbData.Caption;
    f_relRecibo.qrlLocalData2.Caption:='Fortaleza/CE, '+lbData.Caption;

    f_relRecibo.QuickRep1.Preview;

    f_BaixaPagtosManual.q_Debitos.close;
    f_BaixaPagtosManual.q_Debitos.Parameters[0].Value:=dm_dados.q_TitulosNUMEROACAO.value;
    f_BaixaPagtosManual.q_Debitos.open;
    f_BaixaPagtosManual.tag:=100;  // força reconsulta
    BitBtn3.Click;
  end else if rdgConciliacaoTotal.ItemIndex=1 then begin
    opc:=application.messagebox('Confirma transação de CANCELAMENTO deste débito/título.','Confirmação',mb_yesno);
    if opc=idno then begin
      showmessage('MENSAGEM: Operação Cancelada.');
      exit;
    end;
    panel4.Visible:=false;
    panel5.Visible:=false;
    panel6.Visible:=false;
    f_FormLiberacaoAtivos.Height:=323;

    dm_Dados.q_Configuracoes.open;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbconfiguracoes set ACORDOQUITACAO=:c');
      Parameters[0].value:=dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1;
      execsql;
    end;
    vCodigo:=inttostr(dm_Dados.q_ConfiguracoesACORDOQUITACAO.Value+1);
    dm_Dados.q_Configuracoes.close;

    case Length(vCodigo) of
      1:vCodigo:='0000'+vCodigo;
      2:vCodigo:='000'+vCodigo;
      3:vCodigo:='00'+vCodigo;
      4:vCodigo:='0'+vCodigo;
    end;

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('insert into tbacordosliberacao (idcodigo, idassociado, nomeassociado, idtitulo, ');
      sql.add('dtprocesso, codigoliberacao, valorreativacao, numprestatrasadas, ');
      sql.add('valorprestatrasadas, valorgeral, pagoreativacao, pagoprestacoes, dtconsiderar, nrecibo)');
      sql.add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)');
      Parameters[0].value:=strtoint(vCodigo);
      Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
      Parameters[2].value:=lbAssociado.Caption;
      Parameters[3].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      Parameters[4].value:=date;
      Parameters[5].value:='Acordo '+vCodigo;
      Parameters[6].value:=0; // CANCELAMENTO;
      Parameters[7].value:=0;
      Parameters[8].value:=0;
      Parameters[9].value:=0;
      Parameters[10].value:=0;          // CANCELAMENTO
      Parameters[11].value:=0;
      Parameters[12].value:=strtodate(lbData.Caption);
      Parameters[13].value:=vRecibo;
      execsql;
    end;


    // ATUALIZA SITUACAO DO BOLETO
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbboletos set aberto=:c, documentobaixa=:d');
      sql.add('WHERE idtitulo=:z');
      Parameters[0].value:='S';
      Parameters[1].value:='AC'+vCodigo;
      Parameters[2].value:=f_BaixaPagtosManual.q_DebitosIDTITULO.value;
      execsql;
    end;

    // ATUALIZA TBASSOCIADOS - DATA ULT PAGTO
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociados set ASSULTPAG=:c, asssit=:d');
      sql.add('WHERE asscod=:z');
      Parameters[0].value:=strtodate(lbData.Caption);
      Parameters[1].value:=3;    // SITUACAO INATIVO
      Parameters[2].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    // ATUALIZA TABELA DE ACOES
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbassociadosacoes set ativa=:c');
      sql.add('WHERE idcodigo=:z');
      Parameters[0].value:='N';
      Parameters[1].value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      execsql;
    end;

    Timer1.Enabled:=false;

    Application.CreateForm(Tf_relFichaAcordo, f_relFichaAcordo);
    f_relFichaAcordo.qrlabel1.Caption:='No.:'+vCodigo;
    f_relFichaAcordo.qrlabel4.Caption:=lbCategoria.Caption;
    f_relFichaAcordo.qrlabel5.Caption:='Atividade: '+lbCategoria.Caption;
    f_relFichaAcordo.qrlabel6.Caption:=lbData.Caption;
    f_relFichaAcordo.qrlabel7.Caption:='CANCELAMENTO'; //lbValorReativar.Caption;
    f_relFichaAcordo.qrlabel13.Caption:='CANCELAMENTO'; //lbPrestacoes.Caption+'   '+lbValorTotal.Caption;
    f_relFichaAcordo.qrlabel12.Caption:='CANCELAMENTO'; //lbGeral.Caption;
    f_relFichaAcordo.qrlabel19.Caption:='CANCELAMENTO'; //lbValorReativar.Caption;
    f_relFichaAcordo.qrlabel18.Caption:='CANCELAMENTO'; //lbValorTotal.Caption;
    f_relFichaAcordo.qrlabel21.Caption:=lbData.Caption;
    f_relFichaAcordo.qrlabel23.Caption:='Secretaria';
    f_relFichaAcordo.QuickRep1.preview;
    vLiberaForm:='1';

    f_BaixaPagtosManual.tag:=100;  // força reconsulta
    BitBtn3.Click;
  end;
end;

procedure Tf_FormLiberacaoAtivos.BitBtn5Click(Sender: TObject);
begin
  panel4.Visible:=true;
  panel6.Visible:=false;

  BitBtn1.Enabled:=true;
  btLibera.Enabled:=true;
  btConciliacao.Enabled:=true;
end;

procedure Tf_FormLiberacaoAtivos.acConciliacaoExecute(Sender: TObject);
begin
  if btConciliacao.Enabled=false then exit;
  BitBtn1.Enabled:=false;
  panel5.Visible:=true;
  f_FormLiberacaoAtivos.Height:=468;
//  btConciliacao.Enabled:=false;
  panel4.Visible:=false;
  panel6.Visible:=true;
  panel6.Height:=142;
  panel6.Width:=261;
end;

end.
