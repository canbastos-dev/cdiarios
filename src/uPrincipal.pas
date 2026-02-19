unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, StdCtrls, ExcelXP,
  OleServer;

type
  Tf_ImportaExcel = class(TForm)
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    mmOcorrencias: TMemo;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ImportaExcel: Tf_ImportaExcel;
  LCID: Integer;
  WKBK: _Workbook;

implementation

uses u_menuImportar, u_Dados;
{$R *.dfm}

procedure Tf_ImportaExcel.Button1Click(Sender: TObject);

var
  Linha,cont,vReg,x:integer;
  vAsscod:String;
  vDiferenca:real;  

begin

  { Criar arquivo Excel }
  { Pega o usuário logado }
  LCID := GetUserDefaultLCID;
  { Torna a aplicação visível }
  ExcelApplication1.Visible[LCID] := True;
  { Remove alertas do excel }
  ExcelApplication1.DisplayAlerts[LCID] := False;
  { Cria o novo arquivo }
  WKBK := ExcelApplication1.Workbooks.Add(EmptyParam, LCID);
  { Conecta a planilha (1) que será a planilha a receber os dados }
  ExcelWorksheet1.ConnectTo(WKBK.Worksheets[1] as _Worksheet);
  { Ativa a planilha conectada }
  ExcelWorksheet1.Activate(LCID);
  { Torna possível fazer alterações }
  ExcelApplication1.ScreenUpdating[LCID] := True;
  { Atribui um nome a planilha }
  ExcelWorksheet1.Name := 'Relatórios via Excel';

  { Faz a inserção de dados na planilha }
  Linha := 1;
{
  with ClientDataSet1, ExcelWorksheet1 do
  begin
    First;
    Range['A1', 'A1'].Value2 := 'NOME';
    Range['B1', 'B1'].Value2 := 'CAPITAL';
    Range['C1', 'C1'].Value2 := 'CONTINENTE';
    Range['D1', 'D1'].Value2 := 'AREA';
    Range['E1', 'E1'].Value2 := 'POPULAÇÃO';

    while not EOF do
    begin
      Linha := Linha + 1;
      Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value2 :=
        FieldByName('NAME').AsString;
      Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value2 :=
        FieldByName('CAPITAL').AsString;
      Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value2 :=
        FieldByName('Continent').AsString;
      Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value2 :=
        FieldByName('Area').AsString;
      Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value2 :=
        FieldByName('Population').AsString;
      Next;
    end;
  end;
  ExcelWorksheet1.SaveAs(ExtractFilePath(Application.ExeName) +
    'country.xls');
}

      cont:=1;
      x:=0;
      ClientDataSet1.First;
      While not ClientDataSet1.Eof do begin
        cont:=1;
        x:=0;
        vReg:=pos('/',ClientDataSet1.FieldByName('TITULO').value);
        vAssCod:=copy(ClientDataSet1.FieldByName('TITULO').value,1,vReg-1);
        try
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
          if dm_Dados.q_Boletos.RecordCount>0 then begin
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('update TBASSOCIADOS set TBASSOCIADOS.IDFORMAPAGTO=:c');
              sql.add('WHERE TBASSOCIADOS.ASSCOD=:d');
              Parameters[0].value:=2;
              Parameters[1].value:=strtoint(vAssCod);
              execsql;
            end;
            mmOcorrencias.Lines.Add('Atualizado - '+ClientDataSet1.FieldByName('SOCIO').value);
          end else mmOcorrencias.Lines.Add('Não Localizado - '+vAssCod);
        except
          mmOcorrencias.Lines.Add('Não Importado - '+ClientDataSet1.FieldByName('SOCIO').value);
          ClientDataSet1.Next;
          Continue;
        end;
        ClientDataSet1.Next;
      end;  //while

end;

procedure Tf_ImportaExcel.Button2Click(Sender: TObject);
var
  I: Integer;
  pagto: string;
  socio: string;
  documento: string;
  titulo: string;
  valor: String;
