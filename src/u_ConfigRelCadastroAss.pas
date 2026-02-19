unit u_ConfigRelCadastroAss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  Tf_ConfigRelCadastroAss = class(TForm)
    Label1: TLabel;
    rdgOrdenacao: TRadioGroup;
    btImprimir: TBitBtn;
    rdgTipo: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure btImprimirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ConfigRelCadastroAss: Tf_ConfigRelCadastroAss;

implementation

{$R *.dfm}
uses u_Dados, u_relListaFormCadAssociado, u_CadAssociados,
  u_relListaFormCadAssociadoRes;

procedure Tf_ConfigRelCadastroAss.btImprimirClick(Sender: TObject);
begin
  if (rdgTipo.ItemIndex=1) and (rdgOrdenacao.ItemIndex=0) then begin
    Application.CreateForm(Tf_relListaFormCadAssociado, f_relListaFormCadAssociado);
    f_relListaFormCadAssociado.qrlFiltro.Caption:='Filtro: '+label3.Caption+'   Conteúdo: '+label2.Caption;
    f_relListaFormCadAssociado.qrlabel3.Caption:='Registros: '+inttostr(f_CadAssociados.q_Dados.RecordCount);
    f_relListaFormCadAssociado.QuickRep1.Preview;
  end;

  if (rdgTipo.ItemIndex=0) and (rdgOrdenacao.ItemIndex=0) then begin
    Application.CreateForm(Tf_relListaFormCadAssociadoRes, f_relListaFormCadAssociadoRes);
    f_relListaFormCadAssociadoRes.qrlFiltro.Caption:='Filtro: '+label3.Caption+'   Conteúdo: '+label2.Caption;
    f_relListaFormCadAssociadoRes.qrlabel3.Caption:='Registros: '+inttostr(f_CadAssociados.q_Dados.RecordCount);
    f_relListaFormCadAssociadoRes.QuickRep1.Preview;
  end;


  if (rdgTipo.ItemIndex=0) and (rdgOrdenacao.ItemIndex=1) then begin
    f_CadAssociados.q_Dados.close;
    f_CadAssociados.q_dados.sql.clear;
    f_CadAssociados.q_dados.SQL.add('SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,');
    f_CadAssociados.q_dados.SQL.add('DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICIPIO,');
    f_CadAssociados.q_dados.SQL.add('MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, UFEMP,');
    f_CadAssociados.q_dados.SQL.add('CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, DIAVENCIMENTO,');
    f_CadAssociados.q_dados.SQL.add('DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECOCOB, BAIRROCOB,');
    f_CadAssociados.q_dados.SQL.add('MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDADECARTEIRA,');
    f_CadAssociados.q_dados.SQL.add('VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERACAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB, ULTIMOPAGTO, IDFORMAPAGTO');
    f_CadAssociados.q_dados.SQL.add('FROM W_ASSOCIADOS');
    case f_CadAssociados.cbPesquisa.ItemIndex of
      0:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(ASSOCIADO) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:='%'+uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      1:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(SITUACAO) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:=uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      2:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(CATEGORIA) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:=uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      3:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(BAIRRO) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:='%'+uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      4:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(MUNICIPIO) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:='%'+uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      5:begin; f_CadAssociados.q_dados.SQL.Add('WHERE upper(EMAIL) like :c'); f_CadAssociados.q_Dados.Parameters[0].Value:='%'+uppercase(f_CadAssociados.edPesquisar.Text)+'%'; end;
      6:begin; f_CadAssociados.q_dados.SQL.Add('WHERE CODIGO=:c'); f_CadAssociados.q_Dados.Parameters[0].Value:=uppercase(f_CadAssociados.edPesquisar.Text); end;
      7:begin; f_CadAssociados.q_dados.SQL.Add('WHERE TITULOSDEB >:c'); f_CadAssociados.q_Dados.Parameters[0].Value:=0; end;
    end;

    f_CadAssociados.q_dados.SQL.add('ORDER BY codigo');
    f_CadAssociados.q_Dados.open;

    Application.CreateForm(Tf_relListaFormCadAssociadoRes, f_relListaFormCadAssociadoRes);
    f_relListaFormCadAssociadoRes.qrlFiltro.Caption:='Filtro: '+label3.Caption+'   Conteúdo: '+label2.Caption;
    f_relListaFormCadAssociadoRes.qrlabel3.Caption:='Registros: '+inttostr(f_CadAssociados.q_Dados.RecordCount);
    f_relListaFormCadAssociadoRes.QuickRep1.Preview;

  end;



end;

procedure Tf_ConfigRelCadastroAss.Button1Click(Sender: TObject);
begin
  CLOSE
end;

end.
