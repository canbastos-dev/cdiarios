unit u_CadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, yupack, YuSoftButton1, ComCtrls, Grids,
  DBGrids, DB, DBTables, ExtCtrls, DBCtrls, ActnList, Mask, SMBar, ADODB;

type
  Tf_CadUsuarios = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    edusuario: TEdit;
    edLogin: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    edEmail: TEdit;
    GroupBox6: TGroupBox;
    q_DadosIDUSUARIO: TIntegerField;
    q_DadosNOMEUSUARIO: TStringField;
    q_DadosSENHA: TStringField;
    q_DadosEMAIL: TStringField;
    q_DadosDTINCLUSAO: TDateField;
    q_DadosDTALTERACAO: TDateField;
    q_DadosUSINCLUSAO: TIntegerField;
    q_DadosUSALTERACAO: TIntegerField;
    q_DadosDEFINIRSENHA: TStringField;
    q_DadosSENHAOK: TStringField;
    q_DadosNLOGIN: TStringField;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    q_DadosASSOBS: TMemoField;
    q_DadosIDTIPO: TIntegerField;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    edSenha1: TEdit;
    edSenha2: TEdit;
    BitBtn2: TBitBtn;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure q_DadosAfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    vZebrado:integer;
    vRegistro:integer; // No registro exibido no SYSTEMBAR
    vPos:integer; // Guarda posição de caracteres coringa
    vParam:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CadUsuarios: Tf_CadUsuarios;

implementation

uses u_dados, u_MenuPrincipal;
{$R *.dfm}

function botoes(adi: Boolean; alt: Boolean; sal: Boolean; exc: Boolean; atu: Boolean): Boolean;
begin
  f_CadUsuarios.sbIncluir.Enabled:=adi;
  f_CadUsuarios.sbEditar.Enabled:=alt;
  f_CadUsuarios.sbSalvar.Enabled:=sal;
  f_CadUsuarios.sbDeletar.Enabled:=exc;
  f_CadUsuarios.sbAtualizar.Enabled:=atu;
end;


procedure Tf_CadUsuarios.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tf_CadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tf_CadUsuarios.FormCreate(Sender: TObject);
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

procedure Tf_CadUsuarios.acIncluirExecute(Sender: TObject);
begin
  if sbIncluir.Enabled=false then exit;
  sbLimpar.Click;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox2.Enabled:=false;

  PageControl1.ActivePage:=TabSheet1;
  edusuario.SetFocus;
  f_CadUsuarios.Caption:='Cadastro de Usuarios - INCLUSÃO';
  botoes(false,false,true,false,true); // Restaura situação dos Botões

end;

procedure Tf_CadUsuarios.acSalvarExecute(Sender: TObject);
var
  vPos:TBookmark;