begin
  mmOcorrencias.Lines.Clear;

  { Criar arquivo Excel }
  { Pega o usuário logado }
  LCID := GetUserDefaultLCID;
  { Torna a aplicação visível }
  ExcelApplication1.Visible[LCID] := false;
  { Remove alertas do excel }
  ExcelApplication1.DisplayAlerts[LCID] := False;
  { Cria o novo arquivo }
  WKBK := ExcelApplication1.Workbooks.Open(
    f_MenuImportar.OpenDialog1.FileName, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, LCID);

  { Conecta a planilha (1) que será a planilha a receber os dados }
  ExcelWorksheet1.ConnectTo(WKBK.Worksheets[1] as _Worksheet);
  { Ativa a planilha conectada }
  ExcelWorksheet1.Activate(LCID);
  { Torna possível fazer alterações }
  ExcelApplication1.ScreenUpdating[LCID] := True;

  with ClientDataSet1, ExcelWorksheet1 do
  begin
    Open;
    EmptyDataSet;
    if f_MenuImportar.RadioGroup1.ItemIndex=0 then begin
      for I := 2 to Rows.Count do
      begin
        socio := Range['A' + IntToStr(I), 'A' + IntToStr(I)].Value2;
        documento := Range['B' + IntToStr(I), 'B' + IntToStr(I)].Value2;
        titulo := Range['C' + IntToStr(I), 'C' + IntToStr(I)].Value2;
        pagto := datetostr(Range['D' + IntToStr(I), 'D' + IntToStr(I)].Value2);
        valor := Range['E' + IntToStr(I), 'E' + IntToStr(I)].Value2;
        if not ((Trim(pagto) = '30/12/1899') and (Trim(socio) = '') and
          (Trim(documento) = '') and (Trim(titulo) = '') and
          (Trim(valor) = '')) then
        begin
          ClientDataSet1.Append;
          ClientDataSet1.FieldByName('PAGTO').AsString := pagto;
          ClientDataSet1.FieldByName('SOCIO').AsString := socio;
          ClientDataSet1.FieldByName('DOCUMENTO').AsString := documento;
          ClientDataSet1.FieldByName('TITULO').AsString := titulo;
          ClientDataSet1.FieldByName('VALOR').AsString := valor;
          ClientDataSet1.Post;
        end
        else
          Break;
      end;
    end else if f_MenuImportar.RadioGroup1.ItemIndex=1 then begin
      for I := 2 to Rows.Count do
      begin
        pagto := datetostr(Range['A' + IntToStr(I), 'A' + IntToStr(I)].Value2);
        socio := Range['B' + IntToStr(I), 'B' + IntToStr(I)].Value2;
        documento := Range['C' + IntToStr(I), 'C' + IntToStr(I)].Value2;
        titulo := Range['D' + IntToStr(I), 'D' + IntToStr(I)].Value2;
        valor := Range['E' + IntToStr(I), 'E' + IntToStr(I)].Value2;

        if not ((Trim(pagto) = '30/12/1899') and (Trim(socio) = '') and
          (Trim(documento) = '') and (Trim(titulo) = '') and
          (Trim(valor) = '')) then
        begin
          ClientDataSet1.Append;
          ClientDataSet1.FieldByName('PAGTO').AsString := pagto;
          ClientDataSet1.FieldByName('SOCIO').AsString := socio;
          ClientDataSet1.FieldByName('DOCUMENTO').AsString := documento;
          ClientDataSet1.FieldByName('TITULO').AsString := titulo;
          ClientDataSet1.FieldByName('VALOR').AsString := valor;
          ClientDataSet1.Post;
        end
        else
          Break;
      end;
    end;
  end;
  ShowMessage('Leitura dos Registros foi realizada com êxito.');
end;

procedure Tf_ImportaExcel.FormCreate(Sender: TObject);
begin
  ClientDataSet1.LoadFromFile(ExtractFilePath(Application.ExeName) +
    'recebimentos.xml');
  ClientDataSet1.Open;
end;

procedure Tf_ImportaExcel.FormDestroy(Sender: TObject);
begin
  ClientDataSet1.Close;
end;

procedure Tf_ImportaExcel.Button4Click(Sender: TObject);
begin
  close;
end;

