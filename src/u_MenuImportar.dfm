object f_MenuImportar: Tf_MenuImportar
  Left = 174
  Top = 210
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Menu Importa'#231#227'o'
  ClientHeight = 269
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 17
    Top = 232
    Width = 115
    Height = 32
    Action = acOk
    Caption = 'Ok [F5]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 133
    Top = 232
    Width = 115
    Height = 32
    Action = acFechar
    Caption = 'Fechar [F12]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 264
    Height = 137
    Align = alTop
    BiDiMode = bdLeftToRight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Boletos Gerados'
      'Recebimentos'
      'Cadastro Associados')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Enter
    OnEnter = RadioGroup1Enter
  end
  object Panel1: TPanel
    Left = 1
    Top = 178
    Width = 261
    Height = 22
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 3
    Top = 203
    Width = 258
    Height = 22
    TabOrder = 4
    Visible = False
  end
  object Button1: TButton
    Left = 0
    Top = 237
    Width = 16
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    Visible = False
    OnClick = Button1Click
  end
  object rdgTipoArquivo: TRadioGroup
    Left = 1
    Top = 137
    Width = 263
    Height = 40
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      'Arquivo Texto'
      'Arquivo Excel')
    ParentFont = False
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 216
    Top = 24
    object acOk: TAction
      Caption = 'Ok [F5]'
      ShortCut = 116
      OnExecute = acOkExecute
    end
    object acFechar: TAction
      Caption = 'Fechar [F12]'
      ShortCut = 123
      OnExecute = acFecharExecute
    end
  end
  object q_ProcVendas: TADOQuery
    Parameters = <
      item
        Name = 'dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'l'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select IDCODIGO, DATAMOVIMENTACAO, QTDLANCAMENTOS, VALORTOTAL, I' +
        'MPORTADO, IDLOJA from sysimportavendas'
      'where DATAMOVIMENTACAO=:dt'
      'and IDLOJA=:l')
    Left = 56
    Top = 352
    object q_ProcVendasIDCODIGO: TIntegerField
      FieldName = 'IDCODIGO'
    end
    object q_ProcVendasDATAMOVIMENTACAO: TDateField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object q_ProcVendasQTDLANCAMENTOS: TIntegerField
      FieldName = 'QTDLANCAMENTOS'
    end
    object q_ProcVendasVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object q_ProcVendasIMPORTADO: TIntegerField
      FieldName = 'IMPORTADO'
    end
  end
  object q_BuscaCliente: TADOQuery
    Parameters = <
      item
        Name = 'c'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select razaosocial, nomefantasia from tbclientes'
      'where codigogeral=:c')
    Left = 152
    Top = 296
    object q_BuscaClienteRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object q_BuscaClienteNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 50
    end
  end
  object q_BuscaVendedor: TADOQuery
    Parameters = <
      item
        Name = 'c'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select idcodigo, nomevendedor, codigogeral, codigofaucom from tb' +
        'vendedores'
      'where codigogeral=:c')
    Left = 56
    Top = 296
    object q_BuscaVendedorIDCODIGO: TIntegerField
      FieldName = 'IDCODIGO'
    end
    object q_BuscaVendedorNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      Size = 40
    end
    object q_BuscaVendedorCODIGOGERAL: TIntegerField
      FieldName = 'CODIGOGERAL'
    end
    object q_BuscaVendedorCODIGOFAUCOM: TIntegerField
      FieldName = 'CODIGOFAUCOM'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 176
  end
  object q_ProcDespesas: TADOQuery
    Parameters = <
      item
        Name = 'dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'l'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select IDCODIGO, DATAMOVIMENTACAO, QTDLANCAMENTOS, VALORTOTAL, I' +
        'MPORTADO, IDLOJA from sysimportadespesas'
      'where DATAMOVIMENTACAO=:dt'
      'AND IDLOJA=:l')
    Left = 152
    Top = 352
    object q_ProcDespesasIDCODIGO: TIntegerField
      FieldName = 'IDCODIGO'
    end
    object q_ProcDespesasDATAMOVIMENTACAO: TDateField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object q_ProcDespesasQTDLANCAMENTOS: TIntegerField
      FieldName = 'QTDLANCAMENTOS'
    end
    object q_ProcDespesasVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object q_ProcDespesasIMPORTADO: TIntegerField
      FieldName = 'IMPORTADO'
    end
  end
  object q_ProcReceitas: TADOQuery
    Parameters = <
      item
        Name = 'dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'l'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select IDCODIGO, DATAMOVIMENTACAO, QTDLANCAMENTOS, VALORTOTAL, I' +
        'MPORTADO from sysimportarecebimentos'
      'where DATAMOVIMENTACAO=:dt'
      'AND IDLOJA=:l')
    Left = 248
    Top = 352
    object q_ProcReceitasIDCODIGO: TIntegerField
      FieldName = 'IDCODIGO'
    end
    object q_ProcReceitasDATAMOVIMENTACAO: TDateField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object q_ProcReceitasQTDLANCAMENTOS: TIntegerField
      FieldName = 'QTDLANCAMENTOS'
    end
    object q_ProcReceitasVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object q_ProcReceitasIMPORTADO: TIntegerField
      FieldName = 'IMPORTADO'
    end
  end
end
