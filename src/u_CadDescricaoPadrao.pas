unit u_CadDescricaoPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ADODB, DBCtrls;

type
  Tf_CadDescricaoPadrao = class(TForm)
    edNovo: TEdit;
    dbgDados: TDBGrid;
    btInsere: TBitBtn;
    BitBtn1: TBitBtn;
    btCancela: TBitBtn;
    d_gridDados: TDataSource;
    Label2: TLabel;
    q_GridDados: TADOQuery;
    q_GridDadosIDCODIGO: TIntegerField;
    q_GridDadosIDDOTACAO: TIntegerField;
    q_GridDadosNOMEDESCRICAO: TStringField;
    q_GridDadosIDCENTROCUSTO: TIntegerField;
    q_GridDadosIDCONTACONTABIL: TIntegerField;
    q_GridDadosUSALTERACAO: TIntegerField;
    q_GridDadosUSINCLUSAO: TIntegerField;
    q_GridDadosDTALTERACAO: TDateField;
    q_GridDadosDTINCLUSAO: TDateField;
    procedure btInsereClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edNovoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CadDescricaoPadrao: Tf_CadDescricaoPadrao;

implementation

uses u_Dados;

{$R *.dfm}

procedure Tf_CadDescricaoPadrao.btInsereClick(Sender: TObject);
begin
  with dm_dados.q_manipula do begin
    close;
    sql.Clear;
    sql.add('insert into TBDESCRICOESPADRAO (NOMEDESCRICAO, IDDOTACAO, USINCLUSAO, USALTERACAO)');
    sql.add('values (:c,:d,:e,:f)');
    Parameters[0].value:=edNovo.Text;
    Parameters[1].value:=1;  // INDEFINIDA
    Parameters[2].value:=1;
    Parameters[3].value:=1;
    execsql;
  end;
  dm_Dados.q_DescPadrao.close;
  dm_Dados.q_DescPadrao.open;
  q_GridDados.close;
  close;
end;

procedure Tf_CadDescricaoPadrao.btCancelaClick(Sender: TObject);
begin
  edNovo.Text:='';
  q_GridDados.close;
  CLOSE;
end;

procedure Tf_CadDescricaoPadrao.BitBtn1Click(Sender: TObject);
begin
  try
    with dm_dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBDESCRICOESPADRAO');
      sql.add('where IDCODIGO=:c');
      Parameters[0].value:=q_GridDadosIDCODIGO.value;
      execsql;
    end;
    dm_Dados.q_DescPadrao.close;
    dm_Dados.q_DescPadrao.open;
    q_GridDados.close;
  except
    showmessage('ERRO: Existem dados relacionados a este registro. Impossível DELETAR.');
  end;
  close;
end;

procedure Tf_CadDescricaoPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_CadDescricaoPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then selectnext(activecontrol,true,true);
  if key=#27 then close;
end;

procedure Tf_CadDescricaoPadrao.FormActivate(Sender: TObject);
begin
  edNovo.setfocus;
end;

procedure Tf_CadDescricaoPadrao.edNovoChange(Sender: TObject);
begin
  with q_GridDados do begin
    close;
    Parameters[0].value:='%'+uppercase(edNovo.text)+'%';
    open;
  end;
end;

end.
