unit u_FiltraPeriodo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_FiltraPeriodo2 = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    btOk: TBitBtn;
    btFechar: TBitBtn;
    cbQuebra: TCheckBox;
    rdgAnalSint: TRadioGroup;
    rdgSituacao: TRadioGroup;
    rdgAtivos: TRadioGroup;
    procedure btFecharClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_FiltraPeriodo2: Tf_FiltraPeriodo2;

implementation

uses u_menuprincipal;
{$R *.dfm}

procedure Tf_FiltraPeriodo2.btFecharClick(Sender: TObject);
begin
  close;
  f_MenuPrincipal.Tag:=10;
end;

procedure Tf_FiltraPeriodo2.btOkClick(Sender: TObject);
begin
  f_MenuPrincipal.lbData1.Caption:=MaskEdit1.Text;
  f_MenuPrincipal.lbData2.Caption:=MaskEdit2.Text;
  f_MenuPrincipal.Tag:=0;
  close;
end;

end.
