object f_relTitulosAbertosSintetico: Tf_relTitulosAbertosSintetico
  Left = 307
  Top = 152
  Width = 706
  Height = 480
  Caption = 'f_relTitulosAbertosSintetico'
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
    Left = 0
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
      Height = 47
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
        124.354166666666700000
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
          296.333333333333400000)
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
        Top = 25
        Width = 265
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          66.145833333333340000
          701.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lista de Associados - Quantitativo de Boletos'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlFiltro: TQRLabel
        Left = 304
        Top = 24
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
          63.500000000000000000
          89.958333333333340000)
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
      object QRDBText6: TQRDBText
        Left = 24
        Top = 48
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          127.000000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 85
      Width = 756
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = 14869218
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2000.250000000000000000)
      BandType = rbDetail
      object QRDBText3: TQRDBText
        Left = 76
        Top = 2
        Width = 238
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          201.083333333333300000
          5.291666666666667000
          629.708333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
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
      object QRDBText7: TQRDBText
        Left = 629
        Top = 1
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          2.645833333333333000
          74.083333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'NTITULOS'
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
      object QRDBText8: TQRDBText
        Left = 2
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
          5.291666666666667000
          2.645833333333333000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'IDASSOCIADO'
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
      object QRDBText11: TQRDBText
        Left = 700
        Top = 1
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1852.083333333333000000
          2.645833333333333000
          140.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'TTITULOS'
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
      object QRLabel5: TQRLabel
        Left = 660
        Top = 1
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1746.250000000000000000
          2.645833333333333000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Boleto(s)'
        Color = clWhite
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
      object QRDBText1: TQRDBText
        Left = 318
        Top = 2
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          841.375000000000000000
          5.291666666666667000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'SITUACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 372
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
          984.249999999999900000
          5.291666666666667000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'FONE1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 456
        Top = 2
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          5.291666666666667000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'FONE2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 544
        Top = 2
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1439.333333333333000000
          5.291666666666667000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'CATEGORIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 38
        Top = 2
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          100.541666666666700000
          5.291666666666667000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = q_Descricoes
        DataField = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 146
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
        74.083333333333340000
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
          42.333333333333340000
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
          121.708333333333400000)
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
      Top = 106
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
        Left = 655
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
          1733.020833333333000000
          21.166666666666670000
          259.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel3'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
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
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
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
        Name = 'd3'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 1
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  count(TBBOLETOS.NUMDOC) as NTITULOS,'
      '  sum(TBBOLETOS.VALORDOC) as TTITULOS,'
      '  TBBOLETOS.IDASSOCIADO,'
      '  W_ASSOCIADOS.ASSOCIADO,'
      '  W_ASSOCIADOS.SITUACAOFIN,'
      '  W_ASSOCIADOS.SITUACAO,'
      '  W_ASSOCIADOS.FONE1,'
      '  W_ASSOCIADOS.FONE2,'
      '  W_ASSOCIADOS.CODIGO,'
      '  W_ASSOCIADOS.CATEGORIA'
      'FROM'
      '  TBBOLETOS'
      
        '  INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIAD' +
        'OS.SEQUENCIA)'
      'WHERE '
      
        '  TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2 AND W_ASSOCIADOS.SI' +
        'TUACAOFIN=:d3'
      'group by'
      
        '   W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, W_ASSOCIADOS.S' +
        'ITUACAOFIN,   W_ASSOCIADOS.SITUACAO,  W_ASSOCIADOS.FONE1,  W_ASS' +
        'OCIADOS.FONE2,  W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA'
      ''
      '')
    Left = 57
    Top = 200
    object q_DescricoesNTITULOS: TIntegerField
      FieldName = 'NTITULOS'
    end
    object q_DescricoesTTITULOS: TBCDField
      FieldName = 'TTITULOS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object q_DescricoesASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Size = 80
    end
    object q_DescricoesIDASSOCIADO: TIntegerField
      FieldName = 'IDASSOCIADO'
    end
    object q_DescricoesSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 80
    end
    object q_DescricoesFONE1: TStringField
      FieldName = 'FONE1'
      FixedChar = True
      Size = 13
    end
    object q_DescricoesFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 13
    end
    object q_DescricoesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 80
    end
    object q_DescricoesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object DataSource2: TDataSource
    DataSet = q_Descricoes
    Left = 248
    Top = 200
  end
  object q_DescricaoTodos: TADOQuery
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
      end>
    SQL.Strings = (
      'SELECT '
      '  count(TBBOLETOS.NUMDOC) as NTITULOS,'
      '  sum(TBBOLETOS.VALORDOC) as TTITULOS,'
      '  TBBOLETOS.IDASSOCIADO,'
      '  W_ASSOCIADOS.ASSOCIADO,'
      '  W_ASSOCIADOS.SITUACAO,'
      '  W_ASSOCIADOS.FONE1,'
      '  W_ASSOCIADOS.FONE2,'
      '  W_ASSOCIADOS.CODIGO,'
      '  W_ASSOCIADOS.CATEGORIA'
      'FROM'
      '  TBBOLETOS'
      
        '  INNER JOIN W_ASSOCIADOS ON (TBBOLETOS.IDASSOCIADO = W_ASSOCIAD' +
        'OS.SEQUENCIA)'
      'WHERE '
      '  TBBOLETOS.DTVENCIMENTO BETWEEN :d1 AND :d2'
      'group by'
      
        '   W_ASSOCIADOS.ASSOCIADO, TBBOLETOS.IDASSOCIADO, TBBOLETOS.ABER' +
        'TO,   W_ASSOCIADOS.SITUACAO,  W_ASSOCIADOS.FONE1,  W_ASSOCIADOS.' +
        'FONE2,  W_ASSOCIADOS.CODIGO, W_ASSOCIADOS.CATEGORIA')
    Left = 143
    Top = 200
    object q_DescricaoTodosNTITULOS: TIntegerField
      FieldName = 'NTITULOS'
    end
    object q_DescricaoTodosTTITULOS: TBCDField
      FieldName = 'TTITULOS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object q_DescricaoTodosIDASSOCIADO: TIntegerField
      FieldName = 'IDASSOCIADO'
    end
    object q_DescricaoTodosASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Size = 80
    end
    object q_DescricaoTodosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 80
    end
    object q_DescricaoTodosFONE1: TStringField
      FieldName = 'FONE1'
      FixedChar = True
      Size = 13
    end
    object q_DescricaoTodosFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 13
    end
    object q_DescricaoTodosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 80
    end
    object q_DescricaoTodosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
end
