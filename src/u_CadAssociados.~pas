unit u_CadAssociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, yupack, YuSoftButton1, ComCtrls, Grids,
  DBGrids, DB, DBTables, ExtCtrls, DBCtrls, ActnList, Mask, SMBar, ADODB;

type
  Tf_CadAssociados = class(TForm)
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
    TabSheet4: TTabSheet;
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
    dblCategoria: TDBLookupComboBox;
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
    GroupBox8: TGroupBox;
    Label21: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    SpeedButton12: TSpeedButton;
    edDependente: TEdit;
    mkDtNascParentesco: TMaskEdit;
    dblParentesco: TDBLookupComboBox;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox9: TGroupBox;
    DBGrid3: TDBGrid;
    edCargo: TEdit;
    Label35: TLabel;
    mkAdmissao: TMaskEdit;
    Label37: TLabel;
    edNCarteira: TEdit;
    Label38: TLabel;
    edMsgCarteira: TEdit;
    q_DadosSEQUENCIA: TIntegerField;
    q_DadosCODIGO: TIntegerField;
    q_DadosASSOCIADO: TStringField;
    q_DadosIDSITUACAO: TIntegerField;
    q_DadosSITUACAO: TStringField;
    q_DadosCPF: TStringField;
    q_DadosDTNASC: TDateField;
    q_DadosSEXO: TStringField;
    q_DadosFONE1: TStringField;
    q_DadosFONE2: TStringField;
    q_DadosENDERECO: TStringField;
    q_DadosIDBAIRRO: TIntegerField;
    q_DadosBAIRRO: TStringField;
    q_DadosIDMUNICIPIO: TIntegerField;
    q_DadosMUNICIPIO: TStringField;
    q_DadosIDUF: TIntegerField;
    q_DadosUF: TStringField;
    q_DadosCEP: TStringField;
    q_DadosENDERECOEMP: TStringField;
    q_DadosBAIRROEMP: TIntegerField;
    q_DadosMUNICIPIOEMP: TIntegerField;
    q_DadosUFEMP: TIntegerField;
    q_DadosCEPEMP: TStringField;
    q_DadosFONEMP: TStringField;
    q_DadosNOMEEMPRESA: TStringField;
    q_DadosCARTEIRA: TStringField;
    q_DadosIDCATEGORIA: TIntegerField;
    q_DadosCATEGORIA: TStringField;
    q_DadosDIAVENCIMENTO: TIntegerField;
    q_DadosDTADMISSAO: TDateField;
    q_DadosDTULTPAGTO: TDateField;
    q_DadosIDESTADOCIVIL: TIntegerField;
    q_DadosESTADOCIVIL: TStringField;
    q_DadosRG: TStringField;
    q_DadosENDERECOCOB: TStringField;
    q_DadosBAIRROCOB: TIntegerField;
    q_DadosMUNICIPIOCOB: TIntegerField;
    q_DadosUFCOB: TIntegerField;
    q_DadosCEPCOB: TStringField;
    q_DadosDTEXPCARTEIRA: TIntegerField;
    q_DadosNUMCARTEIRA: TStringField;
    q_DadosVALIDADECARTEIRA: TDateField;
    q_DadosVIACARTEIRA: TIntegerField;
    q_DadosMENSAGEMCARTEIRA: TStringField;
    q_DadosDTINCLUSAO: TDateField;
    q_DadosDTALTERACAO: TDateField;
    q_DadosUSALTERACAO: TIntegerField;
    q_DadosUSINCLUSAO: TIntegerField;
    q_DadosEMAIL: TStringField;
    d_Dependentes: TDataSource;
    q_Dependentes: TADOQuery;
    q_DependentesIDDEPENDENTE: TIntegerField;
    q_DependentesIDPARENTESCO: TIntegerField;
    q_DependentesIDASSOCIADO: TIntegerField;
    q_DependentesFONE: TStringField;
    q_DependentesNOMEDEPENDENTE: TStringField;
    q_DependentesDTNASCIMENTO: TDateField;
    q_DependentesDEPCARNUM: TStringField;
    q_DependentesDEPCARVAL: TDateField;
    q_DependentesDEPCARVIA: TIntegerField;
    q_DependentesDEPCARMSG: TStringField;
    q_DependentesDTINCLUSAO: TDateField;
    q_DependentesDTALTERACAO: TDateField;
    q_DependentesUSALTERACAO: TIntegerField;
    q_DependentesUSINCLUSAO: TIntegerField;
    q_DependentesEMAIL: TStringField;
    q_DependentesNPARENTESCO: TStringField;
    mmObs: TMemo;
    q_DadosOBSERVACOES: TMemoField;
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
    q_SequencialDep: TADOQuery;
    q_SequencialDepMAX: TIntegerField;
    q_MaxSequencia: TADOQuery;
    q_MaxSequenciaMAX: TIntegerField;
    q_PagamentosDESCRICAOPADRAO: TStringField;
    q_DadosTITULOSDEB: TIntegerField;
    Label39: TLabel;
    pnDependentes: TPanel;
    DBGrid4: TDBGrid;
    Label40: TLabel;
    q_DadosULTIMOPAGTO: TStringField;
    q_DepBuscar: TADOQuery;
    d_DepBuscar: TDataSource;
    q_DepBuscarNOMEDEPENDENTE: TStringField;
    q_DepBuscarDTNASCIMENTO: TDateField;
    q_DepBuscarIDTITULO: TIntegerField;
    q_DepBuscarEMAIL: TStringField;
    q_DadosIDFORMAPAGTO: TIntegerField;
    Label41: TLabel;
    dblFormaCob: TDBLookupComboBox;
    TabSheet6: TTabSheet;
    Bevel1: TBevel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ComboBox1: TComboBox;
    btAlteraSit: TBitBtn;
    Button1: TButton;
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
    procedure SpeedButton12Click(Sender: TObject);
    procedure q_DadosAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Label39Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure pnDependentesDblClick(Sender: TObject);
    procedure q_DepBuscarAfterScroll(DataSet: TDataSet);
    procedure btAlteraSitClick(Sender: TObject);
    procedure q_DadosAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    vZebrado:integer;
    vRegistro:integer; // No registro exibido no SYSTEMBAR
    vPos:integer; // Guarda posição de caracteres coringa
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CadAssociados: Tf_CadAssociados;

