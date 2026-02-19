unit u_CadTransferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DB, ADODB;

type
  Tf_CadTransferencias = class(TForm)
    Label1: TLabel;
    edDocumento: TEdit;
    btProcurar: TBitBtn;
    mmDados: TMemo;
    btOk: TBitBtn;
    btFechar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edNAssociado: TEdit;
    mkCPF: TMaskEdit;
    edNRg: TEdit;
    btEsc: TButton;
    procedure btProcurarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btEscClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mmDadosEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CadTransferencias: Tf_CadTransferencias;

implementation

uses u_dados, u_AssociadoAcoesEscolha, u_CadAssociados;
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


procedure Tf_CadTransferencias.btProcurarClick(Sender: TObject);
begin
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

  if dm_dados.q_TitulosTIPOTITULO.Value<>4 then begin
    showmessage('ERRO: O título não é de Sócio PROPRIETÁRIO. Não é possível transferir.');
    edDocumento.SetFocus;
    edDocumento.SelectAll;
    exit;
  end;

  if dm_Dados.q_Titulos.RecordCount=0 then begin
    showmessage('ERRO: Associado Inexistente.');
    exit;
  end else begin
    mmDados.Lines.clear;
    mmDados.Lines.Add(dm_dados.q_TitulosASSOCIADO.value);
    mmDados.Lines.add('Título: '+inttostr(dm_dados.q_TitulosNUMEROACAO.value));
    mmDados.Lines.add('Ativa : '+dm_dados.q_TitulosATIVA.value);
    if dm_dados.q_TitulosTITULOSDEB.value>0 then begin
      mmDados.Lines.add('Título em Débito : '+inttostr(dm_dados.q_TitulosTITULOSDEB.value));
      edDocumento.SetFocus;
      btOk.Enabled:=false;
      edDocumento.SelectAll;
    end else begin
      if dm_Dados.q_TitulosATIVA.Value='N' then btOk.Enabled:=false
      else btOk.Enabled:=true;
      edNAssociado.SetFocus;
    end;
  end;

end;

procedure Tf_CadTransferencias.btFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tf_CadTransferencias.btOkClick(Sender: TObject);
var opc:integer;
begin
  if btOk.Enabled=false then exit;

  if mmDados.Lines.Text='' then begin
    showmessage('ERRO: Não existe CEDENTE selecionado.');
    exit;
  end;

  if (edNAssociado.Text='') or (mkcpf.Text='   .   .   -  ') then begin
    showmessage('ERRO: Campos Obrigatórios não preenchidos.');
    exit;
  end;

  opc:=application.messagebox('Os Dados do CEDENTE serão INATIVADOS. Confirma ? ','Confirmação',mb_yesno);
  if opc=idyes then begin
//
    dm_Dados.q_Configuracoes.open;

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update tbconfiguracoes set numassociado=:d');
      Parameters[0].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;
      execsql;
    end;

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update TBASSOCIADOS set ASSSIT=:a  where ASSCOD=:z');
      Parameters[0].Value:=999;
      Parameters[1].Value:=dm_Dados.q_TitulosNUMEROACAO.value;
      execsql;
    end; // Fim Inserção

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('insert into TBASSOCIADOS (ASSCOD, ASSNOM, ASSSIT, ASSCPF, ');
      sql.add('ASSRG, USALTERACAO, USINCLUSAO, SEQUENCIA, PLACOD, ASSBAI, ASSMUN, ASSUF, ');
      sql.add('ASSEMPBAI, ASSEMPMUN, ASSEMPUF, ASSCOBBAI, ASSCOBMUN, ASSCOBUF, ASSESTCIVIL)');
      sql.Add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u)');
      Parameters[0].Value:=dm_Dados.q_TitulosNUMEROACAO.Value;
      Parameters[1].Value:=edNAssociado.Text;
      Parameters[2].Value:=2;  // ATIVO
      Parameters[3].Value:=mkCPF.Text;
      Parameters[4].Value:=ednRG.Text;
      Parameters[5].Value:=1;
      Parameters[6].Value:=1;
      Parameters[7].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;
      Parameters[8].Value:=4;
      Parameters[9].Value:=1;
      Parameters[10].Value:=1;
      Parameters[11].Value:=1;
      Parameters[12].Value:=1;
      Parameters[13].Value:=1;
      Parameters[14].Value:=1;
      Parameters[15].Value:=1;
      Parameters[16].Value:=1;
      Parameters[17].Value:=1;                                         // Sócio PROPRIETÁRIO
      Parameters[18].Value:=1;                                         // Sócio PROPRIETÁRIO
      execsql;
    end; // Fim Inserção

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update TBASSOCIADOSACOES set IDASSOCIADO=:c, ATIVA=:d  where IDCODIGO=:z');
      Parameters[0].Value:=dm_Dados.q_ConfiguracoesNUMASSOCIADO.Value+1;
      Parameters[1].Value:='S';
      Parameters[2].Value:=dm_Dados.q_TitulosNUMEROACAO.value;
      execsql;
    end; // Fim Inserção
//
    showmessage('INFORMAÇÃO: Operação concluída. Altere os dados para o NOVO Associado.');
    
    Application.CreateForm(Tf_CadAssociados, f_CadAssociados);

    f_CadAssociados.cbPesquisa.ItemIndex:=6;
    f_CadAssociados.edPesquisar.Text:=inttostr(dm_Dados.q_TitulosNUMEROACAO.Value);

    dm_Dados.q_Configuracoes.close;

    f_CadAssociados.sbPesquisar.Click;
    f_CadAssociados.ShowModal;
  end;
  close;
end;

procedure Tf_CadTransferencias.btEscClick(Sender: TObject);
begin
  edDocumento.Text:='';
  edNAssociado.Text:='';
  mkCPF.Text:='';
  edNRg.Text:='';
  mmDados.Lines.Clear;
end;

procedure Tf_CadTransferencias.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then selectnext(activecontrol,true,true);
  if key=#27 then btEsc.Click;

end;

procedure Tf_CadTransferencias.mmDadosEnter(Sender: TObject);
begin
  edDocumento.SetFocus;  
end;

end.
