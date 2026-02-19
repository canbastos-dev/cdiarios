unit u_relTitulosAbertosSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB, StdCtrls, Mask, DBCtrls;

type
  Tf_relTitulosAbertosSintetico = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    qrlFiltro: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    q_Descricoes: TADOQuery;
    DataSource2: TDataSource;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    q_DescricoesNTITULOS: TIntegerField;
    q_DescricoesTTITULOS: TBCDField;
    q_DescricoesASSOCIADO: TStringField;
    q_DescricoesIDASSOCIADO: TIntegerField;
    q_DescricaoTodos: TADOQuery;
    q_DescricaoTodosNTITULOS: TIntegerField;
    q_DescricaoTodosTTITULOS: TBCDField;
    q_DescricaoTodosIDASSOCIADO: TIntegerField;
    q_DescricaoTodosASSOCIADO: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    q_DescricoesSITUACAO: TStringField;
    q_DescricoesFONE1: TStringField;
    q_DescricoesFONE2: TStringField;
    q_DescricoesCATEGORIA: TStringField;
    q_DescricaoTodosSITUACAO: TStringField;
    q_DescricaoTodosFONE1: TStringField;
    q_DescricaoTodosFONE2: TStringField;
    q_DescricaoTodosCATEGORIA: TStringField;
    q_DescricoesCODIGO: TIntegerField;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    q_DescricaoTodosCODIGO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    vLinha:integer;
    vTotal:real;
    { Public declarations }
  end;

var
  f_relTitulosAbertosSintetico: Tf_relTitulosAbertosSintetico;

implementation

uses u_CadAssociados, u_dados, u_MenuPrincipal;
{$R *.dfm}

procedure Tf_relTitulosAbertosSintetico.FormCreate(Sender: TObject);
begin
  vLinha:=0;
  vTotal:=0;
end;

procedure Tf_relTitulosAbertosSintetico.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vLinha:=0;
end;

procedure Tf_relTitulosAbertosSintetico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlabel3.Caption:=floattostrf(vTotal,ffnumber,10,2);
  if tag=10 then
    qrlabel4.Caption:='Total de Linhas: '+inttostr(q_Descricoes.RecordCount)
  else
    qrlabel4.Caption:='Total de Linhas: '+inttostr(q_DescricaoTodos.RecordCount);
end;

procedure Tf_relTitulosAbertosSintetico.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vLinha=0 then begin
    vLinha:=1;
    QRBand2.Color:=$00E2E2E2;
  end else begin
    QRBand2.Color:=clWhite;
    vLinha:=0;
  end;

end;

procedure Tf_relTitulosAbertosSintetico.QRBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if Tag=10 then
    vTotal:=vTotal+q_DescricoesTTITULOS.Value
  else
    vTotal:=vTotal+q_DescricaoTodosTTITULOS.Value;

end;

procedure Tf_relTitulosAbertosSintetico.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  vTotal:=0; 

end;

end.