implementation

uses u_dados, u_CadBairros, u_CadMunicipios, u_CadEstCivil,
  u_CadCategorias, u_CadSituacao, u_CadParentescos,
  u_relListaFormCadAssociado, u_relFichaAssociado, u_BaixaPagtosManual, u_AtualizandoBase,
  u_ConfigRelCadastroAss, u_MenuPrincipal;
{$R *.dfm}

function botoes(adi: Boolean; alt: Boolean; sal: Boolean; exc: Boolean; atu: Boolean): Boolean;
begin
  f_CadAssociados.sbIncluir.Enabled:=adi;
  f_CadAssociados.sbEditar.Enabled:=alt;
  f_CadAssociados.sbSalvar.Enabled:=sal;
  f_CadAssociados.sbDeletar.Enabled:=exc;
  f_CadAssociados.sbAtualizar.Enabled:=atu;
end;


procedure Tf_CadAssociados.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tf_CadAssociados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tf_CadAssociados.FormCreate(Sender: TObject);
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
end;

procedure Tf_CadAssociados.acIncluirExecute(Sender: TObject);
begin
  if sbIncluir.Enabled=false then exit;
  sbLimpar.Click;
  pnDependentes.Visible:=FALSE;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox7.Enabled:=true;
  GroupBox2.Enabled:=false;

  PageControl1.ActivePage:=TabSheet1;
  edNomeAssociado.SetFocus;
  f_CadAssociados.Caption:='Cadastro de Associados - INCLUSÃO';
  botoes(false,false,true,false,true); // Restaura situação dos Botões

end;

procedure Tf_CadAssociados.acSalvarExecute(Sender: TObject);
var
  vPos:TBookmark;
begin
  if sbSalvar.Enabled=false then exit;
  PageControl1.ActivePage:=TabSheet1; // Torna DADOS CADASTRO padrão
  if f_CadAssociados.Caption='Cadastro de Associados - INCLUSÃO' then begin // Rotina de Inserção
    // Insere dados no Banco
