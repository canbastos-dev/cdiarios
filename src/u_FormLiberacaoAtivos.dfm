object f_FormLiberacaoAtivos: Tf_FormLiberacaoAtivos
  Left = 440
  Top = 93
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abertura de Libera'#231#227'o'
  ClientHeight = 432
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 125
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 54
      Height = 18
      Caption = 'T'#237'tulo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbTitulo: TLabel
      Left = 80
      Top = 16
      Width = 62
      Height = 18
      Caption = 'lbTitulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbAssociado: TLabel
      Left = 160
      Top = 16
      Width = 97
      Height = 18
      Caption = 'lbAssociado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 86
      Height = 18
      Caption = 'Categoria:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbCategoria: TLabel
      Left = 112
      Top = 48
      Width = 94
      Height = 18
      Caption = 'lbCategoria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 316
      Top = 48
      Width = 84
      Height = 18
      Caption = 'Atividade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbSituacao: TLabel
      Left = 404
      Top = 48
      Width = 85
      Height = 18
      Caption = 'lbSituacao'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 84
      Width = 150
      Height = 18
      Caption = 'Data da Consulta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbData: TLabel
      Left = 176
      Top = 84
      Width = 54
      Height = 18
      Caption = 'lbData'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 125
    Width = 576
    Height = 96
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 3
    TabOrder = 1
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 145
      Height = 18
      Caption = 'Valor Reativa'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbValorReativar: TLabel
      Left = 16
      Top = 48
      Width = 68
      Height = 18
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPrestacoes: TLabel
      Left = 184
      Top = 48
      Width = 46
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbValorTotal: TLabel
      Left = 256
      Top = 47
      Width = 105
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 184
      Top = 24
      Width = 187
      Height = 18
      Caption = 'Presta'#231#245'es em Aberto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 432
      Top = 24
      Width = 98
      Height = 18
      Caption = 'Total Geral:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lbGeral: TLabel
      Left = 432
      Top = 48
      Width = 89
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 367
    Width = 576
    Height = 65
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 10
      Top = 16
      Width = 134
      Height = 33
      Action = acAbrir
      Caption = 'Abrir Acordo [F4]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 455
      Top = 16
      Width = 109
      Height = 33
      Action = acFechar
      Caption = 'Fechar [F12]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object btLibera: TBitBtn
      Left = 317
      Top = 17
      Width = 136
      Height = 32
      Action = acLibBoleto
      Caption = 'Libera Boleto [F8]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btConciliacao: TBitBtn
      Left = 145
      Top = 16
      Width = 171
      Height = 33
      Action = acConciliacao
      Caption = 'Concilia'#231#227'o [F6]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 313
    Top = 223
    Width = 261
    Height = 142
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    TabOrder = 4
    Visible = False
    object Label10: TLabel
      Left = 23
      Top = 24
      Width = 203
      Height = 18
      Caption = 'C'#243'digo de Autoriza'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edSenha: TEdit
      Left = 63
      Top = 56
      Width = 121
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 87
      Top = 92
      Width = 75
      Height = 32
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000F8F8F8F8F8F8
        F8F8F8F8F8F8F8F8F8F9F9F9F9F8F8F8F8F8EAEAE9BAC2BB86A0896D8E706889
        6B748E769CA29CC7C6C7E9E8E9F8F7F7F8F9F8F9F8F8F8F8F8F7F7F7F8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8E3E7E5859E8834773C177E22
        117A1B0F781A0F781A117A1D167D212871324B684F9EA49EEAEBEAF8F8F8F8F8
        F8F8F7F9F8F8F8F8F8F8F8F8F8F8F7F9F8F8F8F8F9F7F7F8F7B8CABB317C3A0E
        751B26983233B4402DB83926B93529B83730B73E3BB84732A53D0A741521732C
        516B53CDCDCDF7F7F9F8F8F8F8F7F9F8F9F7F8F8F8F9F8F8F8F8F8F6F6F59BBA
        9E1B762228943547C05238BF452AB73827B3341EB82A1FB82D27B83635BF403F
        C04B4EC35B3DA44615781F3E6A44BBBEBCF9F8F7F8F8F8F7F8F8F8F8F8F9F8F9
        F7F9F7B7D3B917781F45AB4F52C15D44C15036BE4436AB41749F772CB03721B8
        2E28B83533BF403FBF4A4DC05659BF6362C06A14761E3D6A43CCCDCDF8F8F7F8
        F7F9F8F8F8F8F8F8E0ECE11B762457B46061BF6953C05D45BF5143AE4B7A937B
        B4B7B555905B29B6342AB83935BF4241BF4D4DBF5858C06469C07169C1721475
        20577359EBEBEBF9F9F9F8F8F8F8F9F852915625832D6DC17662C16C57C0604B
        A6537A957CCFCCCDF8F9F8C4CEC628803033BE413CC14944C14F4EBF5A5AC063
        67C06E72C37A50A858217328A4ACA5F8F8F8F8F8F8E1F5E117742080D08871C5
        7968C070478F519AAA9CD2D2D1F9F8F9F7F8F7F8F8F8AFB9B045A84C41C04F4A
        C05752BF5C5DC16668C1706FC27879CA820D721A4E6C53F1EFF0F7F9F673A779
        2A88337EC98877BD802F5532B1B8B3E5E6E7F6F8F8EEF6EF99B89CF8F8F8F4F5
        F49AB19C53B65B4FC05B55C05F5EC16967C0706EC57677C88055AE5E25722FCC
        CDCCF5FAF52C78355EAF6782C4887F967ED9D9DAF3F4F4F8F8F9F9F7F999BF9B
        55B65DECF7EDF9F7F9E9EAE989A28A60BB675DC16962C06B69C0706DC17675C7
        7F73C67B167A239FACA2F4FBF31D77287DCB8678C77F72C07990B993EFF2F0F9
        F8F8EBEEED5FB9675ABE6185BA8AF8F9F7F8F8F7E0E0E0829B8369BC7163BF6B
        69C16F6AC17372C77973C67A14761F729276F1F8F21C772878C78271C67968BF
        7064BF6B68BB6FAFC9B393C09961BF6A63C06C6BBC73E1ECE4F8F8F8F8F8F8E2
        E2E190A79267B16D6ABF7168C0716BC47570C9790E7017648969F1F8F21B7626
        71C77A69C07168C16F61C06960C06964BD6D69BF7069C17371C57976C77C84B7
        89F8F9F7F8F8F8F8F9F7E4E4E5A1AEA23F70406CBE7369C06F6AC2730E701862
        8968F4FAF51C76276AC47366C16F62C06A61C06963C06A69C27172C77979C780
        80C88785C98D88C78EABC3ADF8F8F7F8F8F8F8F8F8F4F4F4C6C8C7649B6769C0
        706CC57312731D85A68AF5FAF62C79364EAA5563C06A61BF6A61BF6A69BF7173
        C77C7FC98588C79091C89796C89B97C99D9AC79ECDD5CDF8F8F8F8F7F9F9F7F9
        F4F7F471B87769BF706DC773167A20C0CEC2F7F8F882B48620842B60BE6A61C0
        6964C16C70C5787CC8828BC88F95C89A9DC8A2A6CBA6A3CDA8A2CCA6A0C6A5E1
        E7E0F6F8F8F8F8F8EFF2EF6FC17863BF6D54B05D2B7933E8EBE9F8F8F8E6F9E7
        16731E6FCC7961BF6A67C16F76C87E84C88C95C99BA1CAA8AFD0B2B3D0B5B3D0
        B6AFCFB2A9CCAEA3C4A7E6EAE5FAF8F9F2F4F272C17B6CC3750E73177D9F80F7
        F8F9F8F8F8F7F9F762A46B1B802364C16B6BC0727AC7838DC9929EC9A3B0D0B3
        B8D1BCBED0BFBFD0C0B8D0BBB1D0B4A5CAA99BC6A1C6D0C6F5F9F674B97C4FAB
        5822772DE3EDE4F8F8F8F8F8F8F7F8F8ECF8EE2076273E9D476BBF737BC68491
        C898A3C9A6B4D0B7C1D0C2CAD0CBC6D0C8BCD0BEB3D0B5A7CBAC99C99D8FC595
        95C09A6CB77314761CB0CFB2F8F8F8F9F9F9F8F8F8F8F8F8F8F8F8D1EFD51773
        213F9E476FC2778DCA93A2CAA7B4D0B7C2D0C2C9D0CAC7D0C8BCD0BFB2CFB4A3
        CAA995CA9B7BC5836BC57311741B77A579F5F6F6F8F8F8F8F8F8F7F8F8F8F8F8
        F9F7F9F7F8F8CFECD21C75231C80246EC77678C07EA1D3A6B8D3BBC0D0C1BED0
        BFB4D1B7A7D4A97FC4876AC1753FA04813782091BE96F5F8F5F7F8F7F8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F9F8F8F9F7F9E6F6E84A945211741C26872E5BB563
        6AC5746AC37269C37369C47364C16D36994213761E2C7D34CBE5CEF7F8F8F8F7
        F9F8F7F9F8F8F8F8F8F8F7F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F7F9F7D4
        F0D957965F1E772910771A0C75150B75150E741920762A44864AB9DCBDF5FBF5
        F8F8F8F8F8F8F7F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FAF7F9F9F8F8F8F8
        F8F8F8F8F8F8F8F9F8F9F6F9F6F4F9F6E7F1E6D9E9DBD9E9DBE3F0E5F4FAF5F7
        FAF7F8F8F8F8F8F8F8F7F9F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8}
    end
  end
  object Panel5: TPanel
    Left = 4
    Top = 224
    Width = 306
    Height = 141
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    TabOrder = 3
    Visible = False
    object Label9: TLabel
      Left = 13
      Top = 53
      Width = 154
      Height = 18
      Caption = 'Pago Presta'#231#245'es:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 13
      Top = 93
      Width = 126
      Height = 36
      Caption = 'Considerar Dt Ult Pagto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 12
      Top = 14
      Width = 154
      Height = 18
      Caption = 'Pago Reativa'#231#227'o:'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 176
      Top = 96
      Width = 120
      Height = 26
      EditMask = '99/99/9999'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object Edit2: TEditNum1
      Left = 176
      Top = 56
      Width = 121
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Inteiro = 6
      ParentFont = False
      TabOrder = 0
      Text = '0,00'
    end
    object Edit1: TEditNum1
      Left = 176
      Top = 12
      Width = 121
      Height = 26
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Inteiro = 6
      ParentFont = False
      TabOrder = 2
      Text = '0,00'
    end
  end
  object Panel6: TPanel
    Left = 312
    Top = 224
    Width = 246
    Height = 133
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    TabOrder = 5
    Visible = False
    object rdgConciliacaoTotal: TRadioGroup
      Left = 24
      Top = 11
      Width = 209
      Height = 87
      Caption = ' Concilia'#231#227'o total por '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Items.Strings = (
        'Pagamento'
        'Cancelamento')
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 24
      Top = 106
      Width = 100
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn5: TBitBtn
      Left = 132
      Top = 106
      Width = 100
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object ActionList1: TActionList
    Left = 496
    Top = 24
    object acAbrir: TAction
      Caption = 'Abrir Acordo [F4]'
      ShortCut = 115
      OnExecute = acAbrirExecute
    end
    object acConciliacao: TAction
      Caption = 'Concilia'#231#227'o [F6]'
      ShortCut = 117
      OnExecute = acConciliacaoExecute
    end
    object acFechar: TAction
      Caption = 'Fechar [F12]'
      ShortCut = 123
      OnExecute = acFecharExecute
    end
    object acLibBoleto: TAction
      Caption = 'Libera Boleto [F8]'
      ShortCut = 119
      OnExecute = acLibBoletoExecute
    end
  end
  object Timer1: TTimer
    Interval = 40000
    OnTimer = Timer1Timer
    Left = 448
    Top = 64
  end
end
