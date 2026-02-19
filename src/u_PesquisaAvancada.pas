unit u_PesquisaAvancada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, DB, ADODB;

type
  Tf_PesquisaAvancada = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    dblCategoria: TDBLookupComboBox;
    chInfPagtos: TCheckBox;
    Button1: TButton;
    q_dados: TADOQuery;
    d_ListaGrade: TDataSource;
    q_dadosSEQUENCIA: TIntegerField;
    q_dadosCODIGO: TIntegerField;
    q_dadosASSOCIADO: TStringField;
    q_dadosIDSITUACAO: TIntegerField;
    q_dadosSITUACAO: TStringField;
    q_dadosCPF: TStringField;
    q_dadosDTNASC: TDateField;
    q_dadosSEXO: TStringField;
    q_dadosFONE1: TStringField;
    q_dadosFONE2: TStringField;
    q_dadosENDERECO: TStringField;
    q_dadosIDBAIRRO: TIntegerField;
    q_dadosBAIRRO: TStringField;
    q_dadosIDMUNICIPIO: TIntegerField;
    q_dadosMUNICIPIO: TStringField;
    q_dadosIDUF: TIntegerField;
    q_dadosUF: TStringField;
    q_dadosCEP: TStringField;
    q_dadosENDERECOEMP: TStringField;
    q_dadosBAIRROEMP: TIntegerField;
    q_dadosMUNICIPIOEMP: TIntegerField;
    q_dadosUFEMP: TIntegerField;
    q_dadosCEPEMP: TStringField;
    q_dadosFONEMP: TStringField;
    q_dadosNOMEEMPRESA: TStringField;
    q_dadosCARTEIRA: TStringField;
    q_dadosIDCATEGORIA: TIntegerField;
    q_dadosCATEGORIA: TStringField;
    q_dadosDIAVENCIMENTO: TIntegerField;
    q_dadosDTADMISSAO: TDateField;
    q_dadosDTULTPAGTO: TDateField;
    q_dadosIDESTADOCIVIL: TIntegerField;
    q_dadosESTADOCIVIL: TStringField;
    q_dadosRG: TStringField;
    q_dadosENDERECOCOB: TStringField;
    q_dadosBAIRROCOB: TIntegerField;
    q_dadosMUNICIPIOCOB: TIntegerField;
    q_dadosUFCOB: TIntegerField;
    q_dadosCEPCOB: TStringField;
    q_dadosDTEXPCARTEIRA: TIntegerField;
    q_dadosNUMCARTEIRA: TStringField;
    q_dadosVALIDADECARTEIRA: TDateField;
    q_dadosVIACARTEIRA: TIntegerField;
    q_dadosMENSAGEMCARTEIRA: TStringField;
    q_dadosDTINCLUSAO: TDateField;
    q_dadosDTALTERACAO: TDateField;
    q_dadosUSALTERACAO: TIntegerField;
    q_dadosUSINCLUSAO: TIntegerField;
    q_dadosEMAIL: TStringField;
    q_dadosOBSERVACOES: TMemoField;
    q_dadosTITULOSDEB: TIntegerField;
    q_dadosULTIMOPAGTO: TStringField;
    q_dadosIDFORMAPAGTO: TIntegerField;
    q_Pagamentos: TADOQuery;
    d_Pagamentos: TDataSource;
    Button2: TButton;
    q_manipula: TADOQuery;
    q_BoletosTotal: TADOQuery;
    q_BoletosPagos: TADOQuery;
    q_BoletosTotalIDTITULO: TIntegerField;
    q_BoletosTotalTBOLETOS: TIntegerField;
    q_BoletosTotalABERTO: TStringField;
    Button3: TButton;
    q_PagamentosCOUNT: TIntegerField;
    q_PagamentosIDDESCRICAOPADRAO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure q_dadosAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PesquisaAvancada: Tf_PesquisaAvancada;

implementation

uses u_dados;
{$R *.dfm}

procedure Tf_PesquisaAvancada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree
end;

procedure Tf_PesquisaAvancada.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
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