//    try

      q_MaxSequencia.Open;

      dm_Dados.q_Configuracoes.open;

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into TBASSOCIADOS (ASSCOD, ASSNOM, ASSSIT, ASSCPF, ASSNAS,');
        sql.add('ASSSEX, ASSFON1, ASSFON2, ASSEND, ASSBAI, ASSMUN, ASSUF, ASSCEP, ASSEMPEND,');
        sql.add('ASSEMPBAI, ASSEMPMUN, ASSEMPUF, ASSEMPCEP, ASSEMPFON, ASSEMP, ASSCAR, PLACOD,');
        sql.add('ASSDIAVEN, ASSADM, ASSESTCIVIL, ASSRG, ASSCOBEND, ASSCOBBAI, ASSCOBMUN,');
        sql.add('ASSCOBUF, ASSCOBCEP, ASSCARNUM, ASSCARVAL, ASSCARMSG,');
        sql.add('USALTERACAO, USINCLUSAO, EMAIL, ASSOBS, SEQUENCIA, IDFORMAPAGTO)');
        sql.Add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x,:y,:z,');
        sql.Add(':c1,:c2,:c3,:c4,:c5,:c6,:c7,:c8,:c9,:c0,:d1,:d2,:d3,:d4,:d5,:d6)');
        Parameters[0].Value:=dm_Dados.q_ConfiguracoesNUMTITULO.Value+1;
        Parameters[1].Value:=edNomeAssociado.Text;
        Parameters[2].Value:=2;  // ATIVO
        Parameters[3].Value:=mkCPF.Text;
        if mkDtNasc.Text='  /  /    ' then Parameters[4].Value:=null
        else Parameters[4].Value:=strtodate(mkDtNasc.Text);
        if RadioGroup1.ItemIndex=0 then Parameters[5].Value:='M'
        else Parameters[5].Value:='F';
        Parameters[6].Value:=mkFone.Text;
        Parameters[7].Value:=mkCelular.Text;
        Parameters[8].Value:=edEndereco.Text;
        if dblBairro.KeyValue=0 then Parameters[9].Value:=1
        else Parameters[9].Value:=dblBairro.KeyValue;
        if dblMunicipio.KeyValue=0 then Parameters[10].Value:=1
        else Parameters[10].Value:=dblMunicipio.KeyValue;
        Parameters[11].Value:=1;                                      // CE
        Parameters[12].Value:=mkCep.Text;
        Parameters[13].Value:=edEnderecoEmp.Text;
        if dblBairroEmp.KeyValue=0 then Parameters[14].Value:=1
        else Parameters[14].Value:=dblBairroEmp.KeyValue;
        if dblMunicipioEmp.KeyValue=0 then Parameters[15].Value:=1
        else Parameters[15].Value:=dblMunicipioEmp.KeyValue;
        Parameters[16].Value:=1;                                      // CE
        Parameters[17].Value:=mkCepEmp.Text;
        Parameters[18].Value:=mkFone1Emp.Text;
        Parameters[19].Value:=edEmpresa.Text;
        Parameters[20].Value:=edCargo.Text;
        if dblCategoria.KeyValue=0 then Parameters[21].Value:=1
        else Parameters[21].Value:=dblCategoria.KeyValue;                  //
        Parameters[22].Value:=0;                                      // dia do vencimento
        if mkAdmissao.Text='  /  /    ' then Parameters[23].Value:=null
        else Parameters[23].Value:=strtodate(mkAdmissao.Text);
        if dblEstCivil.KeyValue=0 then Parameters[24].Value:=1
        else Parameters[24].Value:=dblEstCivil.KeyValue;
        Parameters[25].Value:=edRG.Text;
        Parameters[26].Value:=edEnderecoCob.Text;
        if dblBairroCob.KeyValue=0 then Parameters[27].Value:=1
        else Parameters[27].Value:=dblBairroCob.KeyValue;
        if dblMunicipioCob.KeyValue=0 then Parameters[28].Value:=1
        else Parameters[28].Value:=dblMunicipioCob.KeyValue;
        Parameters[29].Value:=1;                                      // CE
        Parameters[30].Value:=mkCepCob.Text;
        Parameters[31].Value:=edNCarteira.Text;
        if mkValCarteira.Text='  /  /    ' then Parameters[32].Value:=null
        else Parameters[32].Value:=strtodate(mkValCarteira.Text);
        Parameters[33].Value:=edMsgCarteira.Text;
        Parameters[34].Value:=1;
        Parameters[35].Value:=1;
        Parameters[36].Value:=edEmail.Text;
        Parameters[37].Value:=mmObs.Lines.Text;
        Parameters[38].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;
        Parameters[39].Value:=dblFormaCob.KeyValue;
        execsql;
      end; // Fim Inserção

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into TBASSOCIADOSACOES (IDCODIGO, IDASSOCIADO, VALORACAO, IDASSREGISTRO)');
        sql.Add('values (:c,:d,:e,:f)');
        Parameters[0].Value:=dm_Dados.q_ConfiguracoesNUMTITULO.Value+1;
        Parameters[1].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;;
        Parameters[2].Value:=0;
        Parameters[3].Value:=q_MaxSequenciaMAX.Value+1;
        execsql;
      end; // Fim Inserção

      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update tbconfiguracoes set numtitulo=:c, numassociado=:d');
        Parameters[0].Value:=dm_Dados.q_ConfiguracoesNUMTITULO.Value+1;
        Parameters[1].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;
        execsql;
      end;

      dm_Dados.q_Configuracoes.close;
      q_MaxSequencia.close;

      showmessage('MENSAGEM: Registro Inserido.');
      f_CadAssociados.Caption:='Cadastro de Associados';
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
        sql.add('update TBASSOCIADOS set ASSCOD=:c, ASSNOM=:d, ASSSIT=:e, ASSCPF=:f, ASSNAS=:g,');
        sql.add('ASSSEX=:h, ASSFON1=:i, ASSFON2=:j, ASSEND=:k, ASSBAI=:l, ASSMUN=:m, ASSUF=:n, ASSCEP=:o, ASSEMPEND=:p,');
        sql.add('ASSEMPBAI=:q, ASSEMPMUN=:r, ASSEMPUF=:s, ASSEMPCEP=:t, ASSEMPFON=:u, ASSEMP=:v, ASSCAR=:w, PLACOD=:x,');
        sql.add('ASSDIAVEN=:y, ASSADM=:z, ASSESTCIVIL=:c1, ASSRG=:c2, ASSCOBEND=:c3, ASSCOBBAI=:c4, ASSCOBMUN=:c5,');
        sql.add('ASSCOBUF=:c6, ASSCOBCEP=:c7, ASSCARNUM=:c8, ASSCARVAL=:c9, ASSCARMSG=:c0,');
        sql.add('USALTERACAO=:d1, USINCLUSAO=:d2, EMAIL=:d3, ASSOBS=:d4, IDFORMAPAGTO=:d5');
        sql.add('where SEQUENCIA=:z9');
        Parameters[0].Value:=q_DadosCODIGO.value;
        Parameters[1].Value:=edNomeAssociado.Text;
        if dblSituacao.KeyValue=0 then Parameters[2].Value:=1
        else Parameters[2].Value:=dblSituacao.KeyValue;
        Parameters[3].Value:=mkCPF.Text;
        if mkDtNasc.Text='  /  /    ' then Parameters[4].Value:=null
        else Parameters[4].Value:=strtodate(mkDtNasc.Text);
        if RadioGroup1.ItemIndex=0 then Parameters[5].Value:='M'
        else Parameters[5].Value:='F';
        Parameters[6].Value:=mkFone.Text;
        Parameters[7].Value:=mkCelular.Text;
        Parameters[8].Value:=edEndereco.Text;
        if dblBairro.KeyValue=0 then Parameters[9].Value:=1
        else Parameters[9].Value:=dblBairro.KeyValue;
        if dblMunicipio.KeyValue=0 then Parameters[10].Value:=1
        else Parameters[10].Value:=dblMunicipio.KeyValue;
        Parameters[11].Value:=1;                                      // CE
        Parameters[12].Value:=mkCep.Text;
        Parameters[13].Value:=edEnderecoEmp.Text;
        if dblBairroEmp.KeyValue=0 then Parameters[14].Value:=1
        else Parameters[14].Value:=dblBairroEmp.KeyValue;
        if dblMunicipioEmp.KeyValue=0 then Parameters[15].Value:=1
        else Parameters[15].Value:=dblMunicipioEmp.KeyValue;
        Parameters[16].Value:=1;                                      // CE
        Parameters[17].Value:=mkCepEmp.Text;
        Parameters[18].Value:=mkFone1Emp.Text;
        Parameters[19].Value:=edEmpresa.Text;
        Parameters[20].Value:=edCargo.Text;
        if dblCategoria.KeyValue=0 then Parameters[21].Value:=1
        else Parameters[21].Value:=dblCategoria.KeyValue;                  //
        Parameters[22].Value:=0;                                      // dia do vencimento
        if mkAdmissao.Text='  /  /    ' then Parameters[23].Value:=null
        else Parameters[23].Value:=strtodate(mkAdmissao.Text);
        if dblEstCivil.KeyValue=0 then Parameters[24].Value:=1
        else Parameters[24].Value:=dblEstCivil.KeyValue;
        Parameters[25].Value:=edRG.Text;
        Parameters[26].Value:=edEnderecoCob.Text;
        if dblBairroCob.KeyValue=0 then Parameters[27].Value:=1
        else Parameters[27].Value:=dblBairroCob.KeyValue;
        if dblMunicipioCob.KeyValue=0 then Parameters[28].Value:=1
        else Parameters[28].Value:=dblMunicipioCob.KeyValue;
        Parameters[29].Value:=1;                                      // CE
        Parameters[30].Value:=mkCepCob.Text;
        Parameters[31].Value:=edNCarteira.Text;
        if mkValCarteira.Text='  /  /    ' then Parameters[32].Value:=null
        else Parameters[32].Value:=strtodate(mkValCarteira.Text);
        Parameters[33].Value:=edMsgCarteira.Text;
        Parameters[34].Value:=1;
        Parameters[35].Value:=1;
        Parameters[36].Value:=edEmail.Text;
        Parameters[37].Value:=mmObs.Lines.Text;
        Parameters[38].Value:=dblFormaCob.KeyValue;
        Parameters[39].Value:=q_DadosSEQUENCIA.Value;
        execsql;
      end; // Fim Inserção

      showmessage('MENSAGEM: Registro Alterado.');
      f_CadAssociados.Caption:='Cadastro de Associados';
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

procedure Tf_CadAssociados.cbPesquisaDblClick(Sender: TObject);
begin
  cbPesquisa.Text:='';
  edPesquisar.Text:='';
end;

procedure Tf_CadAssociados.DBGrid1DrawColumnCell(Sender: TObject;
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


  if (q_DadosSITUACAO.value='INATIVO') then begin
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clred;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  if (q_DadosSITUACAO.value='INDEFINIDO') then begin
//    grLista.Canvas.Brush.Color:= $00AEDBD9;
    DBGrid1.Canvas.Font.Color:= clblack;
    DBGrid1.Canvas.FillRect(Rect);
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tf_CadAssociados.acEditarExecute(Sender: TObject);
begin
  if sbEditar.Enabled=false then exit;
  pnDependentes.Visible:=FALSE;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox7.Enabled:=true;
  GroupBox2.Enabled:=false;
  PageControl1.ActivePage:=TabSheet1;
  edNomeAssociado.SetFocus;
  f_CadAssociados.Caption:='Cadastro de Associados - ALTERAÇÃO';

  botoes(false,false,true,false,true); // Restaura situação dos Botões
end;

procedure Tf_CadAssociados.acAtualizarExecute(Sender: TObject);
begin
  if sbAtualizar.Enabled=false then exit;
  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;

  PageControl1.ActivePage:=TabSheet1;
  f_CadAssociados.Caption:='Cadastro de Associados';
  botoes(true,true,false,True,false); // Restaura situação dos Botões
  DBGrid1.SetFocus;
end;

procedure Tf_CadAssociados.acDeletarExecute(Sender: TObject);
var opc:integer;
begin
  if sbDeletar.Enabled=false then exit;
  pnDependentes.Visible:=FALSE;
  f_CadAssociados.Caption:='Cadastro de Associados - DELETAR REGISTRO '+copy(Systembar1.SimpleText,pos(':',Systembar1.SimpleText)+1,6);
  opc:=application.messagebox('Confirma exclusão do registro ','Confirmação',mb_yesno);
  if opc=idyes then begin
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBASSOCIADOS');
      sql.Add('where SEQUENCIA=:c');
      Parameters[0].Value:=q_DadosSEQUENCIA.value;
      execsql;
    end; // Fim Deletar
    showmessage('MENSAGEM: Registro Deletado.');
    f_CadAssociados.Caption:='Cadastro de Associados';
    q_Dados.Close;    // Atualiza GRID
    q_Dados.open;
    botoes(true,true,false,false,false); // Restaura situação dos Botões
  end
  else BEGIN
    showmessage('MENSAGEM: Operação cancelada.');
    f_CadAssociados.Caption:='Cadastro de Associados';
  END;
end;

procedure Tf_CadAssociados.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  f_CadAssociados.Caption:='Cadastro de Associados - CONSULTA';

  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;


  botoes(false,true,false,true,true); // Restaura situação dos Botões
end;

procedure Tf_CadAssociados.sbPesquisarClick(Sender: TObject);
begin
  sbAtualizar.Click;

  if cbPesquisa.ItemIndex=8 then begin
    pnDependentes.Width:=782;
    pnDependentes.Visible:=true;
    q_DepBuscar.close;
    q_DepBuscar.Parameters[0].value:='%'+uppercase(edPesquisar.Text)+'%';
    q_DepBuscar.open;
  end else begin
    pnDependentes.Visible:=FALSE;
    q_Dados.close;
    q_dados.sql.clear;
    q_dados.SQL.add('SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,');
    q_dados.SQL.add('DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICIPIO,');
    q_dados.SQL.add('MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, UFEMP,');
    q_dados.SQL.add('CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, DIAVENCIMENTO,');
    q_dados.SQL.add('DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECOCOB, BAIRROCOB,');
    q_dados.SQL.add('MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDADECARTEIRA,');
    q_dados.SQL.add('VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERACAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB, ULTIMOPAGTO, IDFORMAPAGTO');
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
    q_dados.SQL.add('ORDER BY ASSOCIADO');
    q_Dados.open;

    if q_Dados.RecordCount=0 then spImprimir.Enabled:=false
    else spImprimir.Enabled:=true;
  end;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;
end;

procedure Tf_CadAssociados.spImprimirClick(Sender: TObject);
var
  vContador,vSequencia,vAssCod,vSit:integer; vNome:string;
begin

  Application.CreateForm(Tf_ConfigRelCadastroAss, f_ConfigRelCadastroAss);
  f_ConfigRelCadastroAss.label2.Caption:=edPesquisar.Text;
  f_ConfigRelCadastroAss.label3.Caption:=cbPesquisa.Text;
  f_ConfigRelCadastroAss.ShowModal;

{
  Application.CreateForm(Tf_relListaFormCadAssociado, f_relListaFormCadAssociado);
  f_relListaFormCadAssociado.qrlFiltro.Caption:='Filtro: '+cbPesquisa.Text+'   Conteúdo: '+uppercase(edPesquisar.Text);
  f_relListaFormCadAssociado.qrlabel3.Caption:='Registros: '+inttostr(f_CadAssociados.q_Dados.RecordCount);
  f_relListaFormCadAssociado.QuickRep1.Preview;
}
end;

procedure Tf_CadAssociados.sbLimparClick(Sender: TObject);
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
  dblCategoria.KeyValue:=0;
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

procedure Tf_CadAssociados.DBGrid1TitleClick(Column: TColumn);
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

procedure Tf_CadAssociados.cbPesquisaCloseUp(Sender: TObject);
begin
  edPesquisar.SetFocus;
end;

procedure Tf_CadAssociados.SpeedButton5Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadBairros, f_CadBairros);
  f_CadBairros.ShowModal;
end;

procedure Tf_CadAssociados.SpeedButton4Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadMunicipios, f_CadMunicipios);
  f_CadMunicipios.ShowModal;
