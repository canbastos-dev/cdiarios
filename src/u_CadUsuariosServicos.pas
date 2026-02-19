unit u_CadUsuariosServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, yupack, YuSoftButton1, ComCtrls, Grids,
  DBGrids, DB, DBTables, ExtCtrls, DBCtrls, ActnList, Mask, SMBar, ADODB;

type
  Tf_CadUsuariosServicos = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    edPesquisar: TEdit;
    sbPesquisar: TSpeedButton;
    spImprimir: TSpeedButton;
    sbFechar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    d_Dados: TDataSource;
    DBNavigator1: TDBNavigator;
    sbIncluir: TSpeedButton;
    sbEditar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbDeletar: TSpeedButton;
    sbAtualizar: TSpeedButton;
    ActionList1: TActionList;
    acIncluir: TAction;
    acEditar: TAction;
    acSalvar: TAction;
    acDeletar: TAction;
    acAtualizar: TAction;
    Systembar1: TSystembar;
    Label16: TLabel;
    Label34: TLabel;
    cbPesquisa: TComboBox;
    sbLimpar: TSpeedButton;
    GroupBox5: TGroupBox;
    q_Dados: TADOQuery;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    Label2: TLabel;
    edNomeAssociado: TEdit;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mkCPF: TMaskEdit;
    edRG: TEdit;
    mkDtNasc: TMaskEdit;
    mkFone: TMaskEdit;
    mkCelular: TMaskEdit;
    Label9: TLabel;
    dblServico: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    dblSituacao: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edEmail: TEdit;
    edEndereco: TEdit;
    Label15: TLabel;
    mkCep: TMaskEdit;
    dblBairro: TDBLookupComboBox;
    dblMunicipio: TDBLookupComboBox;
    dblEstCivil: TDBLookupComboBox;
    Label17: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    edEmpresa: TEdit;
    mkFone1Emp: TMaskEdit;
    edEnderecoEmp: TEdit;
    mkCepEmp: TMaskEdit;
    dblBairroEmp: TDBLookupComboBox;
    dblMunicipioEmp: TDBLookupComboBox;
    GroupBox7: TGroupBox;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton11: TSpeedButton;
    edEnderecoCob: TEdit;
    mkCepCob: TMaskEdit;
    dblBairroCob: TDBLookupComboBox;
    dblMunicipioCob: TDBLookupComboBox;
    Label19: TLabel;
    mkUltPagto: TMaskEdit;
    Label20: TLabel;
    mkValCarteira: TMaskEdit;
    GroupBox9: TGroupBox;
    DBGrid3: TDBGrid;
    edCargo: TEdit;
    Label35: TLabel;
    mkAdmissao: TMaskEdit;
    Label37: TLabel;
    edNCarteira: TEdit;
    Label38: TLabel;
    edMsgCarteira: TEdit;
    mmObs: TMemo;
    q_Pagamentos: TADOQuery;
    d_Pagamentos: TDataSource;
    q_PagamentosIDCODIGO: TIntegerField;
    q_PagamentosIDTITULO: TIntegerField;
    q_PagamentosIDASSOCIADO: TIntegerField;
    q_PagamentosANOMES: TIntegerField;
    q_PagamentosREFERENCIA: TStringField;
    q_PagamentosDTVENCIMENTO: TDateField;
    q_PagamentosDTPAGAMENTO: TDateField;
    q_PagamentosNUMDOCUMENTO: TStringField;
    q_PagamentosVALORDOCUMENTO: TBCDField;
    q_PagamentosIDFORMAPAG: TIntegerField;
    q_PagamentosACRESCIMO: TBCDField;
    q_PagamentosDESCONTO: TBCDField;
    q_PagamentosVALORPAGO: TBCDField;
    q_PagamentosVALORRESTANTE: TBCDField;
    q_PagamentosDTALTERACAO: TDateField;
    q_PagamentosUSALTERACAO: TIntegerField;
    q_PagamentosUSINCLUSAO: TIntegerField;
    q_PagamentosIDDESCRICAOPADRAO: TIntegerField;
    q_PagamentosNRECIBO: TIntegerField;
    q_PagamentosATIVO: TStringField;
    Label24: TLabel;
    lbTitulo: TLabel;
    q_PagamentosDESCRICAOPADRAO: TStringField;
    Label40: TLabel;
    Label41: TLabel;
    dblFormaCob: TDBLookupComboBox;
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
    Label21: TLabel;
    dblUsuarioTipo: TDBLookupComboBox;
    SpeedButton6: TSpeedButton;
    q_DadosIDSITUACAO: TIntegerField;
    q_DadosSERVICO: TStringField;
    q_DadosTIPO: TStringField;
    q_DadosSITUACAO: TStringField;
    TabSheet4: TTabSheet;
    Label33: TLabel;
    edTitulo: TEdit;
    btBuscar: TButton;
    mmDadosAssociado: TMemo;
    btImportar: TButton;
    q_DadosAss: TADOQuery;
    q_DadosAssSEQUENCIA: TIntegerField;
    q_DadosAssCODIGO: TIntegerField;
    q_DadosAssASSOCIADO: TStringField;
    q_DadosAssIDSITUACAO: TIntegerField;
    q_DadosAssSITUACAO: TStringField;
    q_DadosAssCPF: TStringField;
    q_DadosAssDTNASC: TDateField;
    q_DadosAssSEXO: TStringField;
    q_DadosAssFONE1: TStringField;
    q_DadosAssFONE2: TStringField;
    q_DadosAssENDERECO: TStringField;
    q_DadosAssIDBAIRRO: TIntegerField;
    q_DadosAssBAIRRO: TStringField;
    q_DadosAssIDMUNICIPIO: TIntegerField;
    q_DadosAssMUNICIPIO: TStringField;
    q_DadosAssIDUF: TIntegerField;
    q_DadosAssUF: TStringField;
    q_DadosAssCEP: TStringField;
    q_DadosAssENDERECOEMP: TStringField;
    q_DadosAssBAIRROEMP: TIntegerField;
    q_DadosAssMUNICIPIOEMP: TIntegerField;
    q_DadosAssUFEMP: TIntegerField;
    q_DadosAssCEPEMP: TStringField;
    q_DadosAssFONEMP: TStringField;
    q_DadosAssNOMEEMPRESA: TStringField;
    q_DadosAssCARTEIRA: TStringField;
    q_DadosAssIDCATEGORIA: TIntegerField;
    q_DadosAssCATEGORIA: TStringField;
    q_DadosAssDIAVENCIMENTO: TIntegerField;
    q_DadosAssDTADMISSAO: TDateField;
    q_DadosAssDTULTPAGTO: TDateField;
    q_DadosAssIDESTADOCIVIL: TIntegerField;
    q_DadosAssESTADOCIVIL: TStringField;
    q_DadosAssRG: TStringField;
    q_DadosAssENDERECOCOB: TStringField;
    q_DadosAssBAIRROCOB: TIntegerField;
    q_DadosAssMUNICIPIOCOB: TIntegerField;
    q_DadosAssUFCOB: TIntegerField;
    q_DadosAssCEPCOB: TStringField;
    q_DadosAssDTEXPCARTEIRA: TIntegerField;
    q_DadosAssNUMCARTEIRA: TStringField;
    q_DadosAssVALIDADECARTEIRA: TDateField;
    q_DadosAssVIACARTEIRA: TIntegerField;
    q_DadosAssMENSAGEMCARTEIRA: TStringField;
    q_DadosAssDTINCLUSAO: TDateField;
    q_DadosAssDTALTERACAO: TDateField;
    q_DadosAssUSALTERACAO: TIntegerField;
    q_DadosAssUSINCLUSAO: TIntegerField;
    q_DadosAssEMAIL: TStringField;
    q_DadosAssOBSERVACOES: TMemoField;
    q_DadosAssTITULOSDEB: TIntegerField;
    q_DadosAssULTIMOPAGTO: TStringField;
    q_DadosAssIDFORMAPAGTO: TIntegerField;
    q_DadosAssSITUACAOFIN: TStringField;
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure cbPesquisaDblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acEditarExecute(Sender: TObject);
    procedure acAtualizarExecute(Sender: TObject);
    procedure acDeletarExecute(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure sbPesquisarClick(Sender: TObject);
    procedure spImprimirClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cbPesquisaCloseUp(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure q_DadosAfterScroll(DataSet: TDataSet);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure q_DadosAfterOpen(DataSet: TDataSet);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
  private
    vZebrado:integer;
    vRegistro:integer; // No registro exibido no SYSTEMBAR
    vPos:integer; // Guarda posição de caracteres coringa
    vImportado:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CadUsuariosServicos: Tf_CadUsuariosServicos;

implementation

uses u_dados, u_CadBairros, u_CadMunicipios, u_CadEstCivil,
  u_CadCategorias, u_CadSituacao, u_CadParentescos,
  u_relListaFormCadAssociado, u_relFichaAssociado, u_BaixaPagtosManual, u_AtualizandoBase,
  u_CadServicosClube, u_CadUsuariosTipo, u_relListaFormCadUsuarioServico;
{$R *.dfm}

function botoes(adi: Boolean; alt: Boolean; sal: Boolean; exc: Boolean; atu: Boolean): Boolean;
begin
  f_CadUsuariosServicos.sbIncluir.Enabled:=adi;
  f_CadUsuariosServicos.sbEditar.Enabled:=alt;
  f_CadUsuariosServicos.sbSalvar.Enabled:=sal;
  f_CadUsuariosServicos.sbDeletar.Enabled:=exc;
  f_CadUsuariosServicos.sbAtualizar.Enabled:=atu;
end;


procedure Tf_CadUsuariosServicos.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tf_CadUsuariosServicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tf_CadUsuariosServicos.FormCreate(Sender: TObject);
begin
  q_dados.close;
  q_dados.Open;
  if q_dados.RecordCount=0 then begin
    spImprimir.Enabled:=false;
    botoes(true,false,false,false,false);
  end else begin
    spImprimir.Enabled:=true;
    botoes(true,true,false,true,false); // Restaura situação dos Botões
  end;
  PageControl1.ActivePage:=TabSheet1;
  GroupBox2.Enabled:=true;
  vZebrado:=0;
  vImportado:=0;
end;

procedure Tf_CadUsuariosServicos.acIncluirExecute(Sender: TObject);
begin
  if sbIncluir.Enabled=false then exit;
  sbLimpar.Click;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox7.Enabled:=true;
  GroupBox2.Enabled:=false;

  PageControl1.ActivePage:=TabSheet1;
  edNomeAssociado.SetFocus;
  f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços - INCLUSÃO';
  botoes(false,false,true,false,true); // Restaura situação dos Botões

end;

procedure Tf_CadUsuariosServicos.acSalvarExecute(Sender: TObject);
var
  vPos:TBookmark;
begin
  if sbSalvar.Enabled=false then exit;
  PageControl1.ActivePage:=TabSheet1; // Torna DADOS CADASTRO padrão
  if f_CadUsuariosServicos.Caption='Cadastro de Usuarios de Serviços - INCLUSÃO' then begin // Rotina de Inserção
    // Insere dados no Banco
//    try


      dm_Dados.q_Configuracoes.open;

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into TBCADUSUARIOSERV ');
        sql.add('(IDTIPOSERVICO, IDTIPOUSUARIO, NOME, DTNASCIMENTO, SEXO, ');
        sql.add('TELEFONEFIXO, TELEFONECEL, EMAIL, TELEFONECEL2, ENDERECO, IDBAIRRO, ');
        sql.add('IDMUNICIPIO, CEP, IDUF, DIAVENCTO, RG, CPF, IDSITUACAO)');
        sql.Add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t)');
        Parameters[0].Value:=dblServico.KeyValue;
        Parameters[1].Value:=dblUsuarioTipo.KeyValue;
        Parameters[2].Value:=edNomeAssociado.Text;
        if mkDtNasc.Text='  /  /    ' then Parameters[3].Value:=null
        else Parameters[3].Value:=strtodate(mkDtNasc.Text);
        if RadioGroup1.ItemIndex=0 then Parameters[4].Value:='M'
        else Parameters[4].Value:='F';
        Parameters[5].Value:=mkFone.Text;
        Parameters[6].Value:=mkCelular.Text;
        Parameters[7].Value:=edEmail.Text;
        Parameters[8].Value:='';
        Parameters[9].Value:=edEndereco.Text;
        if dblBairro.KeyValue=0 then Parameters[10].Value:=1
        else Parameters[10].Value:=dblBairro.KeyValue;
        if dblMunicipio.KeyValue=0 then Parameters[11].Value:=1
        else Parameters[11].Value:=dblMunicipio.KeyValue;
        Parameters[12].Value:=mkCep.Text;
        Parameters[14].Value:=1;                                      // CE
        Parameters[15].Value:=edRG.Text;
        Parameters[16].Value:=mkCPF.Text;
        Parameters[17].Value:=2;      // ATIVO       
        execsql;
      end; // Fim Inserção

      if vImportado=1 then begin
        dm_Dados.q_manipula.Close;
        dm_Dados.q_manipula.SQL.clear;
        dm_Dados.q_manipula.sql.add('update tbassociados set usinclusao=:c where sequencia =:d');
        dm_Dados.q_manipula.Parameters[0].Value:=999;              // registro exportado para USUARIOS SERVICOS
        dm_Dados.q_manipula.Parameters[1].Value:=q_DadosAssSEQUENCIA.Value;
        dm_Dados.q_manipula.ExecSQL;
        vImportado:=0;
      end;

      showmessage('MENSAGEM: Registro Inserido.');
      f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços';

      GroupBox2.Enabled:=true;
      GroupBox5.Enabled:=false;
      GroupBox6.Enabled:=false;
      GroupBox7.Enabled:=false;
      q_Dados.Close;    // Atualiza GRID
      q_Dados.open;
      q_dados.Last;
      botoes(true,true,false,True,true); // Restaura situação dos Botões
//    except
//      showmessage('ERRO: Formulário Preenchido incorretamente.');
//    end;
  end
  else begin // Rotina de Alteração
    // variável da Unit - Registro corrente
    vRegistro:=strtoint(copy(Systembar1.SimpleText,pos(':',Systembar1.SimpleText)+2,6));

    // Insere dados no Banco
    vPos:=q_Dados.GetBookmark;
    try
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update TBCADUSUARIOSERV set ');
        sql.add('IDTIPOSERVICO=:a, IDTIPOUSUARIO=:b, NOME=:c, DTNASCIMENTO=:d, SEXO=:e, ');
        sql.add('TELEFONEFIXO=:f, TELEFONECEL=:g, EMAIL=:h, TELEFONECEL2=:i, ENDERECO=:j, IDBAIRRO=:k, ');
        sql.add('IDMUNICIPIO=:l, CEP=:m, IDUF=:n, DIAVENCTO=:o, RG=:p, CPF=:q, IDSITUACAO=:r');
        sql.add('where IDCODIGO=:z9');
        Parameters[0].Value:=dblServico.KeyValue;
        Parameters[1].Value:=dblUsuarioTipo.KeyValue;
        Parameters[2].Value:=edNomeAssociado.Text;
        if mkDtNasc.Text='  /  /    ' then Parameters[3].Value:=null
        else Parameters[3].Value:=strtodate(mkDtNasc.Text);
        if RadioGroup1.ItemIndex=0 then Parameters[4].Value:='M'
        else Parameters[4].Value:='F';
        Parameters[5].Value:=mkFone.Text;
        Parameters[6].Value:=mkCelular.Text;
        Parameters[7].Value:=edEmail.Text;
        Parameters[8].Value:='';
        Parameters[9].Value:=edEndereco.Text;
        if dblBairro.KeyValue=0 then
          Parameters[10].Value:=1
        else
          Parameters[10].Value:=dblBairro.KeyValue;
        if dblMunicipio.KeyValue=0 then Parameters[11].Value:=1
        else Parameters[11].Value:=dblMunicipio.KeyValue;
        Parameters[12].Value:=mkCep.Text;
        Parameters[13].Value:=1;                                      // CE
        Parameters[14].Value:=1;
        Parameters[15].Value:=edRG.Text;
        Parameters[16].Value:=mkCPF.Text;
        Parameters[17].Value:=dblSituacao.KeyValue;
        Parameters[18].Value:=q_DadosIDCODIGO.Value;
        execsql;
      end; // Fim Inserção

      showmessage('MENSAGEM: Registro Alterado.');
      f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços';
      q_Dados.Close;    // Atualiza GRID
      q_Dados.open;
      q_Dados.GotoBookmark(vPos);
      q_Dados.FreeBookmark(vPos);
      botoes(true,true,false,True,false); // Restaura situação dos Botões
      GroupBox2.Enabled:=true;
      DBGrid1.SetFocus;
      GroupBox5.Enabled:=false;
      GroupBox6.Enabled:=false;
      GroupBox7.Enabled:=false;
    except
      showmessage('ERRO: Formulário Preenchido incorretamente.');
    end;
  end;  //  Fim Alteração
  DBGrid1.SetFocus;
end;

procedure Tf_CadUsuariosServicos.cbPesquisaDblClick(Sender: TObject);
begin
  cbPesquisa.Text:='';
  edPesquisar.Text:='';
end;

procedure Tf_CadUsuariosServicos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
{
  If vZebrado=0 then begin
    vZebrado:=1;
    DBGrid1.Canvas.Brush.Color := clMoneyGreen; // muda a cor do pincel
    DBGrid1.Canvas.FillRect(Rect); // Preenche o fundo com a cor especificada
  end
  else begin
    vZebrado:=0;
    DBGrid1.Canvas.Brush.Color := clInfoBk; // muda a cor do pincel
    DBGrid1.Canvas.FillRect(Rect); // Preenche o fundo com a cor especificada
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);// desenha as células da grade
}


  if (q_DadosIDSITUACAO.value=3) then begin  // inativo
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clred;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  if (q_DadosIDSITUACAO.value=0) then begin  // indefinido
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clblack;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tf_CadUsuariosServicos.acEditarExecute(Sender: TObject);
begin
  if sbEditar.Enabled=false then exit;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox7.Enabled:=true;
  GroupBox2.Enabled:=false;
  PageControl1.ActivePage:=TabSheet1;
  edNomeAssociado.SetFocus;
  f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços - ALTERAÇÃO';

  botoes(false,false,true,false,true); // Restaura situação dos Botões
