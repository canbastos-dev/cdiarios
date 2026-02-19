object f_relRecebimentosDataAgrupamento: Tf_relRecebimentosDataAgrupamento
  Left = 206
  Top = 146
  Width = 706
  Height = 480
  Caption = 'f_relRecebimentosData'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = q_Descricoes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRBand
      Left = 19
      Top = 38
      Width = 756
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        113.770833333333300000
        2000.250000000000000000)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 8
        Top = 4
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Clube dos Di'#225'rios'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 22
        Width = 213
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          58.208333333333330000
          563.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resumo do Recebimento no Per'#237'odo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlFiltro: TQRLabel
        Left = 304
        Top = 21
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          55.562500000000000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filtro:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 81
      Width = 756
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2000.250000000000000000)
      BandType = rbGroupHeader
      object QRDBText3: TQRDBText
        Left = 45
        Top = 2
        Width = 323
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          5.291666666666667000
          854.604166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'DESCRICAOPADRAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object DBEdit1: TDBEdit
        Left = 152
        Top = 24
        Width = 251
        Height = 24
        DataField = 'VALOR'
        DataSource = DataSource1
        TabOrder = 1
      end
      object QRDBText7: TQRDBText
        Left = 432
        Top = 1
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          2.645833333333333000
          277.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText8: TQRDBText
        Left = 5
        Top = 1
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'IDDESCPADRAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 165
      Width = 756
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand3AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2000.250000000000000000)
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 16
        Top = 8
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          21.166666666666670000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
      object QRSysData3: TQRSysData
        Left = 640
        Top = 8
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          21.166666666666670000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 19
      Top = 125
      Width = 756
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand4AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand4BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2000.250000000000000000)
      BandType = rbSummary
      object QRLabel3: TQRLabel
        Left = 439
        Top = 8
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1161.520833333333000000
          21.166666666666670000
          259.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 96
        Top = 8
        Width = 329
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          21.166666666666670000
          870.479166666666800000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 19
      Top = 103
      Width = 756
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = 14869218
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2000.250000000000000000)
      Master = QuickRep1
      DataSet = q_Dados
      HeaderBand = QRBand2
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 3
        Top = 2
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'TITULO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText10: TQRDBText
        Left = 45
        Top = 2
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          5.291666666666667000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'DTPAGAMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 105
        Top = 2
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          277.812500000000000000
          5.291666666666667000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'REFERENCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 191
        Top = 2
        Width = 282
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          5.291666666666667000
          746.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'ASSOCIADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 477
        Top = 2
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1262.062500000000000000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'VALORPAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText6: TQRDBText
        Left = 541
        Top = 2
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1431.395833333333000000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'NUMRECIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText9: TQRDBText
        Left = 585
        Top = 2
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          5.291666666666667000
          423.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Dados
        DataField = 'FORMAPAGTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object qrlNome: TQRLabel
        Left = 191
        Top = 3
        Width = 273
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          7.937500000000000000
          722.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlNome'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object q_Dados: TADOQuery
    Connection = dm_Dados.Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'd2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'd3'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'S'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 1
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  SEQUENCIA,'
      '  TITULO,'
      '  IDASSOCIADO,'
      '  ASSOCIADO,'
      '  ANOMES,'
      '  REFERENCIA,'
      '  DTVENCIMENTO,'
      '  DTPAGAMENTO,'
      '  DOCUMENTO,'
      '  VALORDOCUMENTO,'
      '  IDFORMAPAG,'
      '  FORMAPAGTO,'
      '  ACRESCIMO,'
      '  DESCONTO,'
      '  VALORPAGO,'
      '  VALORRESTANTE,'
      '  DTALTERACAO,'
      '  USALTERACAO,'
      '  USINCLUSAO,'
      '  IDDESCPADRAO,'
      '  DESCRICAOPADRAO,'
      '  NUMRECIVO,'
      '  ATIVO'
      'FROM'
      '  W_RECEBIMENTOS'
      'WHERE '
      
        '  DTPAGAMENTO BETWEEN :d1 AND :d2 AND IDFORMAPAG<900 AND IDDESCP' +
        'ADRAO=:d3 AND ATIVO=:'#39'S'#39
      'order by'
      '  DTPAGAMENTO')
    Left = 137
    Top = 200
    object q_DadosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object q_DadosTITULO: TIntegerField
      FieldName = 'TITULO'
    end
    object q_DadosIDASSOCIADO: TIntegerField
      FieldName = 'IDASSOCIADO'
    end
    object q_DadosASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Size = 80
    end
    object q_DadosANOMES: TIntegerField
      FieldName = 'ANOMES'
    end
    object q_DadosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object q_DadosDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object q_DadosDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object q_DadosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object q_DadosVALORDOCUMENTO: TBCDField
      FieldName = 'VALORDOCUMENTO'
      Precision = 18
      Size = 2
    end
    object q_DadosIDFORMAPAG: TIntegerField
      FieldName = 'IDFORMAPAG'
    end
    object q_DadosFORMAPAGTO: TStringField
      FieldName = 'FORMAPAGTO'
      Size = 80
    end
    object q_DadosACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object q_DadosDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object q_DadosVALORPAGO: TBCDField
      FieldName = 'VALORPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object q_DadosVALORRESTANTE: TBCDField
      FieldName = 'VALORRESTANTE'
      Precision = 18
      Size = 2
    end
    object q_DadosDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object q_DadosUSALTERACAO: TIntegerField
      FieldName = 'USALTERACAO'
    end
    object q_DadosUSINCLUSAO: TIntegerField
      FieldName = 'USINCLUSAO'
    end
    object q_DadosIDDESCPADRAO: TIntegerField
      FieldName = 'IDDESCPADRAO'
    end
    object q_DadosDESCRICAOPADRAO: TStringField
      FieldName = 'DESCRICAOPADRAO'
      Size = 80
    end
    object q_DadosNUMRECIVO: TIntegerField
      FieldName = 'NUMRECIVO'
    end
    object q_DadosATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object q_Descricoes: TADOQuery
    Connection = dm_Dados.Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'd2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'S'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 1
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  IDDESCPADRAO,'
      '  DESCRICAOPADRAO,'
      '  SUM(VALORPAGO) AS VALOR'
      'FROM'
      '  W_RECEBIMENTOS'
      'WHERE '
      
        '  DTPAGAMENTO BETWEEN :d1 AND :d2 AND IDFORMAPAG<900 AND ATIVO=:' +
        #39'S'#39
      'group by'
      '  DESCRICAOPADRAO, IDDESCPADRAO')
    Left = 57
    Top = 200
    object q_DescricoesIDDESCPADRAO: TIntegerField
      FieldName = 'IDDESCPADRAO'
    end
    object q_DescricoesDESCRICAOPADRAO: TStringField
      FieldName = 'DESCRICAOPADRAO'
      Size = 80
    end
    object q_DescricoesVALOR: TBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = q_Descricoes
    Left = 232
    Top = 200
  end
  object q_NomeUsuarios: TADOQuery
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
      'select * from tbcadusuarioserv'
      'where idcodigo=:c')
    Left = 136
    Top = 272
    object q_NomeUsuariosIDCODIGO: TIntegerField
      FieldName = 'IDCODIGO'
    end
    object q_NomeUsuariosIDTIPOSERVICO: TIntegerField
      FieldName = 'IDTIPOSERVICO'
    end
    object q_NomeUsuariosIDTIPOUSUARIO: TIntegerField
      FieldName = 'IDTIPOUSUARIO'
    end
    object q_NomeUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object q_NomeUsuariosDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object q_NomeUsuariosSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object q_NomeUsuariosTELEFONEFIXO: TStringField
      FieldName = 'TELEFONEFIXO'
      FixedChar = True
      Size = 13
    end
    object q_NomeUsuariosTELEFONECEL: TStringField
      FieldName = 'TELEFONECEL'
      FixedChar = True
      Size = 14
    end
    object q_NomeUsuariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object q_NomeUsuariosTELEFONECEL2: TStringField
      FieldName = 'TELEFONECEL2'
      FixedChar = True
      Size = 14
    end
    object q_NomeUsuariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object q_NomeUsuariosIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
    end
    object q_NomeUsuariosIDMUNICIPIO: TIntegerField
      FieldName = 'IDMUNICIPIO'
    end
    object q_NomeUsuariosCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object q_NomeUsuariosIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object q_NomeUsuariosDIAVENCTO: TIntegerField
      FieldName = 'DIAVENCTO'
    end
    object q_NomeUsuariosRG: TStringField
      FieldName = 'RG'
      Size = 40
    end
    object q_NomeUsuariosCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 14
    end
    object q_NomeUsuariosIDSITUACAO: TIntegerField
      FieldName = 'IDSITUACAO'
    end
    object q_NomeUsuariosIDTITULO: TIntegerField
      FieldName = 'IDTITULO'
    end
  end
end