end;

procedure Tf_CadAssociados.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadEstCivil, f_CadEstCivil);
  f_CadEstCivil.ShowModal;
end;

procedure Tf_CadAssociados.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadCategorias, f_CadCategorias);
  f_CadCategorias.ShowModal;
end;

procedure Tf_CadAssociados.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadSituacao, f_CadSituacao);
  f_CadSituacao.ShowModal;
end;

procedure Tf_CadAssociados.SpeedButton12Click(Sender: TObject);
begin
  Application.CreateForm(Tf_CadParentescos, f_CadParentescos);
  f_CadParentescos.ShowModal;
end;

procedure Tf_CadAssociados.q_DadosAfterScroll(DataSet: TDataSet);
begin


  case Length(inttostr(q_DadosSEQUENCIA.value)) of // Formata exibição do Registro no SystemBar
    1:Systembar1.SimpleText:=' REGISTRO : 00000'+inttostr(q_DadosSEQUENCIA.value);
    2:Systembar1.SimpleText:=' REGISTRO : 0000'+inttostr(q_DadosSEQUENCIA.value);
    3:Systembar1.SimpleText:=' REGISTRO : 000'+inttostr(q_DadosSEQUENCIA.value);
    4:Systembar1.SimpleText:=' REGISTRO : 00'+inttostr(q_DadosSEQUENCIA.value);
    5:Systembar1.SimpleText:=' REGISTRO : 0'+inttostr(q_DadosSEQUENCIA.value);
  end;

  mmObs.Lines.Clear;
  edNomeAssociado.Text:=q_DadosASSOCIADO.value;
  dblSituacao.KeyValue:=q_DadosIDSITUACAO.Value;
  mkCPF.Text:=q_DadosCPF.Value;
  if q_DadosDTNASC.Value=0 then mkDtNasc.Text:='  /  /    '
  else mkDtNasc.Text:=datetostr(q_DadosDTNASC.Value);
  if q_DadosSEXO.Value='M' then RadioGroup1.ItemIndex:=0
  else RadioGroup1.ItemIndex:=1;
  mkFone.Text:=q_DadosFONE1.Value;
  mkCelular.Text:=q_DadosFONE2.Value;
  edEndereco.Text:=q_DadosENDERECO.Value;
  dblBairro.KeyValue:=q_DadosIDBAIRRO.Value;
  dblMunicipio.KeyValue:=q_DadosIDMUNICIPIO.Value;
  mkCep.Text:=q_DadosCEP.Value;
  edEnderecoEmp.Text:=q_DadosENDERECOEMP.Value;
  dblBairroEmp.KeyValue:=q_DadosBAIRROEMP.Value;
  dblMunicipioEmp.KeyValue:=q_DadosMUNICIPIOEMP.Value;
  mkCepEmp.Text:=q_DadosCEPEMP.Value;
  mkFone1Emp.Text:=q_DadosFONEMP.Value;
  edEmpresa.Text:=q_DadosNOMEEMPRESA.Value;
  edCargo.Text:=q_DadosCARTEIRA.Value;    //cargo
  dblCategoria.KeyValue:=q_DadosIDCATEGORIA.Value;
  if q_DadosDTADMISSAO.Value=0 then mkAdmissao.Text:='  /  /    '
  else mkAdmissao.Text:=datetostr(q_DadosDTADMISSAO.Value);
  dblEstCivil.KeyValue:=q_DadosIDESTADOCIVIL.Value;
  edRG.Text:=q_DadosRG.Value;
  edEnderecoCob.Text:=q_DadosENDERECOCOB.Value;
  dblBairroCob.KeyValue:=q_DadosBAIRROCOB.Value;
  dblMunicipioCob.KeyValue:=q_DadosMUNICIPIOCOB.Value;
  dblFormaCob.KeyValue:=q_DadosIDFORMAPAGTO.Value;
  mkCepCob.Text:=q_DadosCEPCOB.Value;
  edNCarteira.Text:=q_DadosNUMCARTEIRA.Value;
  if q_DadosVALIDADECARTEIRA.Value=0 then mkValCarteira.Text:='  /  /    '
  else mkValCarteira.Text:=datetostr(q_DadosVALIDADECARTEIRA.Value);
  edMsgCarteira.Text:=q_DadosMENSAGEMCARTEIRA.Value;
  edEmail.Text:=q_DadosEMAIL.Value;
  mmObs.Lines.Text:=q_DadosOBSERVACOES.Value;
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

  q_Pagamentos.close;
  q_Pagamentos.Parameters[0].Value:=q_DadosCODIGO.value;
  q_Pagamentos.Parameters[1].Value:='S';
  q_Pagamentos.open;

  if q_DadosULTIMOPAGTO.Value='' then label40.Caption:=q_PagamentosREFERENCIA.Value
  else label40.Caption:=q_DadosULTIMOPAGTO.Value;


