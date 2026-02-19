object f_PesquisaAvancada: Tf_PesquisaAvancada
  Left = 219
  Top = 97
  Width = 713
  Height = 494
  Caption = 'Pesquisa Avancada'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 76
    Height = 16
    Caption = 'Categoria:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 684
    Height = 233
    Color = clInfoBk
    DataSource = d_ListaGrade
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASSOCIADO'
        Width = 318
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULOSDEB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMOPAGTO'
        Width = 89
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 288
    Width = 685
    Height = 120
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dblCategoria: TDBLookupComboBox
    Left = 96
    Top = 16
    Width = 273
    Height = 24
    KeyField = 'IDCATSOCIO'
    ListField = 'NOMECATEGORIA'
    ListSource = dm_Dados.d_AssociadosCat
    TabOrder = 2
  end
  object chInfPagtos: TCheckBox
    Left = 376
    Top = 16
    Width = 225
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Com Informa'#231#227'o de Pagtos'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 616
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Button2'
    Enabled = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Button3'
    Enabled = False
    TabOrder = 6
    OnClick = Button3Click
  end
  object q_dados: TADOQuery
    Connection = dm_Dados.Conexao
    AfterScroll = q_dadosAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT SEQUENCIA, CODIGO, ASSOCIADO, IDSITUACAO, SITUACAO, CPF,'
      
        'DTNASC, SEXO, FONE1, FONE2, ENDERECO, IDBAIRRO, BAIRRO, IDMUNICI' +
        'PIO,'
      
        'MUNICIPIO, IDUF, UF, CEP, ENDERECOEMP, BAIRROEMP, MUNICIPIOEMP, ' +
        'UFEMP,'
      
        'CEPEMP, FONEMP, NOMEEMPRESA, CARTEIRA, IDCATEGORIA, CATEGORIA, D' +
        'IAVENCIMENTO,'
      
        'DTADMISSAO, DTULTPAGTO, IDESTADOCIVIL, ESTADOCIVIL, RG, ENDERECO' +
        'COB, BAIRROCOB,'
      
        'MUNICIPIOCOB, UFCOB, CEPCOB, DTEXPCARTEIRA, NUMCARTEIRA, VALIDAD' +
        'ECARTEIRA,'
      
        'VIACARTEIRA, MENSAGEMCARTEIRA, DTINCLUSAO, DTALTERACAO, USALTERA' +
        'CAO, USINCLUSAO, EMAIL, OBSERVACOES, TITULOSDEB,  ULTIMOPAGTO, I' +
        'DFORMAPAGTO'
      'FROM W_ASSOCIADOS'
      'WHERE SITUACAOFIN='#39'C'#39' AND IDSITUACAO=2')
    Left = 384
    Top = 376
    object q_dadosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object q_dadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object q_dadosASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Size = 80
    end
    object q_dadosIDSITUACAO: TIntegerField
      FieldName = 'IDSITUACAO'
    end
    object q_dadosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 80
    end
    object q_dadosCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 14
    end
    object q_dadosDTNASC: TDateField
      FieldName = 'DTNASC'
    end
    object q_dadosSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object q_dadosFONE1: TStringField
      FieldName = 'FONE1'
      FixedChar = True
      Size = 13
    end
    object q_dadosFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 13
    end
    object q_dadosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object q_dadosIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
    end
    object q_dadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object q_dadosIDMUNICIPIO: TIntegerField
      FieldName = 'IDMUNICIPIO'
    end
    object q_dadosMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 80
    end
    object q_dadosIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object q_dadosUF: TStringField
      FieldName = 'UF'
      Size = 80
    end
    object q_dadosCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object q_dadosENDERECOEMP: TStringField
      FieldName = 'ENDERECOEMP'
      Size = 100
    end
    object q_dadosBAIRROEMP: TIntegerField
      FieldName = 'BAIRROEMP'
    end
    object q_dadosMUNICIPIOEMP: TIntegerField
      FieldName = 'MUNICIPIOEMP'
    end
    object q_dadosUFEMP: TIntegerField
      FieldName = 'UFEMP'
    end
    object q_dadosCEPEMP: TStringField
      FieldName = 'CEPEMP'
      FixedChar = True
      Size = 9
    end
    object q_dadosFONEMP: TStringField
      FieldName = 'FONEMP'
      FixedChar = True
      Size = 13
    end
    object q_dadosNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 40
    end
    object q_dadosCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 40
    end
    object q_dadosIDCATEGORIA: TIntegerField
      FieldName = 'IDCATEGORIA'
    end
    object q_dadosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 80
    end
    object q_dadosDIAVENCIMENTO: TIntegerField
      FieldName = 'DIAVENCIMENTO'
    end
    object q_dadosDTADMISSAO: TDateField
      FieldName = 'DTADMISSAO'
    end
    object q_dadosDTULTPAGTO: TDateField
      FieldName = 'DTULTPAGTO'
    end
    object q_dadosIDESTADOCIVIL: TIntegerField
      FieldName = 'IDESTADOCIVIL'
    end
    object q_dadosESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 80
    end
    object q_dadosRG: TStringField
      FieldName = 'RG'
      Size = 40
    end
    object q_dadosENDERECOCOB: TStringField
      FieldName = 'ENDERECOCOB'
      Size = 100
    end
    object q_dadosBAIRROCOB: TIntegerField
      FieldName = 'BAIRROCOB'
    end
    object q_dadosMUNICIPIOCOB: TIntegerField
      FieldName = 'MUNICIPIOCOB'
    end
    object q_dadosUFCOB: TIntegerField
      FieldName = 'UFCOB'
    end
    object q_dadosCEPCOB: TStringField
      FieldName = 'CEPCOB'
      FixedChar = True
      Size = 9
    end
    object q_dadosDTEXPCARTEIRA: TIntegerField
      FieldName = 'DTEXPCARTEIRA'
    end
    object q_dadosNUMCARTEIRA: TStringField
      FieldName = 'NUMCARTEIRA'
      Size = 40
    end
    object q_dadosVALIDADECARTEIRA: TDateField
      FieldName = 'VALIDADECARTEIRA'
    end
    object q_dadosVIACARTEIRA: TIntegerField
      FieldName = 'VIACARTEIRA'
    end
    object q_dadosMENSAGEMCARTEIRA: TStringField
      FieldName = 'MENSAGEMCARTEIRA'
      Size = 40
    end
    object q_dadosDTINCLUSAO: TDateField
      FieldName = 'DTINCLUSAO'
    end
    object q_dadosDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object q_dadosUSALTERACAO: TIntegerField
      FieldName = 'USALTERACAO'
    end
    object q_dadosUSINCLUSAO: TIntegerField
      FieldName = 'USINCLUSAO'
    end
    object q_dadosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object q_dadosOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object q_dadosTITULOSDEB: TIntegerField
      FieldName = 'TITULOSDEB'
    end
    object q_dadosULTIMOPAGTO: TStringField
      FieldName = 'ULTIMOPAGTO'
      Size = 40
    end
    object q_dadosIDFORMAPAGTO: TIntegerField
      FieldName = 'IDFORMAPAGTO'
    end
  end
  object d_ListaGrade: TDataSource
    DataSet = q_dados
    Left = 456
    Top = 376
  end
  object q_Pagamentos: TADOQuery
    Connection = dm_Dados.Conexao
    Parameters = <
      item
        Name = 't'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  COUNT(IDTITULO),'
      '  IDDESCRICAOPADRAO'
      'FROM'
      '  TBMENSALIDADESPAGTOS'
      'WHERE '
      '  IDTITULO=:t'
      'GROUP BY IDDESCRICAOPADRAO'
      '')
    Left = 470
    Top = 320
    object q_PagamentosCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object q_PagamentosIDDESCRICAOPADRAO: TIntegerField
      FieldName = 'IDDESCRICAOPADRAO'
    end
  end
  object d_Pagamentos: TDataSource
    AutoEdit = False
    DataSet = q_Pagamentos
    Left = 550
    Top = 320
  end
  object q_manipula: TADOQuery
    Connection = dm_Dados.Conexao
    Parameters = <>
    Left = 344
    Top = 216
  end
  object q_BoletosTotal: TADOQuery
    Connection = dm_Dados.Conexao
    Parameters = <
      item
        Name = 'c'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  IDTITULO,'
      '  count(NUMDOC) as TBoletos,'
      '  ABERTO'
      'from'
      '  TBBOLETOS'
      'where IDTITULO=:c'
      'group by'
      '  IDTITULO,'
      '  ABERTO')
    Left = 72
    Top = 176
    object q_BoletosTotalIDTITULO: TIntegerField
      FieldName = 'IDTITULO'
    end
    object q_BoletosTotalTBOLETOS: TIntegerField
      FieldName = 'TBOLETOS'
    end
    object q_BoletosTotalABERTO: TStringField
      FieldName = 'ABERTO'
      FixedChar = True
      Size = 1
    end
  end
  object q_BoletosPagos: TADOQuery
    Connection = dm_Dados.Conexao
    Parameters = <>
    Left = 208
    Top = 144
  end
end