procedure Tf_PesquisaAvancada.Button1Click(Sender: TObject);
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
  q_dados.SQL.add('WHERE IDSITUACAO=2 AND SITUACAOFIN=:d');
  q_dados.Parameters[0].VALUE:='C';
{
  case dblCategoria.KeyValue of
    0:begin; q_dados.SQL.Add('WHERE upper(ASSOCIADO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    1:begin; q_dados.SQL.Add('WHERE upper(SITUACAO) like :c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text)+'%'; end;
    2:begin; q_dados.SQL.Add('WHERE upper(CATEGORIA) like :c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text)+'%'; end;
    3:begin; q_dados.SQL.Add('WHERE upper(BAIRRO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    4:begin; q_dados.SQL.Add('WHERE upper(MUNICIPIO) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    5:begin; q_dados.SQL.Add('WHERE upper(EMAIL) like :c'); q_Dados.Parameters[0].Value:='%'+uppercase(edPesquisar.Text)+'%'; end;
    6:begin; q_dados.SQL.Add('WHERE CODIGO=:c'); q_Dados.Parameters[0].Value:=uppercase(edPesquisar.Text); end;
    7:begin; q_dados.SQL.Add('WHERE TITULOSDEB >:c'); q_Dados.Parameters[0].Value:=0; end;
  end;
}
  q_dados.SQL.add('ORDER BY ASSOCIADO');
  q_Dados.open;
end;

procedure Tf_PesquisaAvancada.q_dadosAfterScroll(DataSet: TDataSet);
begin
  q_Pagamentos.close;
  q_Pagamentos.Parameters[0].Value:=q_DadosCODIGO.value;
  q_Pagamentos.open;
end;

procedure Tf_PesquisaAvancada.Button2Click(Sender: TObject);
var
  vTitulo:integer;
  vSituacaoFin:string;
  vContador:integer;
begin
  q_dados.First;
  while not q_dados.Eof do begin
    vTitulo:=q_dadosCODIGO.value;
    if q_dadosIDCATEGORIA.Value<>5 then begin
      q_BoletosTotal.Close;
      q_BoletosTotal.Parameters[0].Value:=q_dadosCODIGO.Value;
      q_BoletosTotal.open;
      while not q_BoletosTotal.Eof do begin
        vContador:=vContador+1;
        if q_BoletosTotalABERTO.Value='S' then vSituacaoFin:='I';
        if q_BoletosTotalABERTO.Value='N' then vSituacaoFin:='A';
        q_BoletosTotal.Next;
      end;
      q_manipula.Close;
      q_manipula.sql.Clear;
      if (vContador=1) and (vSituacaoFin='I') then begin
        q_manipula.sql.add('update tbassociados set asssit=:c, situacaofin=:d where asscod=:z');
        q_manipula.Parameters[0].Value:=3;
        q_manipula.Parameters[1].Value:='E';  //excluido
        q_manipula.Parameters[2].Value:=q_dadosCODIGO.Value;
      end else
      if (vContador=1) and (vSituacaoFin='A') then begin
        q_manipula.sql.add('update tbassociados set situacaofin=:d where asscod=:z');
        q_manipula.Parameters[0].Value:='A';  //adimplente
        q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
      end else
      if (vContador>1) and (vSituacaoFin='I') then begin
        q_manipula.sql.add('update tbassociados set situacaofin=:d where asscod=:z');
        q_manipula.Parameters[0].Value:='I';  //Inadimplente
        q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
      end else begin
        q_manipula.sql.add('update tbassociados set situacaofin=:d where asscod=:z');
        q_manipula.Parameters[0].Value:='C';  //Carteira
        q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
      end;
      q_manipula.ExecSQL;
      vContador:=0;
  {
      end else if (q_dadosIDCATEGORIA.Value<>5) and (q_Pagamentos.RecordCount>0) then begin
        if q_PagamentosDTPAGAMENTO.Value>=strtodate('04/01/2010') then  begin
          q_manipula.Close;
          q_manipula.sql.Clear;
          q_manipula.sql.add('update tbassociados set asssit=:c where asscod=:z');
          q_manipula.Parameters[0].Value:=2;
          q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
          q_manipula.ExecSQL;
        end else begin
          q_manipula.Close;
          q_manipula.sql.Clear;
          q_manipula.sql.add('update tbassociados set asssit=:c where asscod=:z');
          q_manipula.Parameters[0].Value:=3;
          q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
          q_manipula.ExecSQL;
        end;

      end;
  }
    end;
    q_dados.Next;
  end;
end;

procedure Tf_PesquisaAvancada.Button3Click(Sender: TObject);
var
  vTitulo:integer;
  vSituacaoFin:string;
  vContador:integer;
begin
  q_dados.First;
  while not q_dados.Eof do begin
    vSituacaoFin:='E';
    vTitulo:=q_dadosCODIGO.value;
    q_Pagamentos.Close;
    q_Pagamentos.Parameters[0].Value:=q_dadosCODIGO.Value;
    q_Pagamentos.open;
    while not q_Pagamentos.Eof do begin
      if q_PagamentosIDDESCRICAOPADRAO.Value=2 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=3 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=4 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=5 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=23 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=28 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=35 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=64 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=65 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=66 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=68 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=69 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=71 then vSituacaoFin:='I'
      else if q_PagamentosIDDESCRICAOPADRAO.Value=9999 then vSituacaoFin:='I';
//      else vSituacaoFin:='Z';
      q_Pagamentos.Next;
    end;
    q_manipula.Close;
    q_manipula.sql.Clear;
    if vSituacaoFin='E' then begin
      q_manipula.sql.add('update tbassociados set asssit=:c, situacaofin=:d where asscod=:z');
      q_manipula.Parameters[0].Value:=3;
      q_manipula.Parameters[1].Value:='E';  //excluido
      q_manipula.Parameters[2].Value:=q_dadosCODIGO.Value;
    end else
    if vSituacaoFin='I' then begin
      q_manipula.sql.add('update tbassociados set situacaofin=:d where asscod=:z');
      q_manipula.Parameters[0].Value:='I';  //adimplente
      q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
    end else
    if vSituacaoFin='Z' then begin
      q_manipula.sql.add('update tbassociados set situacaofin=:d where asscod=:z');
      q_manipula.Parameters[0].Value:='C';  //adimplente
      q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
    end;
    q_manipula.ExecSQL;
{
    end else if (q_dadosIDCATEGORIA.Value<>5) and (q_Pagamentos.RecordCount>0) then begin
      if q_PagamentosDTPAGAMENTO.Value>=strtodate('04/01/2010') then  begin
        q_manipula.Close;
        q_manipula.sql.Clear;
        q_manipula.sql.add('update tbassociados set asssit=:c where asscod=:z');
        q_manipula.Parameters[0].Value:=2;
        q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
        q_manipula.ExecSQL;
      end else begin
        q_manipula.Close;
        q_manipula.sql.Clear;
        q_manipula.sql.add('update tbassociados set asssit=:c where asscod=:z');
        q_manipula.Parameters[0].Value:=3;
        q_manipula.Parameters[1].Value:=q_dadosCODIGO.Value;
        q_manipula.ExecSQL;
      end;

    end;
}
    q_dados.Next;
  end;
end;

end.