end;

procedure Tf_CadAssociados.BitBtn1Click(Sender: TObject);
begin
  if edDependente.Text='' then begin
    showmessage('ERRO: Nome do Dependente não informado.');
    edDependente.SetFocus;
    exit;
  end;
  if Systembar1.SimpleText='' then exit;

  q_SequencialDep.close;
  q_SequencialDep.Parameters[0].value:=q_DadosCODIGO.Value;
  q_SequencialDep.open;

  with dm_Dados.q_manipula do begin
    close;
    sql.Clear;
    sql.add('insert into TBDEPENDENTES (IDPARENTESCO, IDASSOCIADO, NOMEDEPENDENTE, DTNASCIMENTO,');
    sql.add('USALTERACAO, USINCLUSAO, IDSEQUENCIA, IDTITULO)');
    sql.Add('values (:c,:d,:e,:f,:g,:h,:i,:j)');
    Parameters[0].Value:=dblParentesco.KeyValue;
    Parameters[1].Value:=q_DadosSEQUENCIA.value;
    Parameters[2].Value:=edDependente.Text;
    if mkDtNascParentesco.Text='  /  /    ' then Parameters[3].Value:=null
    else Parameters[3].Value:=strtodate(mkDtNascParentesco.Text);
    Parameters[4].Value:=1;
    Parameters[5].Value:=1;
    Parameters[6].Value:=q_SequencialDepMAX.Value+1;
    Parameters[7].Value:=q_DadosCODIGO.value;
    execsql;
  end; // Fim Inserção

  q_Dependentes.close;
  q_Dependentes.Parameters[0].Value:=q_DadosCODIGO.value;
  q_Dependentes.open;
  q_Dependentes.Last;

  edDependente.Text:='';
  mkDtNasc.Text:='';
  dblParentesco.KeyValue:=null;
  edDependente.SetFocus;

  showmessage('INFORMAÇÃO: Dependente Cadastrado.');

