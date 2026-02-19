unit u_Dados;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm_Dados = class(TDataModule)
    Conexao: TADOConnection;
    q_manipula: TADOQuery;
    q_Bairros: TADOQuery;
    d_Bairros: TDataSource;
    q_BairrosIDBAIRRO: TIntegerField;
    q_BairrosNOMEBAIRRO: TStringField;
    q_BairrosIDCIDADE: TIntegerField;
    d_EstCivil: TDataSource;
    q_EstCivil: TADOQuery;
    q_EstCivilIDESTADOCIVIL: TIntegerField;
    q_EstCivilNOMEESTADOCIVIL: TStringField;
    q_Municipios: TADOQuery;
    d_Municipios: TDataSource;
    q_MunicipiosIDMUN: TIntegerField;
    q_MunicipiosMUNICIPIO: TStringField;
    q_MunicipiosIDUF: TIntegerField;
    q_MunicipiosUF: TStringField;
    d_AssociadosCat: TDataSource;
    d_AssociadosSit: TDataSource;
    q_AssociadosCat: TADOQuery;
    q_AssociadosSit: TADOQuery;
    q_AssociadosCatIDCATSOCIO: TIntegerField;
    q_AssociadosCatNOMECATEGORIA: TStringField;
    q_AssociadosSitIDSITSOCIO: TIntegerField;
    q_AssociadosSitNOMESITUACAO: TStringField;
    q_Usuarios: TADOQuery;
    q_UsuariosIDUSUARIO: TIntegerField;
    q_UsuariosNOMEUSUARIO: TStringField;
    q_UsuariosSENHA: TStringField;
    q_UsuariosEMAIL: TStringField;
    q_UsuariosDTINCLUSAO: TDateField;
    q_UsuariosDTALTERACAO: TDateField;
    q_UsuariosUSINCLUSAO: TIntegerField;
    q_UsuariosUSALTERACAO: TIntegerField;
    q_UsuariosDEFINIRSENHA: TStringField;
    d_Usuarios: TDataSource;
    q_UsuariosLG_INCLUSAO: TStringField;
    q_UsuariosSENHADEF: TStringField;
    q_UsuariosNLOGIN: TStringField;
    q_Parentescos: TADOQuery;
    d_parentescos: TDataSource;
    q_ParentescosIDPARENTESCO: TIntegerField;
    q_ParentescosNOMEPARENTESCO: TStringField;
    q_ParentescosDTINCLUSAO: TDateField;
    q_ParentescosDTALTERACAO: TDateField;
    q_ParentescosUSINCLUSAO: TIntegerField;
    q_ParentescosUSALTERACAO: TIntegerField;
    q_FormasPatgo: TADOQuery;
    d_FormasPagto: TDataSource;
    q_FormasPatgoIDCODIGO: TIntegerField;
    q_FormasPatgoFORMAPAGTO: TStringField;
    q_FormasPatgoNDIAS: TIntegerField;
    q_FormasPatgoDTINCLUSAO: TDateField;
    q_FormasPatgoDTALTERACAO: TDateField;
    q_FormasPatgoUSINCLUSAO: TIntegerField;
    q_FormasPatgoUSALTERACAO: TIntegerField;
    q_Titulos: TADOQuery;
    d_Titulos: TDataSource;
    q_DescPadrao: TADOQuery;
    d_DescPadrao: TDataSource;
    q_DescPadraoIDCODIGO: TIntegerField;
    q_DescPadraoIDDOTACAO: TIntegerField;
    q_DescPadraoNOMEDESCRICAO: TStringField;
    q_DescPadraoIDCENTROCUSTO: TIntegerField;
    q_DescPadraoIDCONTACONTABIL: TIntegerField;
    q_DescPadraoUSALTERACAO: TIntegerField;
    q_DescPadraoUSINCLUSAO: TIntegerField;
    q_DescPadraoDTALTERACAO: TDateField;
    q_DescPadraoDTINCLUSAO: TDateField;
    q_Configuracoes: TADOQuery;
    q_ConfiguracoesNUMRECIBO: TIntegerField;
    q_ConfiguracoesNUMTITULO: TIntegerField;
    q_ConfiguracoesNUMASSOCIADO: TIntegerField;
    q_TitulosNUMEROACAO: TIntegerField;
    q_TitulosIDASSOCIADO: TIntegerField;
    q_TitulosASSOCIADO: TStringField;
    q_TitulosVALORACAO: TBCDField;
    q_TitulosATIVA: TStringField;
    q_TitulosIDREGCADASSOCIADOS: TIntegerField;
    q_TitulosTITULOSDEB: TIntegerField;
    q_TitulosTIPOTITULO: TIntegerField;
    q_ConfiguracoesACORDOQUITACAO: TIntegerField;
    q_ConfiguracoesCODIGOLIBERACAO: TStringField;
    q_UsuariosIDTIPO: TIntegerField;
    q_Boletos: TADOQuery;
    q_BoletosIDCODIGO: TIntegerField;
    q_BoletosIDTITULO: TIntegerField;
    q_BoletosIDASSOCIADO: TIntegerField;
    q_BoletosDTEMISSAO: TDateField;
    q_BoletosNUMDOC: TStringField;
    q_BoletosDTVENCIMENTO: TDateField;
    q_BoletosVALORDOC: TBCDField;
    q_BoletosABERTO: TStringField;
    q_BoletosDTPAGAMENTO: TDateField;
    q_BoletosACRESCIMO: TBCDField;
    q_BoletosDESCONTO: TBCDField;
    q_BoletosVALORPAGO: TBCDField;
    q_BoletosUSALTERACAO: TIntegerField;
    q_BoletosUSINCLUSAO: TIntegerField;
    q_BoletosDTALTERACAO: TDateField;
    q_BoletosDTINCLUSAO: TDateField;
    q_FormaCob: TADOQuery;
    d_FormaCob: TDataSource;
    q_FormaCobIDCODIGO: TIntegerField;
    q_FormaCobDESCCOBRANCA: TStringField;
    q_FormaCobIDUSUARIO: TIntegerField;
    q_FormaCobDTALTERACAO: TDateField;
    q_ConfiguracoesVALORREATIVACAO: TBCDField;
    q_BoletosTIPOBAIXA: TStringField;
    q_ServicosClube: TADOQuery;
    q_ServicosClubeIDCODIGO: TSmallintField;
    q_ServicosClubeDESCRICAOSER: TStringField;
    d_ServicosClube: TDataSource;
    q_UsuariosTipo: TADOQuery;
    d_UsuariosTipo: TDataSource;
    q_UsuariosTipoIDCODIGO: TIntegerField;
    q_UsuariosTipoDESCRICAOTIPO: TStringField;
    q_ConfiguracoesCAIXA_SEQ_FILE: TIntegerField;
    q_ConfiguracoesCAIXA_SEQ_LOTE: TIntegerField;
    q_ConfiguracoesCAIXA_SEQ_REMESSA: TIntegerField;
    q_ConfiguracoesREMESSA: TIntegerField;
    q_ConfiguracoesENVIOABERTO: TIntegerField;
    q_ConfiguracoesPERC_ACAD_CLUBE: TFloatField;
    q_ConfiguracoesPERC_ACAD_PARCEIRO: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Dados: Tdm_Dados;

implementation

{$R *.dfm}

procedure Tdm_Dados.DataModuleCreate(Sender: TObject);
begin
  Conexao.Connected:=true;
  q_Bairros.Active:=true;
  q_Municipios.Active:=true;
  q_AssociadosCat.Active:=true;
  q_AssociadosSit.Active:=true;
  q_EstCivil.Active:=true;
  q_Usuarios.Active:=true;
  q_Parentescos.Active:=true;
  q_FormasPatgo.Active:=true;
  q_DescPadrao.Active:=true;
  q_FormaCob.Active:=true;
  q_Configuracoes.Active:=true;
  q_ServicosClube.Active:=true;
  q_UsuariosTipo.Active:=true;
end;

end.
