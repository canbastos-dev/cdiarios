unit u_CadParentescos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ADODB, DBCtrls;

type
  Tf_CadParentescos = class(TForm)
    edNovo: TEdit;
    dbgDados: TDBGrid;
    btInsere: TBitBtn;
    BitBtn1: TBitBtn;
    btCancela: TBitBtn;
    d_gridDados: TDataSource;
    Label2: TLabel;
    q_GridDados: TADOQuery;
    q_GridDadosIDPARENTESCO: TIntegerField;
    q_GridDadosNOMEPARENTESCO: TStringField;
    q_GridDadosDTINCLUSAO: TDateField;
    q_GridDadosDTALTERACAO: TDateField;
    q_GridDadosUSINCLUSAO: TIntegerField;
    q_GridDadosUSALTERACAO: TIntegerField;
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
  f_CadParentescos: Tf_CadParentescos;

implementation

uses u_Dados;

{$R *.dfm}

procedure Tf_CadParentescos.btInsereClick(Sender: TObject);
begin
  with dm_dados.q_manipula do begin
    close;
    sql.Clear;
    sql.add('insert into TBPARENTESCOS (NOMEPARENTESCO, USINCLUSAO, USALTERACAO)');
    sql.add('values (:c,:d,:e)');
    Parameters[0].value:=edNovo.Text;
    Parameters[1].value:=1;
    Parameters[2].value:=1;
    execsql;
  end;
  dm_Dados.q_Parentescos.close;
  dm_Dados.q_Parentescos.open;
  q_GridDados.close;
  close;
end;

procedure Tf_CadParentescos.btCancelaClick(Sender: TObject);
begin
  edNovo.Text:='';
  q_GridDados.close;
  CLOSE;
end;

procedure Tf_CadParentescos.BitBtn1Click(Sender: TObject);
begin
  try
    with dm_dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('delete from TBPARENTESCOS');
      sql.add('where IDPARENTESCO=:c');
      Parameters[0].value:=q_GridDadosIDPARENTESCO.value;
      execsql;
    end;
    dm_Dados.q_Parentescos.close;
    dm_Dados.q_Parentescos.open;
    q_GridDados.close;
  except
    showmessage('ERRO: Existem dados relacionados a este registro. Impossível DELETAR.');
  end;
  close;
end;

procedure Tf_CadParentescos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_CadParentescos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then selectnext(activecontrol,true,true);
  if key=#27 then close;
end;

procedure Tf_CadParentescos.FormActivate(Sender: TObject);
begin
  edNovo.setfocus;
end;

procedure Tf_CadParentescos.edNovoChange(Sender: TObject);
begin
  with q_GridDados do begin
    close;
    Parameters[0].value:='%'+uppercase(edNovo.text)+'%';
    open;
  end;
end;

end.