end;

procedure Tf_CadAssociados.TabSheet3Show(Sender: TObject);
begin
  if  f_CadAssociados.Caption='Cadastro de Associados - INCLUSÃO' then begin
    edEnderecoCob.Text:=edEndereco.Text;
    mkCepCob.Text:=mkCep.Text;
    dblBairroCob.KeyValue:=dblBairro.KeyValue;
    dblMunicipioCob.KeyValue:=dblMunicipio.KeyValue;
  end;
end;

procedure Tf_CadAssociados.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(Tf_relFichaAssociado, f_relFichaAssociado);
  f_relFichaAssociado.QuickRep1.Preview;  
end;

procedure Tf_CadAssociados.Label39Click(Sender: TObject);
begin
  f_CadAssociados.Hide;
  Application.CreateForm(Tf_BaixaPagtosManual, f_BaixaPagtosManual);
  f_BaixaPagtosManual.edDocumento.Text:=inttostr(q_DadosCODIGO.value);
//  f_BaixaPagtosManual.btProcurar.Click;
  f_BaixaPagtosManual.ShowModal;
  f_CadAssociados.show;
end;

procedure Tf_CadAssociados.BitBtn2Click(Sender: TObject);
begin
  if q_Dependentes.RecordCount=0 then exit;

  if Application.MessageBox('Confirma exclusão do Dependente ','Confirmação',mb_yesno+MB_DEFBUTTON1)=id_yes then begin
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBdependentes');
      sql.Add('where iddependente=:c');
      Parameters[0].Value:=q_DependentesIDDEPENDENTE.value;
      execsql;
    end; // Fim Deletar
    showmessage('MENSAGEM: Registro Deletado.');
    q_Dependentes.Close;    // Atualiza GRID
    q_Dependentes.Parameters[0].Value:=q_DadosCODIGO.Value;
    q_Dependentes.open;
  end else showmessage('MENSAGEM: Operação cancelada.');