begin
  if sbSalvar.Enabled=false then exit;
  PageControl1.ActivePage:=TabSheet1; // Torna DADOS CADASTRO padrão
  // variável da Unit - Registro corrente
  if f_CadUsuarios.Caption='Cadastro de Usuarios - INCLUSÃO' then begin // Rotina de Inserção
    // Insere dados no Banco
    try
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('insert into TBUSUARIOS (NOMEUSUARIO, NLOGIN, SENHA, EMAIL, DEFINIRSENHA)');
        sql.Add('values (:c,:d,:e,:f,:g)');
        Parameters[0].Value:=edusuario.Text;
        Parameters[1].Value:=edLogin.Text;
        Parameters[2].Value:='1234';
        Parameters[3].Value:=edEmail.Text;
        if CheckBox1.Checked then Parameters[4].Value:='S'
        else Parameters[4].Value:='N';
        execsql;
      end; // Fim Inserção

      showmessage('MENSAGEM: Registro Inserido.');
      f_CadUsuarios.Caption:='Cadastro de Usuarios';
      GroupBox2.Enabled:=true;
      GroupBox5.Enabled:=false;
      GroupBox6.Enabled:=false;

      dm_Dados.q_Usuarios.close;
      dm_Dados.q_Usuarios.open;
      q_Dados.close;
      q_Dados.open;

      botoes(true,true,false,True,true); // Restaura situação dos Botões
    except
      showmessage('ERRO: Formulário Preenchido incorretamente.');
    end;
  end
  else begin // Rotina de Alteração
    vRegistro:=strtoint(copy(Systembar1.SimpleText,pos(':',Systembar1.SimpleText)+2,6));
    // Insere dados no Banco
    vPos:=dm_Dados.q_Usuarios.GetBookmark;
    try
      with dm_Dados.q_manipula do begin
        close;
        sql.Clear;
        sql.add('update TBUSUARIOS set NOMEUSUARIO=:c, NLOGIN=:d, SENHA=:e, EMAIL=:f');
        sql.Add('where idusuario=:z');
        Parameters[0].Value:=edusuario.Text;
        Parameters[1].Value:=edLogin.Text;
        Parameters[2].Value:='';
        Parameters[3].Value:=edEmail.Text;
        Parameters[4].Value:=dm_Dados.q_UsuariosIDUSUARIO.Value;
        execsql;
      end; // Fim Update

      showmessage('MENSAGEM: Registro Alterado.');
      f_CadUsuarios.Caption:='Cadastro de Usuarios';
      dm_Dados.q_Usuarios.Close;    // Atualiza GRID
      dm_Dados.q_Usuarios.open;
      dm_Dados.q_Usuarios.GotoBookmark(vPos);
      dm_Dados.q_Usuarios.FreeBookmark(vPos);

      botoes(true,true,false,True,false); // Restaura situação dos Botões
      GroupBox2.Enabled:=true;
      DBGrid1.SetFocus;
      GroupBox5.Enabled:=false;
      GroupBox6.Enabled:=false;
    except
      showmessage('ERRO: Formulário Preenchido incorretamente.');
    end;
  end;  //  Fim Alteração
  DBGrid1.SetFocus;
end;

procedure Tf_CadUsuarios.cbPesquisaDblClick(Sender: TObject);
begin
  cbPesquisa.Text:='';
  edPesquisar.Text:='';
end;