end;

procedure Tf_CadUsuariosServicos.acAtualizarExecute(Sender: TObject);
begin
  if sbAtualizar.Enabled=false then exit;
  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;

  PageControl1.ActivePage:=TabSheet1;
  f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços';
  botoes(true,true,false,True,false); // Restaura situação dos Botões
  DBGrid1.SetFocus;
  dblUsuarioTipo.Enabled:=true;
end;

procedure Tf_CadUsuariosServicos.acDeletarExecute(Sender: TObject);
var opc:integer;
begin
  if sbDeletar.Enabled=false then exit;
  f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços - DELETAR REGISTRO '+copy(Systembar1.SimpleText,pos(':',Systembar1.SimpleText)+1,6);
  opc:=application.messagebox('Confirma exclusão do registro ','Confirmação',mb_yesno);
  if opc=idyes then begin
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBCADUSUARIOSERV');
      sql.Add('where IDCODIGO=:c');
      Parameters[0].Value:=q_DadosIDCODIGO.value;
      execsql;
    end; // Fim Deletar
    showmessage('MENSAGEM: Registro Deletado.');
    f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços';
    q_Dados.Close;    // Atualiza GRID
    q_Dados.open;
    botoes(true,true,false,false,false); // Restaura situação dos Botões
  end
  else BEGIN
    showmessage('MENSAGEM: Operação cancelada.');
    f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços';
  END;