end;

procedure Tf_CadAssociados.pnDependentesDblClick(Sender: TObject);
begin
  pnDependentes.Visible:=false;
end;

procedure Tf_CadAssociados.q_DepBuscarAfterScroll(DataSet: TDataSet);
begin
  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,');
  q_dados.SQL.add('DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICIPIO,');
  q_dados.SQL.add('MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, UFEMP,');
  q_dados.SQL.add('CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, DIAVENCIMENTO,');
  q_dados.SQL.add('DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECOCOB, BAIRROCOB,');
  q_dados.SQL.add('MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDADECARTEIRA,');
  q_dados.SQL.add('VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERACAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB, ULTIMOPAGTO, IDFORMAPAGTO');
  q_dados.SQL.add('FROM W_ASSOCIADOS');
  q_dados.SQL.Add('WHERE CODIGO=:c');
  q_Dados.Parameters[0].Value:=q_DepBuscarIDTITULO.Value;
  q_dados.SQL.add('ORDER BY ASSOCIADO');
  q_Dados.open;
end;

procedure Tf_CadAssociados.btAlteraSitClick(Sender: TObject);
begin
//  Application.CreateForm(Tf_AtualizandoBase, f_AtualizandoBase);

  if q_DadosidSITUACAO.Value=4 then begin  //  OPCAO COMBOBOX SERÁ - ATIVO - ÚNICA DISPONÍVEL
    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociados set asssit=:d where asscod=:c');
      Parameters[0].Value:=2;
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;

    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociadosacoes set ativa=:d where idcodigo=:c');
      Parameters[0].Value:='S';
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;

    sbPesquisar.click;