procedure Tf_ImportaExcel.Button3Click(Sender: TObject);
var
  vImportados,vReg,cont,x:integer;

  vAssCod, vFlag:string;
  vDiferenca:real;
//  vRegistros,vAssCod,vAssNom,vIdSituacao,vAssCpf,vAssNasc,vAssSex,vAssFon1,vAssFon2,vAssEnd,d:string;
//  vAssIdBairro,vAssIdMunicipio,vAssCep,vEmpEnd,vEmpIdBairro,vEmpIdMunicipio,vEmpCep,vEmpFon:string;
//  vAssEmp,vAssCar,vIdCategoria,vAssAdm,vAssUltPag,vIdEstCivil,vAssRg,vAssCarExp,flag:string;
//  vCobEnd,vCobIdBairro,vCobIdMunicipio,vCobCep,vAssObs,vAssCarNum,vAssCarVal,vAssCarVia,vAssCarMsg:string;

begin
  case f_MenuImportar.RadioGroup1.ItemIndex of
    0:begin
      cont:=1;
      x:=0;
      ClientDataSet1.First;
      While not ClientDataSet1.Eof do begin
        cont:=1;
        x:=0;
        vReg:=pos('/',ClientDataSet1.FieldByName('TITULO').value);
        vAssCod:=copy(ClientDataSet1.FieldByName('TITULO').value,1,vReg-1);
        try
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
          if dm_Dados.q_Boletos.RecordCount<1 then begin
            dm_Dados.q_Titulos.close;
            dm_Dados.q_Titulos.sql.Clear;
            dm_Dados.q_Titulos.sql.add('SELECT NUMEROACAO, IDASSOCIADO, ASSOCIADO, VALORACAO, ');
            dm_Dados.q_Titulos.sql.add('ATIVA, IDREGCADASSOCIADOS, TITULOSDEB, TIPOTITULO');
            dm_Dados.q_Titulos.sql.add('FROM W_ASSOCIADOSACOES');
            dm_Dados.q_Titulos.sql.add('where numeroacao=:c');
            dm_Dados.q_Titulos.Parameters[0].Value:=strtoint(vAssCod);
            dm_Dados.q_Titulos.open;
            if dm_Dados.q_Titulos.RecordCount=0 then mmOcorrencias.Lines.Add('Não Localizado - '+ClientDataSet1.FieldByName('SOCIO').value)
            else begin
              with dm_Dados.q_manipula do begin
                close;
                sql.clear;
                sql.add('insert into TBBOLETOS (IDTITULO, IDASSOCIADO, NUMDOC, DTVENCIMENTO, VALORDOC, USINCLUSAO, USALTERACAO)');
                sql.add('values (:c,:d,:e,:f,:g,:h,:i)');
                Parameters[0].value:=vAssCod;
                Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
                Parameters[2].value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
                Parameters[3].value:=ClientDataSet1.FieldByName('PAGTO').Value;
                Parameters[4].value:=strtofloat(ClientDataSet1.FieldByName('VALOR').value);
                Parameters[5].value:=1;
                Parameters[6].value:=1;
                execsql;
              end;
              mmOcorrencias.Lines.Add('Ok - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'    '+ClientDataSet1.FieldByName('SOCIO').value);
            end;
          end else mmOcorrencias.Lines.Add('Não Importado por Duplicação - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'   '+ClientDataSet1.FieldByName('SOCIO').value);
        except
          mmOcorrencias.Lines.Add('Não Importado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'   '+ClientDataSet1.FieldByName('SOCIO').value);
          ClientDataSet1.Next;
          Continue;
        end;
        ClientDataSet1.Next;
      end;  //while
    end;
    1:begin
      cont:=1;
      x:=0;
      ClientDataSet1.First;
      While not ClientDataSet1.Eof do begin
        cont:=1;
        x:=0;
        vReg:=pos('/',ClientDataSet1.FieldByName('TITULO').value);
        vAssCod:=copy(ClientDataSet1.FieldByName('TITULO').value,1,vReg-1);
        try
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
          if dm_Dados.q_Boletos.RecordCount>0 then begin
            vDiferenca:=strtofloat(ClientDataSet1.FieldByName('VALOR').value)-dm_Dados.q_BoletosVALORDOC.Value;
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('update TBBOLETOS SET ABERTO=:c, DTPAGAMENTO=:d, ACRESCIMO=:e, DESCONTO=:f, VALORPAGO=:g');
              sql.Add('where IDCODIGO=:z');
              Parameters[0].Value:='N';
              Parameters[1].Value:=ClientDataSet1.FieldByName('PAGTO').Value;
              Parameters[2].Value:=0;
              Parameters[3].Value:=0;
              Parameters[4].Value:=strtofloat(ClientDataSet1.FieldByName('VALOR').value);
              Parameters[5].Value:=dm_Dados.q_BoletosIDCODIGO.Value;
              ExecSQL;
            end;
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
              sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
              sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
              sql.add('usinclusao, usalteracao, dtbaixa)');
              sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t)');
              Parameters[0].value:=strtoint(vAssCod);
              Parameters[1].value:=dm_Dados.q_BoletosIDASSOCIADO.value;
              Parameters[2].value:=strtoint('20'+copy(ClientDataSet1.FieldByName('TITULO').value,vReg+1,4));
              Parameters[3].value:=copy(ClientDataSet1.FieldByName('TITULO').value,vReg+1,4);
              Parameters[4].value:=ClientDataSet1.FieldByName('PAGTO').Value;
              Parameters[5].value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
              Parameters[6].value:=dm_Dados.q_BoletosVALORDOC.Value;
              Parameters[7].value:=2;                                 // forma pagto BAIXA SECRETARIA
              if vDiferenca<0 then begin
                Parameters[8].value:=0;                                 // acrescimo
                Parameters[9].value:=vDiferenca*(-1);                                 // desconto
              end else if vDiferenca>0 then begin
                Parameters[8].value:=vDiferenca*(-1);                                 // acrescimo
                Parameters[9].value:=0;                                 // desconto
              end else begin
                Parameters[8].value:=0;                                 // acrescimo
                Parameters[9].value:=0;                                 // desconto
              end;
              Parameters[10].value:=strtofloat(ClientDataSet1.FieldByName('VALOR').value);
              Parameters[11].value:=0;
              Parameters[12].value:=2;      // pagto de mensalidade
              Parameters[13].value:=0;
              Parameters[14].value:=1;
              Parameters[15].value:=1;
              Parameters[16].value:=date;
              execsql;
            end;
          end else mmOcorrencias.Lines.Add('Não Localizado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'   '+ClientDataSet1.FieldByName('SOCIO').value);
        except
          mmOcorrencias.Lines.Add('Não Importado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'   '+ClientDataSet1.FieldByName('SOCIO').value);
          ClientDataSet1.Next;
          Continue;
        end;
        ClientDataSet1.Next;
      end;  //while
    end;
  end;
end;

procedure Tf_ImportaExcel.Button5Click(Sender: TObject);
var
  vImportados,vReg,cont,x:integer;

  vAssCod, vFlag:string;
  vDiferenca:real;
//  vRegistros,vAssCod,vAssNom,vIdSituacao,vAssCpf,vAssNasc,vAssSex,vAssFon1,vAssFon2,vAssEnd,d:string;
//  vAssIdBairro,vAssIdMunicipio,vAssCep,vEmpEnd,vEmpIdBairro,vEmpIdMunicipio,vEmpCep,vEmpFon:string;
//  vAssEmp,vAssCar,vIdCategoria,vAssAdm,vAssUltPag,vIdEstCivil,vAssRg,vAssCarExp,flag:string;
//  vCobEnd,vCobIdBairro,vCobIdMunicipio,vCobCep,vAssObs,vAssCarNum,vAssCarVal,vAssCarVia,vAssCarMsg:string;

begin
  case f_MenuImportar.RadioGroup1.ItemIndex of
    0:begin
      cont:=1;
      x:=0;
      ClientDataSet1.First;
      While not ClientDataSet1.Eof do begin
        cont:=1;
        x:=0;
        vReg:=pos('/',ClientDataSet1.FieldByName('TITULO').value);
        vAssCod:=copy(ClientDataSet1.FieldByName('TITULO').value,1,vReg-1);
        try
{
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
//          if dm_Dados.q_Boletos.RecordCount<1 then begin
            dm_Dados.q_Titulos.close;
            dm_Dados.q_Titulos.sql.Clear;
            dm_Dados.q_Titulos.sql.add('SELECT NUMEROACAO, IDASSOCIADO, ASSOCIADO, VALORACAO, ');
            dm_Dados.q_Titulos.sql.add('ATIVA, IDREGCADASSOCIADOS, TITULOSDEB, TIPOTITULO');
            dm_Dados.q_Titulos.sql.add('FROM W_ASSOCIADOSACOES');
            dm_Dados.q_Titulos.sql.add('where numeroacao=:c');
            dm_Dados.q_Titulos.Parameters[0].Value:=strtoint(vAssCod);
            dm_Dados.q_Titulos.open;
            if dm_Dados.q_Titulos.RecordCount=0 then
              mmOcorrencias.Lines.Add('** Não Localizado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+ClientDataSet1.FieldByName('SOCIO').value)
            else if dm_Dados.q_TitulosATIVA.Value='N' then mmOcorrencias.Lines.Add('ABERTO - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+' Título: '+vAssCod+' - '+ClientDataSet1.FieldByName('SOCIO').value)
              else mmOcorrencias.Lines.Add('Ok - '+' Título: '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+vAssCod+' - '+ClientDataSet1.FieldByName('SOCIO').value);
//          end else mmOcorrencias.Lines.Add('Não Importado por Duplicação - '+ClientDataSet1.FieldByName('SOCIO').value);
}
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
          if dm_Dados.q_Boletos.RecordCount=0 then
            mmOcorrencias.Lines.Add('** Boleto Não Localizado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+ClientDataSet1.FieldByName('SOCIO').value)
          else begin
            dm_Dados.q_Titulos.close;
            dm_Dados.q_Titulos.sql.Clear;
            dm_Dados.q_Titulos.sql.add('SELECT NUMEROACAO, IDASSOCIADO, ASSOCIADO, VALORACAO, ');
            dm_Dados.q_Titulos.sql.add('ATIVA, IDREGCADASSOCIADOS, TITULOSDEB, TIPOTITULO');
            dm_Dados.q_Titulos.sql.add('FROM W_ASSOCIADOSACOES');
            dm_Dados.q_Titulos.sql.add('where numeroacao=:c');
            dm_Dados.q_Titulos.Parameters[0].Value:=strtoint(vAssCod);
            dm_Dados.q_Titulos.open;
            if dm_Dados.q_Titulos.RecordCount=0 then
              mmOcorrencias.Lines.Add('** Título Não Localizado - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+ClientDataSet1.FieldByName('SOCIO').value)
            else if dm_Dados.q_TitulosATIVA.Value='N' then mmOcorrencias.Lines.Add('ABERTO - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+' Título: '+vAssCod+' - '+ClientDataSet1.FieldByName('SOCIO').value)
              else mmOcorrencias.Lines.Add('Ok - '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  '+' Título: '+vAssCod+' - '+ClientDataSet1.FieldByName('SOCIO').value);
          end;
        except
          mmOcorrencias.Lines.Add('Não Importado - '+ClientDataSet1.FieldByName('SOCIO').value);
          ClientDataSet1.Next;
          Continue;
        end;
        ClientDataSet1.Next;
      end;  //while
    end;
    1:begin
      cont:=1;
      x:=0;
      ClientDataSet1.First;
      While not ClientDataSet1.Eof do begin
        x:=0;
        vReg:=pos('/',ClientDataSet1.FieldByName('TITULO').value);
        vAssCod:=copy(ClientDataSet1.FieldByName('TITULO').value,1,vReg-1);
        try
          dm_Dados.q_Boletos.close;
          dm_Dados.q_Boletos.Parameters[0].Value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
          dm_Dados.q_Boletos.open;
          if dm_Dados.q_Boletos.RecordCount>0 then begin
{
            vDiferenca:=strtofloat(ClientDataSet1.FieldByName('VALOR').value)-dm_Dados.q_BoletosVALORDOC.Value;
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('update TBBOLETOS SET ABERTO=:c, DTPAGAMENTO=:d, ACRESCIMO=:e, DESCONTO=:f, VALORPAGO=:g');
              sql.Add('where IDCODIGO=:z');
              Parameters[0].Value:='N';
              Parameters[1].Value:=ClientDataSet1.FieldByName('PAGTO').Value;
              Parameters[2].Value:=0;
              Parameters[3].Value:=0;
              Parameters[4].Value:=strtofloat(ClientDataSet1.FieldByName('VALOR').value);
              Parameters[5].Value:=dm_Dados.q_BoletosIDCODIGO.Value;
              ExecSQL;
            end;
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('insert into tbmensalidadespagtos (idtitulo, idassociado, anomes, referencia, ');
              sql.add('dtpagamento, numdocumento, valordocumento, idformapag, ');
              sql.add('acrescimo, desconto, valorpago, valorrestante, iddescricaopadrao, nrecibo, ');
              sql.add('usinclusao, usalteracao, dtbaixa)');
              sql.add('values (:c,:d,:e,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t)');
              Parameters[0].value:=strtoint(vAssCod);
              Parameters[1].value:=dm_Dados.q_BoletosIDASSOCIADO.value;
              Parameters[2].value:=strtoint('20'+copy(ClientDataSet1.FieldByName('TITULO').value,vReg+1,4));
              Parameters[3].value:=copy(ClientDataSet1.FieldByName('TITULO').value,vReg+1,4);
              Parameters[4].value:=ClientDataSet1.FieldByName('PAGTO').Value;
              Parameters[5].value:=ClientDataSet1.FieldByName('DOCUMENTO').value;
              Parameters[6].value:=dm_Dados.q_BoletosVALORDOC.Value;
              Parameters[7].value:=2;                                 // forma pagto BAIXA SECRETARIA
              if vDiferenca<0 then begin
                Parameters[8].value:=0;                                 // acrescimo
                Parameters[9].value:=vDiferenca*(-1);                                 // desconto
              end else if vDiferenca>0 then begin
                Parameters[8].value:=vDiferenca*(-1);                                 // acrescimo
                Parameters[9].value:=0;                                 // desconto
              end else begin
                Parameters[8].value:=0;                                 // acrescimo
                Parameters[9].value:=0;                                 // desconto
              end;
              Parameters[10].value:=strtofloat(ClientDataSet1.FieldByName('VALOR').value);
              Parameters[11].value:=0;
              Parameters[12].value:=2;      // pagto de mensalidade
              Parameters[13].value:=0;
              Parameters[14].value:=1;
              Parameters[15].value:=1;
              Parameters[16].value:=date;
              execsql;
            end;
}
            if dm_Dados.q_BoletosABERTO.value='N' then mmOcorrencias.Lines.Add(inttostr(cont)+'  '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  OK Localizado - '+ClientDataSet1.FieldByName('SOCIO').value+'   Data Pagto: '+datetostr(dm_Dados.q_BoletosDTPAGAMENTO.Value))
            else mmOcorrencias.Lines.Add(inttostr(cont)+'  '+ClientDataSet1.FieldByName('DOCUMENTO').value+'  OK Localizado ABERTO - '+ClientDataSet1.FieldByName('SOCIO').value);
          end else mmOcorrencias.Lines.Add(inttostr(cont)+'  * Não Localizado - '+'  '+ClientDataSet1.FieldByName('DOCUMENTO').value+ClientDataSet1.FieldByName('SOCIO').value);
        except
          mmOcorrencias.Lines.Add(inttostr(cont)+'  ** Não Importado - '+'  '+ClientDataSet1.FieldByName('DOCUMENTO').value+ClientDataSet1.FieldByName('SOCIO').value);
          ClientDataSet1.Next;
          Continue;
        end;
        cont:=cont+1;
        ClientDataSet1.Next;
      end;  //while
    end;
  end;
end;

end.