procedure Tf_CadUsuarios.DBGrid1DrawColumnCell(Sender: TObject;
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

{
  if (q_listagridSITUACAO.value='QUIT') then begin
    grLista.Canvas.Brush.Color:= $00AEDBD9;
    grLista.Canvas.Font.Color:= clOlive;
    grLista.Canvas.FillRect(Rect);
  end;
  if (q_listagridSITUACAO.value='CANC') then begin
    grLista.Canvas.Brush.Color:= $00AEDBD9;
    grLista.Canvas.Font.Color:= clred;
    grLista.Canvas.FillRect(Rect);
  end;
  grLista.DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
end;

procedure Tf_CadUsuarios.acEditarExecute(Sender: TObject);
begin
  if sbEditar.Enabled=false then exit;
  GroupBox5.Enabled:=true;
  GroupBox6.Enabled:=true;
  GroupBox2.Enabled:=false;
  PageControl1.ActivePage:=TabSheet1;
  edusuario.SetFocus;
  f_CadUsuarios.Caption:='Cadastro de Usuários - ALTERAÇÃO';

  botoes(false,false,true,false,true); // Restaura situação dos Botões
end;

procedure Tf_CadUsuarios.acAtualizarExecute(Sender: TObject);
begin
  if sbAtualizar.Enabled=false then exit;
  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
  PageControl1.ActivePage:=TabSheet1;
  f_CadUsuarios.Caption:='Cadastro de Fornecedores';
  botoes(true,true,false,True,false); // Restaura situação dos Botões
  DBGrid1.SetFocus;
end;

procedure Tf_CadUsuarios.acDeletarExecute(Sender: TObject);
var opc:integer;
begin
  if sbDeletar.Enabled=false then exit;
  f_CadUsuarios.Caption:='Cadastro de Usuarios - DELETAR REGISTRO '+copy(Systembar1.SimpleText,pos(':',Systembar1.SimpleText)+1,6);
  opc:=application.messagebox('Confirma exclusão do registro ','Confirmação',mb_yesno);
  if opc=idyes then begin

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBUSUARIOS');
      sql.Add('where IDUSUARIO=:c');
      Parameters[0].Value:=q_DadosIDUSUARIO.value;
      execsql;
    end; // Fim Deletar

    showmessage('MENSAGEM: Registro Deletado.');
    f_CadUsuarios.Caption:='Cadastro de Usuarios';
    q_Dados.Close;    // Atualiza GRID
    q_Dados.open;
    botoes(true,true,false,false,false); // Restaura situação dos Botões
  end
  else BEGIN
    showmessage('MENSAGEM: Operação cancelada.');
    f_CadUsuarios.Caption:='Cadastro de Usuarios';
  END;
end;

procedure Tf_CadUsuarios.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin  f_CadUsuarios.Caption:='Cadastro de Fornecedores - CONSULTA';

  GroupBox2.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;

  case Length(inttostr(dm_Dados.q_UsuariosIDUSUARIO.value)) of // Formata exibição do Registro no SystemBar
    1:Systembar1.SimpleText:=' REGISTRO : 00000'+inttostr(dm_Dados.q_UsuariosIDUSUARIO.value);
    2:Systembar1.SimpleText:=' REGISTRO : 0000'+inttostr(dm_Dados.q_UsuariosIDUSUARIO.value);
    3:Systembar1.SimpleText:=' REGISTRO : 000'+inttostr(dm_Dados.q_UsuariosIDUSUARIO.value);
    4:Systembar1.SimpleText:=' REGISTRO : 00'+inttostr(dm_Dados.q_UsuariosIDUSUARIO.value);
    5:Systembar1.SimpleText:=' REGISTRO : 0'+inttostr(dm_Dados.q_UsuariosIDUSUARIO.value);
  end;

  botoes(false,true,false,true,true); // Restaura situação dos Botões
end;

procedure Tf_CadUsuarios.sbPesquisarClick(Sender: TObject);
begin
  sbAtualizar.Click;
  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT IDCODIGO, IDTIPOFORN, IDCATEGORIA, DATACADASTRO, NOMECOMPLETO, PARTENOME, ');
  q_dados.SQL.add('ENDERECO, NUMERO, IDBAIRRO, COMPLEMENTO, IDCIDADE, IDESTADO, EMAIL, FONEFIXO, FONECEL, ');
  q_dados.SQL.add('OBS, CEP');
  q_dados.SQL.add('FROM TBCADFORNECEDORES');
{
  case cbPesquisa.ItemIndex of
    0:begin; q_dados.SQL.Add('WHERE upper(NOMECOMPLETO) like :c'); q_Dados.Params[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
  end;
  q_dados.SQL.add('ORDER BY TBCADFORNECEDORES.NOMECOMPLETO');
  q_Dados.open;
}
  if q_Dados.RecordCount=0 then spImprimir.Enabled:=false
  else spImprimir.Enabled:=true;
  GroupBox5.Enabled:=false;
  GroupBox6.Enabled:=false;
end;

procedure Tf_CadUsuarios.spImprimirClick(Sender: TObject);
begin
  if spImprimir.Enabled=false then exit;
end;

procedure Tf_CadUsuarios.sbLimparClick(Sender: TObject);
begin
  edusuario.Text:='';
  edLogin.Text:='';
  edEmail.Text:='0';
//  CheckBox1.Checked:=false;
  edSenha1.Text:='';
  edSenha2.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure Tf_CadUsuarios.DBGrid1TitleClick(Column: TColumn);
begin
  q_Dados.close;
  q_dados.sql.clear;
  q_dados.SQL.add('SELECT IDCODIGO, DESCRICAO, NFANTASIA, ENDERECO, IDBAIRRO, COMPLEMENTO, ');
  q_dados.SQL.add('IDCIDADE, TELEFONE1, TELEFONE2, RAMAL, CELULAR, SITE, EMAIL, NCNPJ, ');
  q_dados.SQL.add('IDTIPOCLIENTE, NCPF, NINSCESTA, IDRAMOATIVIDADE, CEP, RESPONSAVEL1, ');
  q_dados.SQL.add('RESPONSAVEL1ANIV, RESPONSAVEL1FONE, RESPONSAVEL1CEL, RESPONSAVEL1EMAIL, ');
  q_dados.SQL.add('RESPONSAVEL2, RESPONSAVEL2ANIV, RESPONSAVEL2FONE, RESPONSAVEL2CEL, ');
  q_dados.SQL.add('RESPONSAVEL2EMAIL, RG, EMISSOR, IDINDICACAO, IDTIPOCOMERCIAL, IDTELEMARK, ');
  q_dados.SQL.add('SEG, TER, QUA, QUI, SEX, SAB, DATADIA, DATAHORA, NUMEROEND, IDPERIODICIDADE, ');
  q_dados.SQL.add('PONTOREF, LIMITECREDITO, DATACADASTRO, OBS, IDTABELA, DESCBAIRRO, COMPLETO, ');
  q_dados.SQL.add('DESCTCLIENTE, DESCRAMO, LOGIN, PRIMEIRA, SEGUNDA, TERCEIRA, QUARTA, QUINTA');
  q_dados.SQL.add('FROM VWCADCLIENTES Vwcadclientes');
  q_dados.sql.add('order by '+ column.fieldname);
  q_dados.open;
end;

procedure Tf_CadUsuarios.cbPesquisaCloseUp(Sender: TObject);
begin
  edPesquisar.SetFocus;
end;

procedure Tf_CadUsuarios.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text<>Edit2.Text then begin
    showmessage('ERRO: Informações divergem.');
    edit1.Text:='';
    edit2.Text:='';
    Edit1.SetFocus;
    exit;
  end;

  with dm_Dados.q_manipula do begin
    close;
    sql.Clear;
    sql.add('update TBCONFIGURACOES set CODIGOLIBERACAO=:c');
    Parameters[0].Value:=Edit1.Text;
    execsql;
  end; // Fim Update
  showmessage('INFORMAÇÃO: Alteração Confirmada.');
  sbFechar.Click;

end;

procedure Tf_CadUsuarios.q_DadosAfterScroll(DataSet: TDataSet);
begin
  edusuario.Text:=q_DadosNOMEUSUARIO.value;
  edLogin.Text:=q_DadosNLOGIN.value;
  edEmail.Text:=q_DadosEMAIL.Value;
  edSenha1.Text:=q_DadosSENHA.Value;
  edSenha2.Text:=q_DadosSENHA.Value;
  
  if q_DadosIDTIPO.Value=0 then BitBtn1.Enabled:=false
  else BitBtn1.Enabled:=true;

  if (q_DadosNLOGIN.value=f_MenuPrincipal.Label2.Caption) and (q_DadosSENHA.value=f_MenuPrincipal.Label5.Caption) then
  CheckBox1.Enabled:=true
  else CheckBox1.Enabled:=false;
end;

procedure Tf_CadUsuarios.BitBtn2Click(Sender: TObject);
var
  vRegistro:TBookmark;
begin
  if BitBtn2.Enabled=false then exit;

  if edSenha1.Text<>edSenha2.Text then begin
    showmessage('ERRO: Senhas informadas divergem.');
    edSenha1.SetFocus;
    edSenha1.SelectAll;
    edSenha2.SelectAll;
  end else begin
    vRegistro:=q_Dados.GetBookmark;
    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update TBUSUARIOS set SENHA=:c');
      sql.Add('where idusuario=:z');
      Parameters[0].Value:=edSenha1.Text;
      Parameters[1].Value:=q_DadosIDUSUARIO.Value;
      execsql;
    end; // Fim Update
    q_dados.close;
    q_dados.Open;
    q_dados.GotoBookmark(vRegistro);
    q_dados.FreeBookmark(vRegistro);
    showmessage('MENSAGEM: Senha Alterada.');
    sbAtualizar.Click;
  end;
end;

procedure Tf_CadUsuarios.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    GroupBox7.Enabled:=true;
    edsenha1.SetFocus;
  end else GroupBox7.Enabled:=false;
end;

end.