//    f_AtualizandoBase.ShowModal;

  end else if ComboBox1.ItemIndex=0 then begin

    if Application.MessageBox('O CANCELAMENTO do registro so poderá ser revertido'+#13+
    'no procedimento de ACORDOS e LIBERAÇÕES, caso existam pendências financeiras. '+#13+
    'Esse procedimento exige a informação da senha pelo Presidente '+#13+#13+
    'Deseja realmente cancelar  ? ','Confirmação',mb_yesno+MB_DEFBUTTON2)=id_no then exit;

    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociados set asssit=:d where asscod=:c');
      Parameters[0].Value:=3;
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;

    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociadosacoes set ativa=:d where idcodigo=:c');
      Parameters[0].Value:='N';
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;
    sbPesquisar.click;

  end else if ComboBox1.ItemIndex=1 then begin

    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociados set asssit=:d where asscod=:c');
      Parameters[0].Value:=4;
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;

    with dm_Dados.q_manipula do begin
      close;
      sql.clear;
      sql.add('update tbassociadosacoes set ativa=:d where idcodigo=:c');
      Parameters[0].Value:='N';
      Parameters[1].Value:=q_DadosCODIGO.Value;
      execsql;
    end;
    sbPesquisar.click;
  end;
end;

procedure Tf_CadAssociados.q_DadosAfterOpen(DataSet: TDataSet);
begin
  f_AtualizandoBase.Close;
end;

procedure Tf_CadAssociados.Button1Click(Sender: TObject);
begin
  if f_MenuPrincipal.Label2.Caption='CLAUDIO' then begin
    q_Dados.first;
    try
      while not q_Dados.eof do begin

        q_Pagamentos.close;
        q_Pagamentos.Parameters[0].Value:=q_DadosCODIGO.value;
        q_Pagamentos.Parameters[1].Value:='S';
        q_Pagamentos.open;

        if q_Pagamentos.RecordCount>0 then begin
          dm_Dados.q_manipula.Close;
          dm_Dados.q_manipula.SQL.Clear;
          dm_Dados.q_manipula.SQL.add('update TBASSOCIADOS set ultimopagto=:a, assultpag=:b where asscod=:c');
          dm_Dados.q_manipula.Parameters[0].Value:=q_PagamentosREFERENCIA.Value;
          dm_Dados.q_manipula.Parameters[1].Value:=q_PagamentosDTPAGAMENTO.Value;
          dm_Dados.q_manipula.Parameters[2].Value:=q_DadosCODIGO.Value;
          dm_Dados.q_manipula.ExecSQL;
        end else begin
          dm_Dados.q_manipula.Close;
          dm_Dados.q_manipula.SQL.Clear;
          dm_Dados.q_manipula.SQL.add('update TBASSOCIADOS set ultimopagto=:a, assultpag=:b where asscod=:c');
          dm_Dados.q_manipula.Parameters[0].Value:='Sem Mov';
          dm_Dados.q_manipula.Parameters[1].Value:=StrToDate('01/01/2000');
          dm_Dados.q_manipula.Parameters[2].Value:=q_DadosCODIGO.Value;
          dm_Dados.q_manipula.ExecSQL;
        end;
        q_Dados.next;
      end;
    Except
      on eOutOfMemory do
        ShowMessage('Pau na memória');
      else
        ShowMessage('Outra coisa');
    end;
  end else begin
    showmessage('ERRO: Usuário não autorizado para esse procedimento.');
    exit;
  end;
end;

end.