end;

procedure Tf_CadUsuariosServicos.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  f_CadUsuariosServicos.Caption:='Cadastro de Usuarios de Serviços - CONSULTA';

  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;


  botoes(false,true,false,true,true); // Restaura situação dos Botões
end;

procedure Tf_CadUsuariosServicos.sbPesquisarClick(Sender: TObject);
begin
  sbAtualizar.Click;

  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT IDCODIGO, IDTIPOSERVICO, IDTIPOUSUARIO, NOME, DTNASCIMENTO, SEXO, ');
  q_dados.SQL.add('TELEFONEFIXO, TELEFONECEL, EMAIL, TELEFONECEL2, ENDERECO, IDBAIRRO, ');
  q_dados.SQL.add('IDMUNICIPIO, CEP, IDUF, DIAVENCTO, RG, CPF, SERVICO, TIPO, SITUACAO, IDSITUACAO');
  q_dados.SQL.add('FROM W_SERVICOS');
  case cbPesquisa.ItemIndex of
    0:begin; q_dados.SQL.Add('WHERE upper(NOME) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    1:begin; q_dados.SQL.Add('WHERE CPF=:c'); q_Dados.Parameters[0].Value:=edPesquisar.Text; end;
    2:begin; q_dados.SQL.Add('WHERE upper(SERVICO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    3:begin; q_dados.SQL.Add('WHERE upper(TIPO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    4:begin; q_dados.SQL.Add('WHERE upper(SITUACAO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
  end;
  q_dados.SQL.add('ORDER BY NOME');
  q_Dados.open;

  if q_Dados.RecordCount=0 then spImprimir.Enabled:=false
  else spImprimir.Enabled:=true;

  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;
end;

procedure Tf_CadUsuariosServicos.spImprimirClick(Sender: TObject);
var
  vContador,vSequencia,vAssCod,vSit:integer; vNome:string;
begin
  Application.CreateForm(Tf_relListaFormCadUsuarioServico, f_relListaFormCadUsuarioServico);
  f_relListaFormCadUsuarioServico.qrlFiltro.Caption:='Filtro: '+cbPesquisa.Text+'   Conteúdo: '+uppercase(edPesquisar.Text);
  f_relListaFormCadUsuarioServico.qrlabel3.Caption:='Registros: '+inttostr(f_CadUsuariosServicos.q_Dados.RecordCount);
  f_relListaFormCadUsuarioServico.QuickRep1.Preview;
end;

procedure Tf_CadUsuariosServicos.sbLimparClick(Sender: TObject);
begin
  edNomeAssociado.Text:='';
  dblSituacao.KeyValue:=0;
  mkCPF.Text:='';
  edEmail.Text:='';
  mkDtNasc.Text:='';
  RadioGroup1.ItemIndex:=0;
  mkFone.Text:='';
  mkCelular.Text:='';
  edEndereco.Text:='';
  dblBairro.KeyValue:=0;
  dblMunicipio.KeyValue:=0;
  mkCep.Text:='';
  edEnderecoEmp.Text:='';
  dblBairroEmp.KeyValue:=0;
  dblMunicipioEmp.KeyValue:=0;
  mkCepEmp.Text:='';
  mkFone1Emp.Text:='';
  edEmpresa.Text:='';
  edCargo.Text:='';
  dblServico.KeyValue:=0;
  dblUsuarioTipo.KeyValue:=0;
  mkAdmissao.Text:='';
  dblEstCivil.KeyValue:=0;
  edRG.Text:='';
  edEnderecoCob.Text:='';
  dblBairroCob.KeyValue:=0;
  dblMunicipioCob.KeyValue:=0;
  mkCepCob.Text:='';
  edNCarteira.Text:='';
  mkValCarteira.Text:='';
  edMsgCarteira.Text:='';
  mmObs.Lines.Clear;
end;

procedure Tf_CadUsuariosServicos.DBGrid1TitleClick(Column: TColumn);
begin
  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,');
  q_dados.SQL.add('DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICIPIO,');
  q_dados.SQL.add('MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, UFEMP,');
  q_dados.SQL.add('CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, DIAVENCIMENTO,');
  q_dados.SQL.add('DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECOCOB, BAIRROCOB,');
  q_dados.SQL.add('MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDADECARTEIRA,');
  q_dados.SQL.add('VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERACAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB,  ULTIMOPAGTO, IDFORMAPAGTO');
  q_dados.SQL.add('FROM W_ASSOCIADOS');
  case cbPesquisa.ItemIndex of
    0:begin; q_dados.SQL.Add('WHERE upper(ASSOCIADO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    1:begin; q_dados.SQL.Add('WHERE upper(SITUACAO) like :c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text)+'%'; end;
    2:begin; q_dados.SQL.Add('WHERE upper(CATEGORIA) like :c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text)+'%'; end;
    3:begin; q_dados.SQL.Add('WHERE upper(BAIRRO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    4:begin; q_dados.SQL.Add('WHERE upper(MUNICIPIO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    5:begin; q_dados.SQL.Add('WHERE upper(EMAIL) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    6:begin; q_dados.SQL.Add('WHERE CODIGO=:c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text); end;
    7:begin; q_dados.SQL.Add('WHERE TITULOSDEB >:c'); q_Dados.Parameters[0].Value:=0; end;
  end;
  q_dados.sql.add('order by '+ column.fieldname);
  q_dados.open;
end;

procedure Tf_CadUsuariosServicos.cbPesquisaCloseUp(Sender: TObject);
begin
  edPesquisar.SetFocus;
end;

procedure Tf_CadUsuariosServicos.SpeedButton5Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadBairros, f_CadBairros);
  f_CadBairros.ShowModal;
end;

procedure Tf_CadUsuariosServicos.SpeedButton4Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadMunicipios, f_CadMunicipios);
  f_CadMunicipios.ShowModal;
end;

procedure Tf_CadUsuariosServicos.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadEstCivil, f_CadEstCivil);
  f_CadEstCivil.ShowModal;
end;

procedure Tf_CadUsuariosServicos.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadServicosClube, f_CadServicosClube);
  f_CadServicosClube.ShowModal;
end;

procedure Tf_CadUsuariosServicos.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadSituacao, f_CadSituacao);
  f_CadSituacao.ShowModal;
end;

procedure Tf_CadUsuariosServicos.q_DadosAfterScroll(DataSet: TDataSet);
begin
  case Length(inttostr(q_DadosIDCODIGO.value)) of // Formata exibição do Registro no SystemBar
    1:Systembar1.SimpleText:=' REGISTRO : 00000'+inttostr(q_DadosIDCODIGO.value);
    2:Systembar1.SimpleText:=' REGISTRO : 0000'+inttostr(q_DadosIDCODIGO.value);
    3:Systembar1.SimpleText:=' REGISTRO : 000'+inttostr(q_DadosIDCODIGO.value);
    4:Systembar1.SimpleText:=' REGISTRO : 00'+inttostr(q_DadosIDCODIGO.value);
    5:Systembar1.SimpleText:=' REGISTRO : 0'+inttostr(q_DadosIDCODIGO.value);
  end;

  mmObs.Lines.Clear;
  edNomeAssociado.Text:=q_DadosNOME.value;
  dblSituacao.KeyValue:=q_DadosIDSITUACAO.Value;
  mkCPF.Text:=q_DadosCPF.Value;
  if q_DadosDTNASCIMENTO.Value=0 then mkDtNasc.Text:='  /  /    '
  else mkDtNasc.Text:=datetostr(q_DadosDTNASCIMENTO.Value);
  if q_DadosSEXO.Value='M' then RadioGroup1.ItemIndex:=0
  else RadioGroup1.ItemIndex:=1;
  mkFone.Text:=q_DadosTELEFONEFIXO.Value;
  mkCelular.Text:=q_DadosTELEFONECEL.Value;
  edEndereco.Text:=q_DadosENDERECO.Value;
  dblBairro.KeyValue:=q_DadosIDBAIRRO.Value;
  dblMunicipio.KeyValue:=q_DadosIDMUNICIPIO.Value;
  mkCep.Text:=q_DadosCEP.Value;
  dblServico.KeyValue:=q_DadosIDTIPOSERVICO.Value;
  dblUsuarioTipo.KeyValue:=q_DadosIDTIPOUSUARIO.Value;
  edRG.Text:=q_DadosRG.Value;

{  edEnderecoCob.Text:=q_DadosENDERECOCOB.Value;
  dblBairroCob.KeyValue:=q_DadosBAIRROCOB.Value;
  dblMunicipioCob.KeyValue:=q_DadosMUNICIPIOCOB.Value;
  dblFormaCob.KeyValue:=q_DadosIDFORMAPAGTO.Value;
  mkCepCob.Text:=q_DadosCEPCOB.Value;
  edNCarteira.Text:=q_DadosNUMCARTEIRA.Value;
  if q_DadosVALIDADECARTEIRA.Value=0 then mkValCarteira.Text:='  /  /    '
  else mkValCarteira.Text:=datetostr(q_DadosVALIDADECARTEIRA.Value);
  edMsgCarteira.Text:=q_DadosMENSAGEMCARTEIRA.Value;
  }
  edEmail.Text:=q_DadosEMAIL.Value;

{  mmObs.Lines.Text:=q_DadosOBSERVACOES.Value;
  lbTitulo.Caption:=inttostr(q_DadosCODIGO.Value);
  mkUltPagto.Text:=datetostr(q_DadosDTULTPAGTO.Value);
  if q_DadosTITULOSDEB.Value=0 then begin
    label39.Caption:='0 Abertas';
    label39.Font.Color:=clblue;
  end else begin
    label39.Caption:=inttostr(q_DadosTITULOSDEB.Value)+' Abertas';
    label39.Font.Color:=clRed;
  end;
  label44.Caption:=q_DadosSITUACAO.Value;
  btAlteraSit.Enabled:=true;

  ComboBox1.Items.Clear;
  if q_DadosidSITUACAO.Value=4 then ComboBox1.Items.add('Ativo')
  else if q_DadosidSITUACAO.Value=3 then btAlteraSit.Enabled:=false
  else begin
    ComboBox1.Items.add('Cancelado');
    ComboBox1.Items.add('Suspenso')
  end;

  q_Dependentes.close;
  q_Dependentes.Parameters[0].Value:=q_DadosCODIGO.value;
  q_Dependentes.open;
  }

  q_Pagamentos.close;
  q_Pagamentos.Parameters[0].Value:=q_DadosIDCODIGO.value;
  q_Pagamentos.Parameters[1].Value:='S';
  q_Pagamentos.open;

//  if q_DadosULTIMOPAGTO.Value='' then label40.Caption:=q_PagamentosREFERENCIA.Value
//  else label40.Caption:=q_DadosULTIMOPAGTO.Value;
end;

procedure Tf_CadUsuariosServicos.TabSheet3Show(Sender: TObject);
begin
  if  f_CadUsuariosServicos.Caption='Cadastro de Usuarios de Serviços - INCLUSÃO' then begin
    edEnderecoCob.Text:=edEndereco.Text;
    mkCepCob.Text:=mkCep.Text;
    dblBairroCob.KeyValue:=dblBairro.KeyValue;
    dblMunicipioCob.KeyValue:=dblMunicipio.KeyValue;
  end;
end;

procedure Tf_CadUsuariosServicos.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(Tf_relFichaAssociado, f_relFichaAssociado);
  f_relFichaAssociado.QuickRep1.Preview;  
end;

procedure Tf_CadUsuariosServicos.q_DadosAfterOpen(DataSet: TDataSet);
begin
  f_AtualizandoBase.Close;
end;

procedure Tf_CadUsuariosServicos.SpeedButton6Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadUsuariosTipo, f_CadUsuariosTipo);
  f_CadUsuariosTipo.ShowModal;
end;

procedure Tf_CadUsuariosServicos.btBuscarClick(Sender: TObject);
begin
  q_DadosAss.close;
  q_DadosAss.sql.clear;
  q_DadosAss.SQL.add('SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,');
  q_DadosAss.SQL.add('DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICIPIO,');
  q_DadosAss.SQL.add('MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, UFEMP,');
  q_DadosAss.SQL.add('CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, DIAVENCIMENTO,');
  q_DadosAss.SQL.add('DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECOCOB, BAIRROCOB,');
  q_DadosAss.SQL.add('MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDADECARTEIRA,');
  q_DadosAss.SQL.add('VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERACAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB, ULTIMOPAGTO, IDFORMAPAGTO, SITUACAOFIN');
  q_DadosAss.SQL.add('FROM W_ASSOCIADOS');
  q_DadosAss.SQL.Add('WHERE CODIGO=:c');
  q_DadosAss.Parameters[0].Value:=edTitulo.Text;
  q_DadosAss.open;

  if q_DadosAss.RecordCount=0 then begin
    btImportar.Enabled:=false;
    ShowMessage('ERRO: Associado não localizado.');
    mmDadosAssociado.Lines.clear;
    exit;
  end;

  if q_DadosAssSITUACAO.Value='INATIVO' then
    btImportar.Enabled:=false  // INATIVO
  else
    btImportar.Enabled:=true;

  if q_DadosAssUSINCLUSAO.Value=999 then begin
    showmessage('ERRO: Registro JA importado, impossivel reexportar.');
    exit;
  end;

  mmDadosAssociado.Lines.clear;
  mmDadosAssociado.Lines.Add('Nome     : '+q_DadosAssASSOCIADO.Value);
  mmDadosAssociado.Lines.Add('CPF      : '+q_DadosAssCPF.Value);
  mmDadosAssociado.Lines.Add('RG       : '+q_DadosAssRG.Value);
  mmDadosAssociado.Lines.Add('Dt Nasc  : '+datetostr(q_DadosAssDTNASC.Value));
  mmDadosAssociado.Lines.Add('Celular  : '+q_DadosAssFONE1.Value);
  mmDadosAssociado.Lines.Add('Situacao : '+q_DadosAssSITUACAO.Value);

end;

procedure Tf_CadUsuariosServicos.TabSheet4Enter(Sender: TObject);
begin
  edTitulo.SetFocus;
end;

procedure Tf_CadUsuariosServicos.btImportarClick(Sender: TObject);
begin

  sbIncluir.Click;

  edNomeAssociado.Text:=q_DadosAssASSOCIADO.value;
  dblSituacao.KeyValue:=q_DadosAssIDSITUACAO.Value;
  mkCPF.Text:=q_DadosAssCPF.Value;
  mkDtNasc.Text:=datetostr(q_DadosAssDTNASC.Value);
  if q_DadosAssSEXO.Value='M' then RadioGroup1.ItemIndex:=0
  else RadioGroup1.ItemIndex:=1;
  mkFone.Text:=q_DadosAssFONE1.Value;
  mkCelular.Text:=q_DadosAssFONE2.Value;
  edEndereco.Text:=q_DadosAssENDERECO.Value;
  dblBairro.KeyValue:=q_DadosAssIDBAIRRO.Value;
  dblMunicipio.KeyValue:=q_DadosAssIDMUNICIPIO.Value;
  mkCep.Text:=q_DadosAssCEP.Value;
  edRG.Text:=q_DadosAssRG.Value;
  edEmail.Text:=q_DadosAssEMAIL.Value;
  dblEstCivil.KeyValue:=q_DadosAssIDESTADOCIVIL.Value;
  dblUsuarioTipo.KeyValue:=1;
  dblUsuarioTipo.Enabled:=false;

  edTitulo.Text:='';
  mmDadosAssociado.Clear;

  vImportado:=1;
  
  TabSheet1.Show;
end;

end.

