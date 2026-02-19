object f_Splash: Tf_Splash
  Left = 192
  Top = 114
  BorderStyle = bsNone
  Caption = 'f_Splash'
  ClientHeight = 341
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 341
    Align = alClient
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 0
    object Image1: TImage
      Left = 4
      Top = 4
      Width = 528
      Height = 333
      Align = alClient
      Transparent = True
    end
    object Label1: TLabel
      Left = 280
      Top = 60
      Width = 167
      Height = 32
      Caption = 'Sistema de'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 272
      Top = 124
      Width = 194
      Height = 32
      Caption = 'de Contratos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 256
      Top = 92
      Width = 231
      Height = 32
      Caption = 'Cadastramento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 144
      Top = 205
      Width = 264
      Height = 32
      Caption = 'M'#243'dulo de Testes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label6: TLabel
      Left = 16
      Top = 296
      Width = 186
      Height = 16
      Caption = 'Cl'#225'udio Aur'#233'lio Nascimento Bastos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 16
      Top = 312
      Width = 212
      Height = 16
      Caption = '(85) 9 9617-2784 - canbastos@gmail.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 420
      Top = 296
      Width = 98
      Height = 16
      Caption = 'Janeiro/2009'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 420
      Top = 312
      Width = 32
      Height = 16
      Caption = '2.0d'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object Timer1: TTimer
    Interval = 4000
    OnTimer = Timer1Timer
    Left = 184
    Top = 144
  end
end
