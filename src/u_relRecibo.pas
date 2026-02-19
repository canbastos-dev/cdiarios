unit u_relRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ValorPor, StdCtrls;

type
  Tf_relRecibo = class(TForm)
    ValorPorExtenso1: TValorPorExtenso;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    Label1: TLabel;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlValor: TQRLabel;
    qrlRecibo: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    qrlLocalData: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    qrlRecebemos: TQRLabel;
    QRShape2: TQRShape;
    qrlQuantia: TQRLabel;
    QRShape3: TQRShape;
    qrlReferente: TQRLabel;
    QRImage2: TQRImage;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrlValor1: TQRLabel;
    qrlRecibo1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrlLocalData1: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape4: TQRShape;
    qrlRecebemos1: TQRLabel;
    QRShape5: TQRShape;
    qrlQuantia1: TQRLabel;
    QRShape6: TQRShape;
    qrlReferente1: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    qrlValor2: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape9: TQRShape;
    qrlRecebemos2: TQRLabel;
    QRShape10: TQRShape;
    qrlQuantia2: TQRLabel;
    QRShape11: TQRShape;
    qrlReferente2: TQRLabel;
    qrlLocalData2: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrlRecibo2: TQRLabel;
    QRImage3: TQRImage;
    QRLabel10: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_relRecibo: Tf_relRecibo;

implementation

uses u_dados, DB;
{$R *.dfm}

procedure Tf_relRecibo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_relRecibo.FormCreate(Sender: TObject);
begin
  if not FileExists('c:\cdiarios\imagens\logocdiarios.bmp') then begin
    showmessage('ERRO: Não existe a Logo da Empresa no diretório padrão.');
    exit;
  end;
  QRImage1.Picture.LoadFromFile('c:\cdiarios\imagens\logocdiarios.bmp');
  QRImage2.Picture.LoadFromFile('c:\cdiarios\imagens\logocdiarios.bmp');
  QRImage3.Picture.LoadFromFile('c:\cdiarios\imagens\logocdiarios.bmp');
end;

procedure Tf_relRecibo.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlQuantia.Caption:=Label1.Caption;
  qrlQuantia1.Caption:=Label1.Caption;
  qrlQuantia2.Caption:=Label1.Caption;

end;

end.
