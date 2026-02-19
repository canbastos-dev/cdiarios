unit u_MenuImportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, ExtCtrls, DB, ADODB, ComCtrls;

type
  Tf_MenuImportar = class(TForm)
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    acOk: TAction;
    acFechar: TAction;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    q_ProcVendas: TADOQuery;
    ProgressBar1: TProgressBar;
    q_ProcVendasIDCODIGO: TIntegerField;
    q_ProcVendasDATAMOVIMENTACAO: TDateField;
    q_ProcVendasQTDLANCAMENTOS: TIntegerField;
    q_ProcVendasVALORTOTAL: TBCDField;
    q_ProcVendasIMPORTADO: TIntegerField;
    q_BuscaCliente: TADOQuery;
    q_BuscaClienteRAZAOSOCIAL: TStringField;
    q_BuscaClienteNOMEFANTASIA: TStringField;
    q_BuscaVendedor: TADOQuery;
    q_BuscaVendedorIDCODIGO: TIntegerField;
    q_BuscaVendedorNOMEVENDEDOR: TStringField;
    q_BuscaVendedorCODIGOGERAL: TIntegerField;
    q_BuscaVendedorCODIGOFAUCOM: TIntegerField;
    OpenDialog1: TOpenDialog;
    q_ProcDespesas: TADOQuery;
    q_ProcReceitas: TADOQuery;
    q_ProcDespesasIDCODIGO: TIntegerField;
    q_ProcDespesasDATAMOVIMENTACAO: TDateField;
    q_ProcDespesasQTDLANCAMENTOS: TIntegerField;
    q_ProcDespesasVALORTOTAL: TBCDField;
    q_ProcDespesasIMPORTADO: TIntegerField;
    q_ProcReceitasIDCODIGO: TIntegerField;
    q_ProcReceitasDATAMOVIMENTACAO: TDateField;
    q_ProcReceitasQTDLANCAMENTOS: TIntegerField;
    q_ProcReceitasVALORTOTAL: TBCDField;
    q_ProcReceitasIMPORTADO: TIntegerField;
    Button1: TButton;
    rdgTipoArquivo: TRadioGroup;
    procedure acFecharExecute(Sender: TObject);
    procedure RadioGroup1Enter(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_MenuImportar: Tf_MenuImportar;

implementation

uses u_dados, uPrincipal;
{$R *.dfm}

procedure Tf_MenuImportar.acFecharExecute(Sender: TObject);
begin
  if BitBtn2.Enabled=false then exit;
  close;
end;

procedure Tf_MenuImportar.RadioGroup1Enter(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:Panel1.Caption:='C:\ CDIARIOS \ ARQUIVOS \ CLIENTES.TXT';
    1:Panel1.Caption:='C:\ CDIARIOS \ ARQUIVOS \ VENDEDORES.TXT';
    2:Panel1.Caption:='C:\ CDIARIOS \ ARQUIVOS \ VENDAS.TXT';
  end;
end;

procedure Tf_MenuImportar.acOkExecute(Sender: TObject);
var
  Arquivo, Arquivo1: TextFile;
  p:array[1..33] of integer; //número de separadores dos Campos |
  vImportados,vReg,cont,x:integer;

  vRegistros,vAssCod,vAssNom,vIdSituacao,vAssCpf,vAssNasc,vAssSex,vAssFon1,vAssFon2,vAssEnd,d:string;
  vAssIdBairro,vAssIdMunicipio,vAssCep,vEmpEnd,vEmpIdBairro,vEmpIdMunicipio,vEmpCep,vEmpFon:string;
  vAssEmp,vAssCar,vIdCategoria,vAssAdm,vAssUltPag,vIdEstCivil,vAssRg,vAssCarExp,flag:string;
  vCobEnd,vCobIdBairro,vCobIdMunicipio,vCobCep,vAssObs,vAssCarNum,vAssCarVal,vAssCarVia,vAssCarMsg:string;

begin
  if BitBtn1.Enabled=false then exit;
  if rdgTipoArquivo.ItemIndex=-1 then begin
    showmessage('ERRO: Escolha um TIPO para a importação.');
    exit;
  end;
  ProgressBar1.Visible:=true;
  ProgressBar1.Min:=0;
  vImportados:=0; vreg:=0;
  OpenDialog1.InitialDir:='';
  case RadioGroup1.ItemIndex of
    0:begin
      cont:=1;
      x:=0;
      OpenDialog1.InitialDir:='C:\CDIARIOS\titulosgerados';
      OpenDialog1.Execute;
      if OpenDialog1.FileName='' then exit;
      AssignFile(Arquivo,OpenDialog1.FileName);
      reset(Arquivo);
      AssignFile(Arquivo1,'c:\cdiarios\OcorrenciasBoletosGerados.txt');
      Rewrite(Arquivo1);
      if rdgTipoArquivo.ItemIndex=0 then begin  // IMPORTAÇÃO ARQUIVO TEXTO
        While not eof(Arquivo) do begin
          Readln(arquivo,d);
          if copy(d,1,1)<>'|' then begin
            for x:=1 to length(d) do begin
              flag:=copy(d,x,1);  // percorre a linha texto
              if flag='|' then begin   // verificando a nº da posição do separador
                                       // e armazenando no array
                p[cont]:=x;
                cont:=cont+1;   // incrementa var identificadora dos campos
              end;  // if
            end;  // for
            vAssNom:=copy(d,1,p[1]-1);                // Quebra a linha de texto
            vAssCod:=copy(d,p[1]+1,p[2]-(p[1]+1));    // desmembrando o separador
            vIdSituacao:=copy(d,p[2]+1,p[3]-(p[2]+1));
            vAssCpf:=copy(d,p[3]+1,p[4]-(p[3]+1));
            vAssCarMsg:=copy(d,p[4]+1,length(d)-p[4]);

            cont:=1;
            x:=0;
            vReg:=pos('/',vAssCod);
            vAssCod:=copy(vAssCod,1,vReg-1);

            try
              dm_Dados.q_Boletos.close;
              dm_Dados.q_Boletos.Parameters[0].Value:=trim(vIdSituacao);
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
                if dm_Dados.q_Titulos.RecordCount=0 then begin
                  Writeln(Arquivo1,'---------------------------------');
                  Writeln(Arquivo1,'Nao Localizado '+d);
                  Writeln(Arquivo1,'---------------------------------');
                end else begin
  //                vReg:=pos(',',vIdSituacao);
  //                vIdSituacao:=copy(vIdSituacao,1,vReg-1);
                  with dm_Dados.q_manipula do begin
                    close;
                    sql.clear;
                    sql.add('insert into TBBOLETOS (IDTITULO, IDASSOCIADO, NUMDOC, DTVENCIMENTO, VALORDOC, USINCLUSAO, USALTERACAO)');
                    sql.add('values (:c,:d,:e,:f,:g,:h,:i)');
                    Parameters[0].value:=vAssCod;
                    Parameters[1].value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
                    Parameters[2].value:=vIdSituacao;
                    Parameters[3].value:=strtodate(copy(vAssCarMsg,1,10));
                    Parameters[4].value:=strtofloat(vAssCpf);
                    Parameters[5].value:=1;
                    Parameters[6].value:=1;
                    execsql;
                  end;
                  Writeln(Arquivo1,'Ok '+d);
                end;
              end else begin
                Writeln(Arquivo1,'---------------------------------');
                Writeln(Arquivo1,'Nao importado - Duplicado '+d);
                Writeln(Arquivo1,'---------------------------------');
              end;
            except
              Writeln(Arquivo1,'---------------------------------');
              Writeln(Arquivo1,'Nao importado '+d);
              Writeln(Arquivo1,'---------------------------------');
              Continue;
            end;
          end;
        end;  //while
        CloseFile(Arquivo);
      end else begin
        Application.CreateForm(Tf_ImportaExcel, f_ImportaExcel);
        f_ImportaExcel.ShowModal;
      end;
      CloseFile(Arquivo1);
    end;
    1:begin
      cont:=1;
      x:=0;
      OpenDialog1.InitialDir:='C:\CDIARIOS\Recebimentos';
      OpenDialog1.Execute;
      if OpenDialog1.FileName='' then exit;
      AssignFile(Arquivo,OpenDialog1.FileName);
      reset(Arquivo);
      AssignFile(Arquivo1,'c:\cdiarios\OcorrenciasBoletosRecebimentos.txt');
      Rewrite(Arquivo1);
      if rdgTipoArquivo.ItemIndex=0 then begin  // IMPORTAÇÃO ARQUIVO TEXTO
        While not eof(Arquivo) do begin
          Readln(arquivo,d);
          if copy(d,1,1)<>'|' then begin
            for x:=1 to length(d) do begin
              flag:=copy(d,x,1);  // percorre a linha texto
              if flag='|' then begin   // verificando a nº da posição do separador
                                       // e armazenando no array
                p[cont]:=x;
                cont:=cont+1;   // incrementa var identificadora dos campos
              end;  // if
            end;  // for
            vAssNom:=copy(d,1,p[1]-1);                // Quebra a linha de texto
            vAssCod:=copy(d,p[1]+1,p[2]-(p[1]+1));    // desmembrando o separador
            vIdSituacao:=copy(d,p[2]+1,p[3]-(p[2]+1));
            vAssCpf:=copy(d,p[3]+1,p[4]-(p[3]+1));
            vAssCarMsg:=copy(d,p[4]+1,p[5]-(p[4]+1));
            vAssFon1:=copy(d,p[5]+1,p[6]-(p[5]+1));
            vAssFon2:=copy(d,p[6]+1,p[7]-(p[6]+1));
            vAssEnd:=copy(d,p[7]+1,length(d)-p[7]);

            cont:=1;
            x:=0;
            vReg:=pos('/',vAssCod);
            vAssSex:=copy(vAssCod,vReg+1,4);
            vAssCod:=copy(vAssCod,1,vReg-1);

            try
              dm_Dados.q_Boletos.close;
              dm_Dados.q_Boletos.Parameters[0].Value:=trim(vIdSituacao);
              dm_Dados.q_Boletos.open;
              if dm_Dados.q_Boletos.RecordCount>0 then begin
                with dm_Dados.q_manipula do begin
                  close;
                  sql.Clear;
                  sql.add('update TBBOLETOS SET ABERTO=:c, DTPAGAMENTO=:d, ACRESCIMO=:e, DESCONTO=:f, VALORPAGO=:g');
                  sql.Add('where IDCODIGO=:z');
                  Parameters[0].Value:='N';
                  Parameters[1].Value:=StrToDate(vAssCarMsg);
                  Parameters[2].Value:=strtofloat(vAssFon1);
                  Parameters[3].Value:=StrToFloat(vAssFon2);
                  Parameters[4].Value:=(strtofloat(vAssCpf)+strtofloat(vAssFon1))-StrToFloat(vAssFon2);
                  Parameters[5].Value:=dm_Dados.q_BoletosIDCODIGO.Value;
                  ExecSQL;
                end;
                vReg:=pos('/',vAssCarMsg);
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
                  if length(vAssCarMsg)=10 then Parameters[2].value:=strtoint(trim(copy(vAssCarMsg,7,4)+copy(vAssCarMsg,4,2)));
                  if length(vAssCarMsg)=9 then
                    if vReg=2 then Parameters[2].value:=strtoint(trim(copy(vAssCarMsg,6,4)+copy(vAssCarMsg,3,2)))
                    else if vReg=3 then Parameters[2].value:=strtoint(trim(copy(vAssCarMsg,6,4)+copy(vAssCarMsg,4,1)));
                  if length(vAssCarMsg)=8 then Parameters[2].value:=strtoint(trim(copy(vAssCarMsg,5,4)+copy(vAssCarMsg,3,1)));
                  Parameters[3].value:=vAssSex;
                  Parameters[4].value:=strtodate(vAssCarMsg);
                  Parameters[5].value:=vIdSituacao;
                  Parameters[6].value:=strtofloat(vAssCpf);
                  Parameters[7].value:=2;                                 // forma pagto BAIXA SECRETARIA
                  Parameters[8].value:=strtofloat(vAssFon1);                                 // acrescimo
                  Parameters[9].value:=strtofloat(vAssFon2);;                                 // desconto
                  Parameters[10].value:=(strtofloat(vAssCpf)+strtofloat(vAssFon1))-StrToFloat(vAssFon2);
                  Parameters[11].value:=0;
                  Parameters[12].value:=2;      // pagto de mensalidade
                  Parameters[13].value:=0;
                  Parameters[14].value:=1;
                  Parameters[15].value:=1;
                  Parameters[16].value:=date;
                  execsql;
                end;
                Writeln(Arquivo1,'Ok '+d);
              end else begin
                Writeln(Arquivo1,'---------------------------------');
                Writeln(Arquivo1,'Nao Localizado '+d);
                Writeln(Arquivo1,'---------------------------------');
              end;
            except
              Writeln(Arquivo1,'---------------------------------');
              Writeln(Arquivo1,'Nao importado '+d);
              Writeln(Arquivo1,'---------------------------------');
              Continue;
            end;
          end;
        end;  //while
        CloseFile(Arquivo);
      end else begin
        Application.CreateForm(Tf_ImportaExcel, f_ImportaExcel);
        f_ImportaExcel.ShowModal;
      end;
      CloseFile(Arquivo1);
    end;
    2:begin
      cont:=1; x:=0;vReg:=0;
      OpenDialog1.Execute;
      if OpenDialog1.FileName='' then exit;
      AssignFile(Arquivo,OpenDialog1.FileName);
      reset(Arquivo);
      AssignFile(Arquivo1,'c:\cdiarios\sqls\naoimportadosdep.txt');
      Rewrite(Arquivo1);
      ProgressBar1.Max:=4993;
      Readln(arquivo,d);
      //
      While not eof(Arquivo) do begin
        Readln(arquivo,d);
        if copy(d,1,1)<>'|' then begin
          for x:=1 to length(d) do begin
            flag:=copy(d,x,1);  // percorre a linha texto
            if flag='|' then begin   // verificando a nº da posição do separador
                                     // e armazenando no array
              p[cont]:=x;
              cont:=cont+1;   // incrementa var identificadora dos campos
            end;  // if
          end;  // for
          vAssCod:=copy(d,1,p[1]-1);                // Quebra a linha de texto
          vAssNom:=copy(d,p[1]+1,p[2]-(p[1]+1));    // desmembrando o separador
          vIdSituacao:=copy(d,p[2]+1,p[3]-(p[2]+1));
          vAssCpf:=copy(d,p[3]+1,p[4]-(p[3]+1));
          vAssNasc:=copy(d,p[4]+1,p[5]-(p[4]+1));    // desmembrando o separador
          vAssNasc:=TRIM(copy(vAssNasc,9,2)+'/'+copy(vAssNasc,6,2)+'/'+copy(vAssNasc,1,4));
          vAssSex:=copy(d,p[5]+1,p[6]-(p[5]+1));
          vAssFon1:=copy(d,p[6]+1,p[7]-(p[6]+1));
          vAssFon2:=copy(d,p[7]+1,p[8]-(p[7]+1));
          vAssEnd:=copy(d,p[8]+1,p[9]-(p[8]+1));
          vAssIdBairro:=copy(d,p[9]+1,p[10]-(p[9]+1));
          vAssIdMunicipio:=copy(d,p[10]+1,p[11]-(p[10]+1));
          vAssCep:=copy(d,p[11]+1,p[12]-(p[11]+1));
          vEmpEnd:=copy(d,p[12]+1,p[13]-(p[12]+1));
          vEmpIdBairro:=copy(d,p[13]+1,p[14]-(p[13]+1));
          vEmpIdMunicipio:=copy(d,p[14]+1,p[15]-(p[14]+1));
          vEmpCep:=copy(d,p[15]+1,p[16]-(p[15]+1));
          vEmpFon:=copy(d,p[16]+1,p[17]-(p[16]+1));
          vAssEmp:=copy(d,p[17]+1,p[18]-(p[17]+1));
          vAssCar:=copy(d,p[18]+1,p[19]-(p[18]+1));
          vIdCategoria:=copy(d,p[19]+1,p[20]-(p[19]+1));
          vAssAdm:=copy(d,p[20]+1,p[21]-(p[20]+1));
          vAssAdm:=TRIM(copy(vAssAdm,9,2)+'/'+copy(vAssAdm,6,2)+'/'+copy(vAssAdm,1,4));
          vAssUltPag:=copy(d,p[21]+1,p[22]-(p[21]+1));
          IF (vAssUltPag='') or (vAssUltPag='/') then vAssUltPag:='01/01/2000'
          else vAssUltPag:=trim('01'+'/'+vAssUltPag);
          vIdEstCivil:=copy(d,p[22]+1,p[23]-(p[22]+1));
          vAssRg:=copy(d,p[23]+1,p[24]-(p[23]+1));
          vcobEnd:=copy(d,p[24]+1,p[25]-(p[24]+1));
          vCobIdBairro:=copy(d,p[25]+1,p[26]-(p[25]+1));
          vCobIdMunicipio:=copy(d,p[26]+1,p[27]-(p[26]+1));
          vCobCep:=copy(d,p[27]+1,p[28]-(p[27]+1));
          vAssObs:=copy(d,p[28]+1,p[29]-(p[28]+1));
          vAssCarExp:=copy(d,p[29]+1,p[30]-(p[29]+1));
          vAssCarNum:=copy(d,p[30]+1,p[31]-(p[30]+1));
          vAssCarVal:=copy(d,p[31]+1,p[32]-(p[31]+1));
          if vAssCarVal='' then vAssCarVal:='01/01/2000'
          else vAssCarVal:=trim('01/'+vAssCarVal);
          vAssCarVia:=copy(d,p[32]+1,p[33]-(p[32]+1));
          vAssCarMsg:=copy(d,p[33]+1,length(d)-p[33]);

          inc(vReg);
          ProgressBar1.Position:=vReg;
          cont:=1;
          x:=0;
          try
            with dm_Dados.q_manipula do begin
              close;
              sql.Clear;
              sql.add('insert into TBASSOCIADOS (ASSCOD, ASSNOM, ASSSIT, ASSCPF, ASSNAS,');
              sql.add('ASSSEX, ASSFON1, ASSFON2, ASSEND, ASSBAI, ASSMUN, ASSUF, ASSCEP, ASSEMPEND,');
              sql.add('ASSEMPBAI, ASSEMPMUN, ASSEMPUF, ASSEMPCEP, ASSEMPFON, ASSEMP, ASSCAR, PLACOD,');
              sql.add('ASSDIAVEN, ASSADM, ASSESTCIVIL, ASSRG, ASSCOBEND, ASSCOBBAI, ASSCOBMUN,');
              sql.add('ASSCOBUF, ASSCOBCEP, ASSCARNUM, ASSCARVAL, ASSCARVIA, ASSCARMSG, ASSOBS, ASSULTPAG, ');
              sql.add('USALTERACAO, USINCLUSAO)');
              sql.Add('values (:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x,:y,:z,');
              sql.Add(':c1,:c2,:c3,:c4,:c5,:c6,:c7,:c8,:c9,:c0,:d1,:d2,:d3,:d4,:d5)');
              Parameters[0].Value:=strtoint(vAssCod);
              Parameters[1].Value:=vAssNom;
              Parameters[2].Value:=strtoint(vIdSituacao);
              Parameters[3].Value:=vAssCpf;
              Parameters[4].Value:=strtodate(vAssNasc);
              Parameters[5].Value:=vAssSex;
              Parameters[6].Value:=vAssFon1;
              Parameters[7].Value:=vAssFon2;
              Parameters[8].Value:=vAssEnd;
              Parameters[9].Value:=strtoint(vAssIdBairro);
              Parameters[10].Value:=strtoint(vAssIdMunicipio);
              Parameters[11].Value:=1;                                      // CE
              Parameters[12].Value:=vAssCep;
              Parameters[13].Value:=vEmpEnd;
              Parameters[14].Value:=strtoint(vEmpIdBairro);
              Parameters[15].Value:=strtoint(vEmpIdMunicipio);
              Parameters[16].Value:=1;                                      // CE
              Parameters[17].Value:=vEmpCep;
              Parameters[18].Value:=vEmpFon;
              Parameters[19].Value:=vAssEmp;
              Parameters[20].Value:=vAssCar;
              Parameters[21].Value:=strtoint(vIdCategoria);
              Parameters[22].Value:=0;                                      // dia do vencimento
              Parameters[23].Value:=strtodate(vAssAdm);
              Parameters[24].Value:=strtoint(vIdEstCivil);
              Parameters[25].Value:=vAssRg;
              Parameters[26].Value:=vCobEnd;
              Parameters[27].Value:=strtoint(vCobIdBairro);
              Parameters[28].Value:=strtoint(vCobIdMunicipio);
              Parameters[29].Value:=1;                                      // CE
              Parameters[30].Value:=vCobCep;
              Parameters[31].Value:=vAssCarNum;
              Parameters[32].Value:=vAssCarVal;
              Parameters[33].Value:=strtoint(vAssCarVia);
              Parameters[34].Value:=vAssCarMsg;
              Parameters[35].Value:=vAssObs;
              Parameters[36].Value:=strtodate(vAssUltPag);
              Parameters[37].Value:=1;
              Parameters[38].Value:=1;
              execsql;
            end; // Fim Inserção
          except
            Writeln(Arquivo1,d);
            Continue;
          end;
        end;
      end;  //while
      showmessage('Registros importados');
      CloseFile(Arquivo);
      CloseFile(Arquivo1);
    end;
  end;
  ProgressBar1.Visible:=false;
  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=true;
end;

procedure Tf_MenuImportar.Button1Click(Sender: TObject);
var
  vContador:integer;
begin
  ProgressBar1.Visible:=true;
  ProgressBar1.Min:=0;
  vContador:=0;

  dm_Dados.q_Boletos.close;
  dm_Dados.q_Boletos.open;

  ProgressBar1.Max:=dm_Dados.q_Boletos.RecordCount;

  while not dm_Dados.q_Boletos.eof do begin
    dm_Dados.q_Titulos.close;
    dm_Dados.q_Titulos.sql.Clear;
    dm_Dados.q_Titulos.sql.add('SELECT NUMEROACAO, IDASSOCIADO, ASSOCIADO, VALORACAO, ');
    dm_Dados.q_Titulos.sql.add('ATIVA, IDREGCADASSOCIADOS, TITULOSDEB, TIPOTITULO');
    dm_Dados.q_Titulos.sql.add('FROM W_ASSOCIADOSACOES');
    dm_Dados.q_Titulos.sql.add('where numeroacao=:c');
    dm_Dados.q_Titulos.Parameters[0].Value:=dm_Dados.q_BoletosIDTITULO.value;
    dm_Dados.q_Titulos.open;

    with dm_Dados.q_manipula do begin
      close;
      sql.Clear;
      sql.add('update TBBOLETOS SET IDASSOCIADO=:c');
      sql.Add('where IDCODIGO=:z');
      Parameters[0].Value:=dm_Dados.q_TitulosIDASSOCIADO.Value;
      Parameters[1].Value:=dm_Dados.q_BoletosIDCODIGO.value;
      ExecSQL;
    end;

    inc(vContador);
    ProgressBar1.Position:=vContador;

    dm_Dados.q_Boletos.Next;
  end;
end;

end.
