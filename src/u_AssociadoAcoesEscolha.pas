unit u_AssociadoAcoesEscolha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  Tf_AssociadoAcoesEscolha = class(TForm)
    DBGrid1: TDBGrid;
    btSair: TBitBtn;
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_AssociadoAcoesEscolha: Tf_AssociadoAcoesEscolha;

implementation

uses u_dados;
{$R *.dfm}

procedure Tf_AssociadoAcoesEscolha.btSairClick(Sender: TObject);
begin
  close;
end;

end.
