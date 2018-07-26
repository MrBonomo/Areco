object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 213
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 172
    Width = 448
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      448
      41)
    object btnSalvar: TButton
      Left = 282
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 364
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object edtID: TLabeledEdit
    Left = 24
    Top = 24
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    ReadOnly = True
    TabOrder = 1
  end
  object edtDescricao: TLabeledEdit
    Left = 24
    Top = 76
    Width = 401
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descricao'
    TabOrder = 2
  end
  object edtQtdEstoque: TLabeledEdit
    Left = 24
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantidade'
    TabOrder = 3
  end
  object edtPreco: TLabeledEdit
    Left = 304
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Pre'#231'o'
    TabOrder = 4
  end
end
